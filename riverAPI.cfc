<cfcomponent>

    <!--- FUNCTION: GetRiverData --->
    <!--- Requires a given river gaugecode to be submitted --->
    <cffunction name="GetRiverData" returnFormat="JSON" access="remote">

        <cfargument name="gaugecode" required="true" type="string" default="none">

        <!--- Get Latest Observation Data for the Given River Gauge --->
        <cfhttp url="https://water.weather.gov/ahps2/rss/obs/#gaugecode#.rss" result="observationresult">
        <cfset river.observed.title = XMLParse(observationresult.filecontent).rss.channel.item.title.xmlText>
        <cfset river.observed.link = XMLParse(observationresult.filecontent).rss.channel.item.link.xmlText>
        <cfset river.observed.description =XMLParse(observationresult.filecontent).rss.channel.item.description.xmlText>
        <cfset river.observed.pubdate = XMLParse(observationresult.filecontent).rss.channel.item.pubdate.xmlText>
        <cfset river.observed.lat = XMLParse(observationresult.filecontent).rss.channel.item.lat.xmlText>
        <cfset river.observed.long = XMLParse(observationresult.filecontent).rss.channel.item.long.xmlText>


        <!--- Get Lastest Forecast Data for the the Given River Gauge --->
        <cfhttp url="https://water.weather.gov/ahps2/rss/fcst/#gaugecode#.rss" result="forecastresult">
        <cfset river.forecast.title = XMLParse(forecastresult.filecontent).rss.channel.item.xmlChildren[1].xmlText>
        <cfset river.forecast.link = XMLParse(forecastresult.filecontent).rss.channel.item.xmlChildren[2].xmlText>
        <cfset river.forecast.description = XMLParse(forecastresult.filecontent).rss.channel.item.xmlChildren[3].xmlText>
        <cfset river.forecast.pubdate = XMLParse(forecastresult.filecontent).rss.channel.item.xmlChildren[5].xmlText>
        <cfset river.forecast.lat = XMLParse(forecastresult.filecontent).rss.channel.item.xmlChildren[6].xmlText>
        <cfset river.forecast.long = XMLParse(forecastresult.filecontent).rss.channel.item.xmlChildren[7].xmlText>


        <cfreturn river>

    </cffunction>
    <!--- End of Function: GetRiverData --->



</cfcomponent>