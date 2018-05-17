<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <!-- Fonts and Page CSS -->
    <link href="https://fonts.googleapis.com/css?family=Kavivanar" rel="stylesheet">
    <link href="pagestyles.css" rel="stylesheet">

    <title>River Data Viewer</title>
  </head>
  <body>

    <div class="container-fluid">

        <div class="row">
            <div class="col col-xs-12">
                <h3>ted-sandbox River Data API Viewer</h3>
            </div>
        </div>

        <div class="row">
            <div class="col col-xs-12">
                <h6>Created by Todd Edwards, May 16th, 2018</h6>
                <h7>Core Tech used for this prototype project:  AWS EC2 Instance, ColdFusion (Server API and Landing page), JS (Landing Page), CSS, HTML5, Bootstrap v4</h7><br>
                <h7>This Project's Github: <a href="https://github.com/ted-sandbox/riverdataAPI.git" target="_blank">https://github.com/ted-sandbox/riverdataAPI.git</a> </h7><br>
                <h7>Primary project data source originates from: <a href="https://water.weather.gov" target="_blank">https://water.weather.gov</a></h7>
            </div>
        </div>
        <hr>
        <h7>Directions: Select a river reporting station to view real-time NOAA river conditions and river forecast data.</h7>
        <hr>
        <br>
        <div class="row">
            <div class="col col-xs-3">
                <h3 class="riverheading">Mononaghela River</h3>
                <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Select Reporting Station
                </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                        <button class="dropdown-item" type="button" onclick="getRiverData('bddp1')">@Braddock</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('chrp1')">@Charleroi</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('elzp1')">@Elizabeth</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('gylp1')">@Grays Landing</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('maxp1')">@Maxwell</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('pmrp1')">@Point Marion</button>

                    </div>
                </div>
                <br>
            </div>

            <div class="col col-xs-3">
                <h3 class="riverheading">Ohio River</h3>
                <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Select Reporting Station
                </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                        <button class="dropdown-item" type="button" onclick="getRiverData('pttp1')">@Pittsburgh</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('dshp1')">@Daschields</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('emsp1')">@Emsworth</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('mgyp1')">@Montgomery</button>
                    </div>
                </div>
                <br>
            </div>



             <div class="col col-xs-3">
                <h3 class="riverheading">Youghiogheny River</h3>
                <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Select Reporting Station
                </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                        <button class="dropdown-item" type="button" onclick="getRiverData('ygop1')">@Outflow</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('cnfp1')">@Confluence</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('oplp1')">@Ohiopyle</button>
                        <button class="dropdown-item" type="button" onclick="getRiverData('cllp1')">@Connellsville</button>
                    </div>
                </div>
                <br>
            </div>


            <div class="col col-xs-3">
                <h3 class="riverheading">Casselman River</h3>
                <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Select Reporting Station
                </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                        <button class="dropdown-item" type="button" onclick="getRiverData('makp1')">@Markleton</button>
                    </div>
                </div>
                <br>
            </div>

        </div>
        <br>
        <hr>
        <div class="row justify-content-center">
            
            <div class="col col-sm-12 col-md-6">
                <div class="card">
                    <h5 class="card-header" id="obtitle">Current River Conditions</h5>
                    <div class="card-body">
                        <p class="card-text" id="obdescription"></p>
                    </div>
                </div>
            </div>

            <div class="col col-sm-12 col-md-6">
                <div class="card">
                    <h5 class="card-header" id="fortitle">River Forecast</h5>
                    <div class="card-body">
                        <p class="card-text" id="fordescription"></p>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
  
  
    <script>

        function getRiverData(gaugecode) {

            var riverurl = 'riverAPI.cfc?method=GetRiverData&gaugecode=' + gaugecode;

            $.ajax({url: riverurl, success: function(result){

                //console the result that comes back from the ajax call
                console.log(JSON.parse(result));
                
                //capture the JSON result as an object
                var someriverdata = JSON.parse(result);
                
                //swap out the title on the observation card for the current selection's title
                $("#obtitle").html(someriverdata.OBSERVED.TITLE);

                //swap out the description on the observation card for the current selections description
                $("#obdescription").html(someriverdata.OBSERVED.DESCRIPTION);


                //swap out the title on the forecast card for the current selection's title
                $("#fortitle").html(someriverdata.FORECAST.TITLE);

                //swap out the description on the observation card for the current selections description
                $("#fordescription").html(someriverdata.FORECAST.DESCRIPTION);
                
            }});

        } //end of getRiverData

    </script>
  
  
  </body>
</html>