<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="temp_Search.aspx.cs" Inherits="Demonstration.temp_Search" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<html>
<head>
    <!-- Icon Link -->
	<link rel="icon" href="imageFolder/zoophy.ico" />

	<!-- Link tags for CSS -->
	<link type="text/css" rel="stylesheet" href="style/main_style.css" />

    <title>Zoophy Search</title>

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCPcnzLBmwkbqGeldpjr2X3yY74c_uPXpg&sensor=false"></script>
    <script type="text/javascript">
        var invisColor = "#FFFFFF";
        var outlineColor = "#0ABA02";   //green
        var red = "#FF0000"; //red

        var Coord;
        var county;
        var table = 210217
        var geo = 'col4'
        var state = 'col1'
        var selState;

        //jquery animation function
        //Note: comment out the contents of this function if you do not want to use jquery with the map
        function extend() {
            //  $('.dropbox').animate({ height: '25' }, 100);
            //  $('.dropbox').css('padding-top', '5px');
        }

        //map initialization
        function initializeMap() {
            var latlng = new google.maps.LatLng(38.5, -97.5);
            var myOptions = {
                zoom: 4,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
            var x = document.getElementById('hVirus').value;
            //alert(x);
            if (x == "N") { LoadCounties() };
            // searchRegion("ca");
        }

        //colors polygons white
        var deSelectedOptions = {

            styles: [{
                polygonOptions: {
                    strokeColor: invisColor,
                    strokeOpacity: 1,
                    strokeWeight: 2,
                    fillColor: invisColor,
                    fillOpacity: .01
                }

            }]
        }
        //colors polygons red
        var selectedOptions = {

            styles: [{
                polygonOptions: {
                    strokeColor: red,
                    strokeOpacity: 1,
                    strokeWeight: 2,
                    fillColor: invisColor,
                    fillOpacity: .01
                }

            }]
        }


        //checks to see if there is white space within the input field
        function isBlank(str) {
            return (!str || /^\s*$/.test(str));
        }


        function updateGenes() {
            var virusLst = document.getElementById("VirusLstBox");
            var geneLst = document.getElementById("GeneLstBox");
            var lenVirus = document.getElementById("VirusLstBox").length;
            var virus;
            for (var i = 0; i < lenVirus; i++) {
                if (document.getElementById("VirusLstBox").options[i].selected) {
                    //alert(virusLst[i].value);
                    virus = virusLst[i].value;//current virus selected
                }
            }
            if (virus == "119210" || virus == "114727" || virus == "102793")//if influenza
            {


                if (geneLst[0].value != "PB2") {//if we do not already have influenza Genes

                    geneLst.length = 0; //clear list box

                    var PB2 = document.createElement("option");
                    PB2.value = "1";
                    PB2.text = "PB2";
                    geneLst.add(PB2, null); //add PB2
                    var PB1 = document.createElement("option");
                    PB1.value = "2";
                    PB1.text = "PB1";
                    geneLst.add(PB1, null); //add PB1
                    var PA = document.createElement("option");
                    PA.value = "3";
                    PA.text = "PA";
                    geneLst.add(PA, null); //add PA
                    var HA = document.createElement("option");
                    HA.value = "4";
                    HA.text = "HA";
                    geneLst.add(HA, null); //add HA
                    var NP = document.createElement("option");
                    NP.value = "5";
                    NP.text = "NP";
                    geneLst.add(NP, null); //add NP
                    var NA = document.createElement("option");
                    NA.value = "6";
                    NA.text = "NA";
                    geneLst.add(NA, null); //add NA
                    var M = document.createElement("option");
                    M.value = "7";
                    M.text = "M";
                    geneLst.add(M, null); //add M
                    var NS = document.createElement("option");
                    NS.value = "8";
                    NS.text = "NS";
                    geneLst.add(NS, null); //add NS
                    var whole = document.createElement("option");
                    whole.value = "9";
                    whole.text = "Whole Genome";
                    geneLst.add(whole, null); //add whole genome

                } //end adding influenza genes
            }//end if influenza
            else if (virus == "11292") {//if rabies

                if (geneLst[0].value != "N") {//if we do not already have rabies Genes
                    geneLst.length = 0; //clear list box

                    var N = document.createElement("option");
                    N.value = "N";
                    N.text = "N";
                    geneLst.add(N, null); //add N
                    var G = document.createElement("option");
                    G.value = "G";
                    G.text = "G";
                    geneLst.add(G, null); //add G
                    var whole = document.createElement("option");
                    whole.value = "Whole Genome";
                    whole.text = "Whole Genome";
                    geneLst.add(whole, null); //add whole genome

                } //end adding rabies genes
            } //end if rabies
            else if (virus == "11082") {//if WNV
                if (geneLst[0].value != "E")//if we do not already have WNV genes
                {
                    geneLst.length = 0; //clear list box
                    var E = document.createElement("option");
                    E.value = "E";
                    E.text = "E";
                    geneLst.add(E, null); //add E
                    var whole = document.createElement("option");
                    whole.value = "Whole Genome";
                    whole.text = "Whole Genome";
                    geneLst.add(whole, null); //add whole genome

                }//end adding WNV genes
            }//end if WNV
        }//end function updateGenes()

        function LoadCounties() {
            usa = new google.maps.FusionTablesLayer({
                suppressInfoWindows: false,
                // query: "select " + geo + " from " + table + " where 'col3' <= 'B' "
                query: {
                    select: 'col4',
                    from: '210217'
                    //Select all states with name of A
                },

                //default polygon shape
                styles: [{
                    polygonOptions: {
                        strokeColor: invisColor,
                        strokeOpacity: 0.01,
                        strokeWeight: .01,
                        fillColor: invisColor,
                        fillOpacity: .01
                    }

                }]

            });

            usa.setMap(map);

            var isClicked = new Boolean(false);

            google.maps.event.addListener(usa, 'click', function (e) {


                //select the State-County code from the value the user clicked
                selState = e.row["State Abbr."].value;
                county = e.row["State-County"].value;
                //Coord = e.row["geometry"].value;
                //alert(county)
                document.getElementById("textboxRegion").value = county; extend();
                //document.getElementById("StateName").innerHTML = selState; extend();
                // document.getElementById("Coord").innerHTML = Coord; extend();
                //display the county on the bottom of the page
                usa.setOptions({

                    suppressInfoWindows: false,
                    //show information on user click on map
                    styles: [{
                        //default

                        polygonOptions: {
                            fillColor: "#FFFFFF",
                            fillOpacity: 0.3,
                            strokeColor: "#FFFFFF",
                            strokeWeight: 1
                        },
                        where: "'State Abbr.' = '" + selState + "'",
                        polygonOptions: {
                            //fillColor: "#808080",
                            fillOpacity: 0.2,
                            strokeColor: "#FFFFFF",
                            strokeWeight: 1
                        }
                    }, {
                        //color the polygon differently if the polygon has this particular state-county
                        where: "'State-County' = '" + county + "'",
                        polygonOptions: {
                            fillColor: "#FFCC20",
                            strokeWeight: 3,
                            fillOpacity: .5,
                            strokeColor: "#FF0000"
                        }
                    }]
                });
                // drawSelected(selected, county);
                usa.setMap(map);
            });
            //test function. colors the whole map, instead of just the object with the state-county


            function drawSelected(map, value) {

                var theseOptions = {
                    styles: [{
                        suppressInfoWindows: false,
                        from: '210217',
                        where: "'State-County' = '" + value + "'",
                        polygonOptions: {
                            strokeColor: '#000000',
                            strokeOpacity: 3,
                            strokeWeight: 3,
                            fillColor: '#000000',
                            fillOpacity: 1
                        }

                    }]
                }
                map.setOptions(theseOptions);
            }
        }
        function clearFrom()//clear default years 'YYYY'
        {
            var fromTxtBox = document.getElementById("fromTxtBox");
            if (fromTxtBox.value == "YYYY") fromTxtBox.value = "";
        } //end function clearFrom()

        function clearTo()//clear default years 'YYYY'
        {
            var toTxtBox = document.getElementById("toTxtBox");
            if (toTxtBox.value == "YYYY") toTxtBox.value = "";

        }//end function clearTo()

        function checkFrom() {//make sure entry is valid in the 'From' field
            var pattern = new RegExp("\\d\\d\\d\\d");
            var fromTxtBox = document.getElementById("fromTxtBox");
            var entry = fromTxtBox.value;
            if (pattern.test(entry) == false) {
                alert("Please enter a valid year");
                fromTxtBox.value = "YYYY"; //clear entry
            }

            toTxtBox = document.getElementById("toTxtBox");
            if (toTxtBox.value != "YYYY")//if user has entered a valid year in the 'To' box
            {
                fromInt = Math.floor(entry); //cast string to int 
                toInt = Math.floor(toTxtBox.value); //cast string to in

                if (fromInt > toInt) {
                    alert("The year in the \"From\" field cannot be greater than the year in the \"To\" field");
                    fromTxtBox.value = "YYYY"; //clear entry
                }
            } //end toTxtBox.value !='YYYY'
            fromInt = Math.floor(entry);
            if (fromInt < 1970)//make sure year is not less than 1970
            {
                alert("The year in the \"From\" field cannot be less than 1970");
                fromTxtBox.value = "YYYY"; //clear entry
            }

        }//end function checkFrom()

        function checkTo() {//make sure entry is valid in the 'To' field
            var pattern = new RegExp("\\d\\d\\d\\d");
            var toTxtBox = document.getElementById("toTxtBox");
            var entry = toTxtBox.value;
            if (pattern.test(entry) == false) {
                alert("Please enter a valid year");
                toTxtBox.value = "YYYY"; //clear entry
            }

            fromTxtBox = document.getElementById("fromTxtBox");
            if (fromTxtBox.value != "YYYY")//if user has entered a valid year in the 'To' box
            {
                toInt = Math.floor(entry); //cast string to int 
                fromInt = Math.floor(fromTxtBox.value); //cast string to in

                if (toInt < fromInt) {
                    alert("The year in the \"To\" field cannot be less than the year in the \"From\" field");
                    toTxtBox.value = "YYYY"; //clear entry
                }
            } //end fromTxtBox.value != "YYYY"
            toInt = Math.floor(entry);
            var currentYear = new Date().getFullYear();
            if (toInt > currentYear)//make sure year is not greater than current
            {
                alert("The year in the \"To\" field cannot be greater than \"" + currentYear + "\"");
                toTxtBox.value = "YYYY"; //clear entry
            }

        }//end function checkTo()

        function USA() {//show or hide USA
            var country = document.getElementById("countryLstBox");
            var USA = document.getElementById("stateLstBox");
            var USALbl = document.getElementById("StatesLbl");
            if (country.value == "6252001")//if USA is selected
            {
                USA.style.visibility = "visible"; //make it visible
                USALbl.style.visibility = "visible";
            }
            else {
                USA.style.visibility = "hidden"; //make it visible
                USALbl.style.visibility = "hidden";
            }

        }//end function USA()



        function updateCountries() {//update country list based on continent choice
            var countries = new Array();
            // countries = { 'Afghanistan': 'Asia','Albania':'Europe' ,'Algeria': 'Africa', 'Angola': 'Africa', 'Antarctica': 'Antarctica', 'Argentina': 'South America','Armenia':'Asia','Australia': 'Oceania', 'Austria': 'Europe', 'Azerbaijan': 'Asia', 'Bahrain': 'Asia', 'Bangladesh': 'Asia', 'Barbados': 'North America', 'Belarus': 'Europe', 'Belgium': 'Europe', 'Benin': 'Africa', 'Bhutan': 'Asia', 'Bolivia': 'South America', 'Bosnia and Herzegovina': 'Europe', 'Brazil': 'South America','Brunei':'Asia','Bulgaria': 'Europe', 'Burkina Faso': 'Africa', 'Cambodia': 'Asia', 'Cameroon': 'Africa', 'Canada': 'North America', 'Central African Republic': 'Africa', 'Chile': 'South America', 'China': 'Asia', 'Columbia': 'South America','Congo':'Africa','Cook Islands': 'Oceania', 'Costa Rica': 'North America', 'Cote dIvoire': 'Africa', 'Croatia': 'Europe', 'Cuba': 'North America', 'Cypress': 'Asia', 'Czech Republic': 'Europe', 'Denmark': 'Europe', 'Djibouti': 'Africa', 'Dominican Republic': 'North America', 'Ecuador': 'South America', 'Egypt': 'Africa', 'El Salvador': 'North America', 'Estonia': 'Europe', 'Ethiopia': 'Africa', 'Fiji': 'Oceania', 'Finland': 'Europe', 'France': 'Europe', 'French Guiana': 'South America', 'French Polynesia': 'Oceania','Georgia': 'Asia', 'Germany': 'Europe', 'Ghana': 'Africa', 'Greece': 'Europe', 'Guadeloupe': 'North America', 'Guam': 'Oceania', 'Guatemala': 'North America','Guinea':'Africa','Haiti': 'North America', 'Honduras': 'North America', 'Hong Kong': 'Asia', 'Hungary': 'Europe', 'Iceland': 'Europe', 'India': 'Asia', 'Indonesia': 'Asia', 'Iran': 'Asia', 'Iraq': 'Asia', 'Ireland': 'Europe', 'Israel': 'Asia', 'Italy': 'Europe', 'Jamaica': 'North America', 'Japan': 'Asia', 'Jordan': 'Asia', 'Kazakhstan': 'Asia', 'Kenya': 'Africa', 'Kosovo': 'Europe', 'Kuwait': 'Asia', 'Kyrgyzstan': 'Asia', 'Laos': 'Asia', 'Latvia': 'Europe', 'Lebanon': 'Asia','Liberia':'Africa','Libya': 'Africa', 'Lithuania': 'Europe', 'Luxembourg': 'Europe', 'Macau': 'Asia', 'Madagascar': 'Africa','Malawi':'Africa','Malaysia': 'Asia', 'Mali': 'Africa', 'Mauritius': 'Africa', 'Mexico': 'North America', 'Mongolia': 'Asia', 'Montserrat': 'North America', 'Morocco': 'Africa', 'Mozambique': 'Africa', 'Myanmar': 'Asia','Namibia':'Africa','Nepal': 'Asia', 'Netherlands': 'Europe', 'New Caledonia': 'Oceania', 'New Zealand': 'Oceania', 'Nicaragua': 'North America', 'Niger': 'Africa', 'Nigeria': 'Africa', 'North Korea': 'Asia', 'Northern Mariana Islands': 'Oceania', 'Norway': 'Europe', 'Oman': 'Asia', 'Pakistan': 'Asia', 'Panama': 'North America', 'Papua New Guinea': 'Oceania', 'Paraguay': 'South America', 'Peru': 'South America', 'Philippines': 'Asia', 'Poland': 'Europe', 'Portugal': 'Europe', 'Puerto Rico': 'North America', 'Qatar': 'Asia', 'Romania': 'Europe', 'Russia': 'Europe','Rwanda':'Africa','Saudi Arabia': 'Asia', 'Senegal': 'Africa', 'Serbia': 'Europe','Sierra Leone':'Africa','Singapore': 'Asia', 'Slovakia': 'Europe', 'Slovenia': 'Europe', 'Solomon Islands': 'Oceania', 'South Africa': 'Africa', 'South Korea': 'Asia', 'Spain': 'Europe', 'Sri Lanka': 'Asia', 'Sudan': 'Africa', 'Sweden': 'Europe', 'Switzerland': 'Europe','Syria':'Asia' ,'Taiwan': 'Asia', 'Tazania': 'Africa', 'Thailand': 'Asia', 'Togo': 'Africa', 'Tonga': 'Oceania', 'Trinidad and Tobago': 'North America', 'Tunisia': 'Africa', 'Turkey': 'Asia', 'Turkmenistan': 'Asia', 'USA': 'North America', 'Uganda': 'Africa', 'Ukraine': 'Europe', 'United Arab Emirates': 'Asia', 'United Kingdom': 'Europe', 'Uruguay': 'South America', 'Uzebekistan': 'Asia', 'Venezuela': 'South America', 'Vietnam': 'Asia', 'West Bank': 'Asia', 'Zambia': 'Africa', 'Zimbabwe': 'Africa' };
            countries = { "Afghanistan": "Asia", "Albania": "Europe", "Algeria": "Africa", "Angola": "Africa", "Antarctica": "Antarctica", "Argentina": "South America", "Armenia": "Asia", "Aruba": "North America", "Australia": "Oceania", "Austria": "Europe", "Azerbaijan": "Asia", "Bahrain": "Asia", "Bangladesh": "Asia", "Barbados": "North America", "Belarus": "Europe", "Belgium": "Europe", "Benin": "Africa", "Bhutan": "Asia", "Bolivia": "South America", "Bosnia and Herzegovina": "Europe", "Botswana": "Africa", "Brazil": "South America", "Brunei": "Asia", "Bulgaria": "Europe", "Burkina Faso": "Africa", "Cambodia": "Asia", "Cameroon": "Africa", "Canada": "North America", "Central African Republic": "Africa", "Chad": "Africa", "Chile": "South America", "China": "Asia", "Columbia": "South America", "Congo": "Africa", "Cook Islands": "Oceania", "Costa Rica": "North America", "Cote dIvoire": "Africa", "Croatia": "Europe", "Cuba": "North America", "Curacao": "North America", "Cypress": "Asia", "Czech Republic": "Europe", "Denmark": "Europe", "Djibouti": "Africa", "Dominican Republic": "North America", "Ecuador": "South America", "Egypt": "Africa", "El Salvador": "North America", "Estonia": "Europe", "Ethiopia": "Africa", "Falkland Islands": "South America", "Fiji": "Oceania", "Finland": "Europe", "France": "Europe", "French Guiana": "South America", "French Polynesia": "Oceania", "Georgia": "Asia", "Germany": "Europe", "Ghana": "Africa", "Greece": "Europe", "Guadeloupe": "North America", "Guam": "Oceania", "Guatemala": "North America", "Guinea": "Africa", "Guyana": "South America", "Haiti": "North America", "Honduras": "North America", "Hong Kong": "Asia", "Hungary": "Europe", "Iceland": "Europe", "India": "Asia", "Indonesia": "Asia", "Iran": "Asia", "Iraq": "Asia", "Ireland": "Europe", "Israel": "Asia", "Italy": "Europe", "Jamaica": "North America", "Japan": "Asia", "Jordan": "Asia", "Kazakhstan": "Asia", "Kenya": "Africa", "Kosovo": "Europe", "Kuwait": "Asia", "Kyrgyzstan": "Asia", "Laos": "Asia", "Latvia": "Europe", "Lebanon": "Asia", "Liberia": "Africa", "Lichtenstein": "Europe", "Libya": "Africa", "Lithuania": "Europe", "Luxembourg": "Europe", "Macau": "Asia", "Macedonia": "Europe", "Madagascar": "Africa", "Malawi": "Africa", "Malaysia": "Asia", "Mali": "Africa", "Malta": "Europe", "Mauritius": "Africa", "Mexico": "North America", "Moldova": "Europe", "Moncao": "Europe", "Mongolia": "Asia", "Montenegro": "Europe", "Montserrat": "North America", "Morocco": "Africa", "Mozambique": "Africa", "Myanmar": "Asia", "Namibia": "Africa", "Nepal": "Asia", "Netherlands": "Europe", "New Caledonia": "Oceania", "New Zealand": "Oceania", "Nicaragua": "North America", "Niger": "Africa", "Nigeria": "Africa", "North Korea": "Asia", "Northern Mariana Islands": "Oceania", "Norway": "Europe", "Oman": "Asia", "Pakistan": "Asia", "Panama": "North America", "Papua New Guinea": "Oceania", "Paraguay": "South America", "Peru": "South America", "Philippines": "Asia", "Poland": "Europe", "Portugal": "Europe", "Puerto Rico": "North America", "Qatar": "Asia", "Romania": "Europe", "Russia": "Europe", "Rwanda": "Africa", "Samoa": "Oceania", "Saudi Arabia": "Asia", "Senegal": "Africa", "Serbia": "Europe", "Sierra Leone": "Africa", "Singapore": "Asia", "Slovakia": "Europe", "Slovenia": "Europe", "Solomon Islands": "Oceania", "Somalia": "Africa", "South Africa": "Africa", "South Korea": "Asia", "South Sudan": "Africa", "Spain": "Europe", "Sri Lanka": "Asia", "Sudan": "Africa", "Suriname": "South America", "Sweden": "Europe", "Switzerland": "Europe", "Syria": "Asia", "Taiwan": "Asia", "Tajikistan": "Asia", "Tazania": "Africa", "Thailand": "Asia", "Togo": "Africa", "Tonga": "Oceania", "Trinidad and Tobago": "North America", "Tunisia": "Africa", "Turkey": "Asia", "Turkmenistan": "Asia", "USA": "North America", "Uganda": "Africa", "Ukraine": "Europe", "United Arab Emirates": "Asia", "United Kingdom": "Europe", "Uruguay": "South America", "Uzebekistan": "Asia", "Venezuela": "South America", "Vietnam": "Asia", "West Bank": "Asia", "Yemen": "Asia", "Zambia": "Africa", "Zimbabwe": "Africa" };
            countriesID = { "Afghanistan": "6255152", "Albania": "783754", "Algeria": "2589581", "Angola": "3351879", "Antarctica": "6255152", "Argentina": "3865483", "Armenia": "174982", "Aruba": "3577279", "Australia": "2077456", "Austria": "2782113", "Azerbaijan": "587116", "Bahrain": "290291", "Bangladesh": "1210997", "Barbados": "3374084", "Belarus": "630336", "Belgium": "2802361", "Benin": "2395170", "Bhutan": "1252634", "Bolivia": "3923057", "Bosnia and Herzegovina": "3277605", "Botswana": "933860", "Brazil": "3469034", "Brunei": "1820814", "Bulgaria": "732800", "Burkina Faso": "2361809", "Cambodia": "1831722", "Cameroon": "2233387", "Canada": "6251999", "Central African Republic": "239880", "Chad": "2434508", "Chile": "3895114", "China": "1814991", "Columbia": "3686110", "Congo": "203312", "Cook Islands": "1899402", "Costa Rica": "3624060", "Cote dIvoire": "2287781", "Croatia": "3202326", "Cuba": "3562981", "Curacao": "7626836", "Cypress": "146669", "Czech Republic": "3077311", "Denmark": "2623032", "Djibouti": "223816", "Dominican Republic": "3508796", "Ecuador": "3658394", "Egypt": "357994", "El Salvador": "3585968", "Estonia": "453733", "Ethiopia": "337996", "Falkland Islands": "3474414", "Fiji": "2205218", "Finland": "660013", "France": "3017382", "French Guiana": "3381670", "French Polynesia": "4030656", "Georgia": "614540", "Germany": "2921044", "Ghana": "2300660", "Greece": "390903", "Guadeloupe": "3579143", "Guam": "4043988", "Guatemala": "3595528", "Guinea": "2420477", "Guyana": "3378535", "Haiti": "3723988", "Honduras": "3608932", "Hong Kong": "1819730", "Hungary": "719819", "Iceland": "2629691", "India": "1269750", "Indonesia": "1643084", "Iran": "130758", "Iraq": "99237", "Ireland": "2963597", "Israel": "294640", "Italy": "3175395", "Jamaica": "3489940", "Japan": "1861060", "Jordan": "248816", "Kazakhstan": "1522867", "Kenya": "192950", "Kosovo": "831053", "Kuwait": "285570", "Kyrgyzstan": "1527747", "Laos": "1655842", "Latvia": "458258", "Lebanon": "272103", "Liberia": "2275384", "Lichtenstein": "3042058", "Libya": "2215636", "Lithuania": "597427", "Luxembourg": "2960313", "Macau": "1821275", "Macedonia": "718075", "Madagascar": "1062947", "Malawi": "927384", "Malaysia": "1733045", "Mali": "2453866", "Malta": "2562770", "Mauritius": "934292", "Mexico": "3996063", "Moldova": "617790", "Monaco": "2993457", "Mongolia": "2029969", "Montenegro": "3194884", "Montserrat": "3578097", "Morocco": "2542007", "Mozambique": "1036973", "Myanmar": "1327865", "Namibia": "3355338", "Nepal": "1282988", "Netherlands": "2750405", "New Caledonia": "2139685", "New Zealand": "2186224", "Nicaragua": "3617476", "Niger": "2440476", "Nigeria": "2328926", "North Korea": "1873107", "Northern Mariana Islands": "4041468", "Norway": "3144096", "Oman": "286963", "Pakistan": "1168579", "Panama": "3703430", "Papua New Guinea": "2088628", "Paraguay": "3437598", "Peru": "3932488", "Philippines": "1694008", "Poland": "798544", "Portugal": "2264397", "Puerto Rico": "4566966", "Qatar": "289688", "Romania": "798549", "Russia": "2017370", "Rwanda": "49518", "Samoa": "4034894", "Saudi Arabia": "102358", "Senegal": "2245662", "Serbia": "6290252", "Sierra Leone": "2403846", "Singapore": "1880251", "Slovakia": "3057568", "Slovenia": "3190538", "Solomon Islands": "2103350", "Somalia": "51537", "South Africa": "953987", "South Korea": "1835841", "South Sudan": "7909807", "Spain": "2510769", "Sri Lanka": "1227603", "Sudan": "366755", "Suriname": "3382998", "Sweden": "2661886", "Switzerland": "2658434", "Syria": "163843", "Taiwan": "1668284", "Tajikistan": "1220409", "Tazania": "149590", "Thailand": "1605651", "Togo": "2363686", "Tonga": "4032283", "Trinidad and Tobago": "3573591", "Tunisia": "2464461", "Turkey": "298795", "Turkmenistan": "1218197", "USA": "6252001", "Uganda": "226074", "Ukraine": "690791", "United Arab Emirates": "290557", "United Kingdom": "2635167", "Uruguay": "3439705", "Uzebekistan": "1512440", "Venezuela": "3625428", "Vietnam": "1562822", "West Bank": "6254930", "Yemen": "69543", "Zambia": "895949", "Zimbabwe": "878675" };

            var continent = document.getElementById("continentLstBox");
            var countryLst = document.getElementById("countryLstBox");
            countryLst.length = 0; //reset list
            if (continent[0].selected == true) {//if All selected
                for (var index in countries) {

                    var newCountry = document.createElement("option");
                    newCountry.text = index.toString();
                    for (var index2 in countriesID) {
                        if (index2 == newCountry.text) {
                            newCountry.value = countriesID[index2];//assign Geonames ID
                        }
                    }
                    countryLst.add(newCountry, null); //add country to list
                }
            }//end continent[0].selected == true
            else if (continent[1].selected == true) {//Africa
                for (var index in countries) {
                    var continent = countries[index];
                    if (continent.toString() == "Africa")//only if africa
                    {
                        var newCountry = document.createElement("option");
                        newCountry.text = index.toString();
                        for (var index2 in countriesID) {
                            if (index2 == newCountry.text) {
                                newCountry.value = countriesID[index2]; //assign Geonames ID
                            }
                        }
                        countryLst.add(newCountry, null); //add country to list

                    }//end if
                }//end for
            }//end if Africa
            else if (continent[2].selected == true) {//Antarctica

                for (var index in countries) {
                    var continent = countries[index];
                    if (continent.toString() == "Antarctica")//only if Antarctica
                    {
                        var newCountry = document.createElement("option");
                        newCountry.text = index.toString();
                        newCountry.value = "6255152";//Antarctica Geonames ID
                        countryLst.add(newCountry, null); //add country to list
                    } //end if
                } //end for
            }//end Antarctica
            else if (continent[3].selected == true) {//Asia
                for (var index in countries) {
                    var continent = countries[index];
                    if (continent.toString() == "Asia")//only if Asia
                    {
                        var newCountry = document.createElement("option");
                        newCountry.text = index.toString();
                        for (var index2 in countriesID) {
                            if (index2 == newCountry.text) {
                                newCountry.value = countriesID[index2]; //assign Geonames ID
                            }
                        }
                        countryLst.add(newCountry, null); //add country to list
                    } //end if
                } //end for
            }//end Asia
            else if (continent[4].selected == true) {//Europe
                for (var index in countries) {
                    var continent = countries[index];
                    if (continent.toString() == "Europe")//only if africa
                    {
                        var newCountry = document.createElement("option");
                        newCountry.text = index.toString();
                        for (var index2 in countriesID) {
                            if (index2 == newCountry.text) {
                                newCountry.value = countriesID[index2]; //assign Geonames ID
                            }
                        }
                        countryLst.add(newCountry, null); //add country to list
                    } //end if
                } //end for
            }//end Europe
            else if (continent[5].selected == true) {//North America
                for (var index in countries) {
                    var continent = countries[index];
                    if (continent.toString() == "North America")//only if africa
                    {
                        var newCountry = document.createElement("option");
                        newCountry.text = index.toString();
                        for (var index2 in countriesID) {
                            if (index2 == newCountry.text) {
                                newCountry.value = countriesID[index2]; //assign Geonames ID
                            }
                        }
                        countryLst.add(newCountry, null); //add country to list
                    } //end if
                } //end for
            }//end North America
            else if (continent[6].selected == true) {//Oceania
                for (var index in countries) {
                    var continent = countries[index];
                    if (continent.toString() == "Oceania")//only if africa
                    {
                        var newCountry = document.createElement("option");
                        newCountry.text = index.toString();
                        for (var index2 in countriesID) {
                            if (index2 == newCountry.text) {
                                newCountry.value = countriesID[index2]; //assign Geonames ID
                            }
                        }
                        countryLst.add(newCountry, null); //add country to list
                    } //end if
                } //end for
            }//end Oceania
            else if (continent[7].selected == true) {//South America
                for (var index in countries) {
                    var continent = countries[index];
                    if (continent.toString() == "South America")//only if africa
                    {
                        var newCountry = document.createElement("option");
                        newCountry.text = index.toString();
                        for (var index2 in countriesID) {
                            if (index2 == newCountry.text) {
                                newCountry.value = countriesID[index2]; //assign Geonames ID
                            }
                        }
                        countryLst.add(newCountry, null); //add country to list
                    } //end if
                } //end for
            }//end South America
        } //end function updateCountries

        function Aves() {//show or hide Aves
            var host = document.getElementById("hostLst");
            var aves = document.getElementById("avesLst");

            if (host.value == "8782")//if Avian is selected
            {
                aves.style.visibility = "visible"; //make it visible


            }
            else {
                aves.style.visibility = "hidden"; //make it visible
                aves.text = "";
                aves.value = "";
            }
        } //end function Aves()

        function clearSelections() {//clear user selections

            //first set countries to 'All'
            var countries = new Array();
            //countries = { 'Afghanistan': 'Asia', 'Algeria': 'Africa', 'Angola': 'Africa', 'Antarctica': 'Antarctica', 'Argentina': 'South America','Aruba':'North America','Australia': 'Oceania', 'Austria': 'Europe', 'Azerbaijan': 'Asia', 'Bahrain': 'Asia', 'Bangladesh': 'Asia', 'Barbados': 'North America', 'Belarus': 'Europe', 'Belgium': 'Europe', 'Benin': 'Africa', 'Bhutan': 'Asia', 'Bolivia': 'South America', 'Bosnia and Herzegovina': 'Europe','Botswana':'Africa','Brazil': 'South America', 'Bulgaria': 'Europe', 'Burkina Faso': 'Africa', 'Cambodia': 'Asia', 'Cameroon': 'Africa', 'Canada': 'North America', 'Central African Republic': 'Africa','Chad':'Africa','Chile': 'South America', 'China': 'Asia', 'Columbia': 'South America', 'Cook Islands': 'Oceania', 'Costa Rica': 'North America', 'Cote dIvoire': 'Africa', 'Croatia': 'Europe', 'Cuba': 'North America','Curacao':'North America' ,'Cypress': 'Europe', 'Czech Republic': 'Europe', 'Denmark': 'Europe', 'Djibouti': 'Africa', 'Dominican Republic': 'North America', 'Ecuador': 'South America', 'Egypt': 'Africa', 'El Salvador': 'North America', 'Estonia': 'Europe', 'Ethiopia': 'Africa','Falkland Islands':'South America','Fiji': 'Oceania', 'Finland': 'Europe', 'France': 'Europe', 'French Guiana': 'South America', 'French Polynesia': 'Oceania', 'Gaza Strip': 'Asia', 'Georgia': 'Asia', 'Germany': 'Europe', 'Ghana': 'Africa', 'Greece': 'Europe', 'Guadeloupe': 'North America', 'Guam': 'Oceania', 'Guatemala': 'North America','Guyana':'South America','Haiti': 'North America', 'Honduras': 'North America', 'Hong Kong': 'Asia', 'Hungary': 'Europe', 'Iceland': 'Europe', 'India': 'Asia', 'Indonesia': 'Asia', 'Iran': 'Asia', 'Iraq': 'Asia', 'Ireland': 'Europe', 'Israel': 'Asia', 'Italy': 'Europe', 'Jamaica': 'North America', 'Japan': 'Asia', 'Jordan': 'Asia', 'Kazakhstan': 'Asia', 'Kenya': 'Africa', 'Kosovo': 'Europe', 'Kuwait': 'Asia', 'Kyrgyzstan': 'Asia', 'Laos': 'Asia', 'Latvia': 'Europe', 'Lebanon': 'Asia','Lichtenstein':'Europe','Libya': 'Africa', 'Lithuania': 'Europe', 'Luxembourg': 'Europe', 'Macau': 'Asia','Macedonia':'Europe','Madagascar': 'Africa', 'Malaysia': 'Asia', 'Mali': 'Africa','Malta':'Europe','Mauritius': 'Africa', 'Mexico': 'North America','Moldova':'Europe','Monaco':'Europe','Mongolia': 'Asia','Montenegro':'Europe','Montserrat': 'North America', 'Morocco': 'Africa', 'Mozambique': 'Africa', 'Myanmar': 'Asia', 'Nepal': 'Asia', 'Netherlands': 'Europe', 'New Caledonia': 'Oceania', 'New Zealand': 'Oceania', 'Nicaragua': 'North America', 'Niger': 'Africa', 'Nigeria': 'Africa', 'North Korea': 'Asia', 'Northern Mariana Islands': 'Oceania', 'Norway': 'Europe', 'Oman': 'Asia', 'Pakistan': 'Asia', 'Panama': 'North America', 'Papua New Guinea': 'Oceania', 'Paraguay': 'South America', 'Peru': 'South America', 'Philippines': 'Asia', 'Poland': 'Europe', 'Portugal': 'Europe', 'Puerto Rico': 'North America', 'Qatar': 'Asia', 'Romania': 'Europe', 'Russia': 'Europe','Samoa':'Oceania','Saudi Arabia': 'Asia', 'Senegal': 'Africa', 'Serbia': 'Europe', 'Singapore': 'Asia', 'Slovakia': 'Europe', 'Slovenia': 'Europe', 'Solomon Islands': 'Oceania','Somalia':'Africa' ,'South Africa': 'Africa', 'South Korea': 'Asia','South Sudan':'Africa','Spain': 'Europe', 'Sri Lanka': 'Asia', 'Sudan': 'Africa','Suriname':'South America','Sweden': 'Europe', 'Switzerland': 'Europe', 'Taiwan': 'Asia','Tajikistan':'Asia','Tazania': 'Africa', 'Thailand': 'Asia', 'Togo': 'Africa', 'Tonga': 'Oceania', 'Trinidad and Tobago': 'North America', 'Tunisia': 'Africa', 'Turkey': 'Asia', 'Turkmenistan': 'Asia', 'USA': 'North America', 'Uganda': 'Africa', 'Ukraine': 'Europe', 'United Arab Emirates': 'Asia', 'United Kingdom': 'Europe', 'Uruguay': 'South America', 'Uzebekistan': 'Asia', 'Venezuela': 'South America', 'Vietnam': 'Asia', 'West Bank': 'Asia','Yemen':'Asia','Zambia': 'Africa', 'Zimbabwe': 'Africa' };
            countries = { "Afghanistan": "Asia", "Albania": "Europe", "Algeria": "Africa", "Angola": "Africa", "Antarctica": "Antarctica", "Argentina": "South America", "Armenia": "Asia", "Aruba": "North America", "Australia": "Oceania", "Austria": "Europe", "Azerbaijan": "Asia", "Bahrain": "Asia", "Bangladesh": "Asia", "Barbados": "North America", "Belarus": "Europe", "Belgium": "Europe", "Benin": "Africa", "Bhutan": "Asia", "Bolivia": "South America", "Bosnia and Herzegovina": "Europe", "Botswana": "Africa", "Brazil": "South America", "Brunei": "Asia", "Bulgaria": "Europe", "Burkina Faso": "Africa", "Cambodia": "Asia", "Cameroon": "Africa", "Canada": "North America", "Central African Republic": "Africa", "Chad": "Africa", "Chile": "South America", "China": "Asia", "Columbia": "South America", "Congo": "Africa", "Cook Islands": "Oceania", "Costa Rica": "North America", "Cote dIvoire": "Africa", "Croatia": "Europe", "Cuba": "North America", "Curacao": "North America", "Cypress": "Asia", "Czech Republic": "Europe", "Denmark": "Europe", "Djibouti": "Africa", "Dominican Republic": "North America", "Ecuador": "South America", "Egypt": "Africa", "El Salvador": "North America", "Estonia": "Europe", "Ethiopia": "Africa", "Falkland Islands": "South America", "Fiji": "Oceania", "Finland": "Europe", "France": "Europe", "French Guiana": "South America", "French Polynesia": "Oceania", "Georgia": "Asia", "Germany": "Europe", "Ghana": "Africa", "Greece": "Europe", "Guadeloupe": "North America", "Guam": "Oceania", "Guatemala": "North America", "Guinea": "Africa", "Guyana": "South America", "Haiti": "North America", "Honduras": "North America", "Hong Kong": "Asia", "Hungary": "Europe", "Iceland": "Europe", "India": "Asia", "Indonesia": "Asia", "Iran": "Asia", "Iraq": "Asia", "Ireland": "Europe", "Israel": "Asia", "Italy": "Europe", "Jamaica": "North America", "Japan": "Asia", "Jordan": "Asia", "Kazakhstan": "Asia", "Kenya": "Africa", "Kosovo": "Europe", "Kuwait": "Asia", "Kyrgyzstan": "Asia", "Laos": "Asia", "Latvia": "Europe", "Lebanon": "Asia", "Liberia": "Africa", "Lichtenstein": "Europe", "Libya": "Africa", "Lithuania": "Europe", "Luxembourg": "Europe", "Macau": "Asia", "Macedonia": "Europe", "Madagascar": "Africa", "Malawi": "Africa", "Malaysia": "Asia", "Mali": "Africa", "Malta": "Europe", "Mauritius": "Africa", "Mexico": "North America", "Moldova": "Europe", "Moncao": "Europe", "Mongolia": "Asia", "Montenegro": "Europe", "Montserrat": "North America", "Morocco": "Africa", "Mozambique": "Africa", "Myanmar": "Asia", "Namibia": "Africa", "Nepal": "Asia", "Netherlands": "Europe", "New Caledonia": "Oceania", "New Zealand": "Oceania", "Nicaragua": "North America", "Niger": "Africa", "Nigeria": "Africa", "North Korea": "Asia", "Northern Mariana Islands": "Oceania", "Norway": "Europe", "Oman": "Asia", "Pakistan": "Asia", "Panama": "North America", "Papua New Guinea": "Oceania", "Paraguay": "South America", "Peru": "South America", "Philippines": "Asia", "Poland": "Europe", "Portugal": "Europe", "Puerto Rico": "North America", "Qatar": "Asia", "Romania": "Europe", "Russia": "Europe", "Rwanda": "Africa", "Samoa": "Oceania", "Saudi Arabia": "Asia", "Senegal": "Africa", "Serbia": "Europe", "Sierra Leone": "Africa", "Singapore": "Asia", "Slovakia": "Europe", "Slovenia": "Europe", "Solomon Islands": "Oceania", "Somalia": "Africa", "South Africa": "Africa", "South Korea": "Asia", "South Sudan": "Africa", "Spain": "Europe", "Sri Lanka": "Asia", "Sudan": "Africa", "Suriname": "South America", "Sweden": "Europe", "Switzerland": "Europe", "Syria": "Asia", "Taiwan": "Asia", "Tajikistan": "Asia", "Tazania": "Africa", "Thailand": "Asia", "Togo": "Africa", "Tonga": "Oceania", "Trinidad and Tobago": "North America", "Tunisia": "Africa", "Turkey": "Asia", "Turkmenistan": "Asia", "USA": "North America", "Uganda": "Africa", "Ukraine": "Europe", "United Arab Emirates": "Asia", "United Kingdom": "Europe", "Uruguay": "South America", "Uzebekistan": "Asia", "Venezuela": "South America", "Vietnam": "Asia", "West Bank": "Asia", "Yemen": "Asia", "Zambia": "Africa", "Zimbabwe": "Africa" };
            countriesID = { "Afghanistan": "6255152", "Albania": "783754", "Algeria": "2589581", "Angola": "3351879", "Antarctica": "6255152", "Argentina": "3865483", "Armenia": "174982", "Aruba": "3577279", "Australia": "2077456", "Austria": "2782113", "Azerbaijan": "587116", "Bahrain": "290291", "Bangladesh": "1210997", "Barbados": "3374084", "Belarus": "630336", "Belgium": "2802361", "Benin": "2395170", "Bhutan": "1252634", "Bolivia": "3923057", "Bosnia and Herzegovina": "3277605", "Botswana": "933860", "Brazil": "3469034", "Brunei": "1820814", "Bulgaria": "732800", "Burkina Faso": "2361809", "Cambodia": "1831722", "Cameroon": "2233387", "Canada": "6251999", "Central African Republic": "239880", "Chad": "2434508", "Chile": "3895114", "China": "1814991", "Columbia": "3686110", "Congo": "203312", "Cook Islands": "1899402", "Costa Rica": "3624060", "Cote dIvoire": "2287781", "Croatia": "3202326", "Cuba": "3562981", "Curacao": "7626836", "Cypress": "146669", "Czech Republic": "3077311", "Denmark": "2623032", "Djibouti": "223816", "Dominican Republic": "3508796", "Ecuador": "3658394", "Egypt": "357994", "El Salvador": "3585968", "Estonia": "453733", "Ethiopia": "337996", "Falkland Islands": "3474414", "Fiji": "2205218", "Finland": "660013", "France": "3017382", "French Guiana": "3381670", "French Polynesia": "4030656", "Georgia": "614540", "Germany": "2921044", "Ghana": "2300660", "Greece": "390903", "Guadeloupe": "3579143", "Guam": "4043988", "Guatemala": "3595528", "Guinea": "2420477", "Guyana": "3378535", "Haiti": "3723988", "Honduras": "3608932", "Hong Kong": "1819730", "Hungary": "719819", "Iceland": "2629691", "India": "1269750", "Indonesia": "1643084", "Iran": "130758", "Iraq": "99237", "Ireland": "2963597", "Israel": "294640", "Italy": "3175395", "Jamaica": "3489940", "Japan": "1861060", "Jordan": "248816", "Kazakhstan": "1522867", "Kenya": "192950", "Kosovo": "831053", "Kuwait": "285570", "Kyrgyzstan": "1527747", "Laos": "1655842", "Latvia": "458258", "Lebanon": "272103", "Liberia": "2275384", "Lichtenstein": "3042058", "Libya": "2215636", "Lithuania": "597427", "Luxembourg": "2960313", "Macau": "1821275", "Macedonia": "718075", "Madagascar": "1062947", "Malawi": "927384", "Malaysia": "1733045", "Mali": "2453866", "Malta": "2562770", "Mauritius": "934292", "Mexico": "3996063", "Moldova": "617790", "Monaco": "2993457", "Mongolia": "2029969", "Montenegro": "3194884", "Montserrat": "3578097", "Morocco": "2542007", "Mozambique": "1036973", "Myanmar": "1327865", "Namibia": "3355338", "Nepal": "1282988", "Netherlands": "2750405", "New Caledonia": "2139685", "New Zealand": "2186224", "Nicaragua": "3617476", "Niger": "2440476", "Nigeria": "2328926", "North Korea": "1873107", "Northern Mariana Islands": "4041468", "Norway": "3144096", "Oman": "286963", "Pakistan": "1168579", "Panama": "3703430", "Papua New Guinea": "2088628", "Paraguay": "3437598", "Peru": "3932488", "Philippines": "1694008", "Poland": "798544", "Portugal": "2264397", "Puerto Rico": "4566966", "Qatar": "289688", "Romania": "798549", "Russia": "2017370", "Rwanda": "49518", "Samoa": "4034894", "Saudi Arabia": "102358", "Senegal": "2245662", "Serbia": "6290252", "Sierra Leone": "2403846", "Singapore": "1880251", "Slovakia": "3057568", "Slovenia": "3190538", "Solomon Islands": "2103350", "Somalia": "51537", "South Africa": "953987", "South Korea": "1835841", "South Sudan": "7909807", "Spain": "2510769", "Sri Lanka": "1227603", "Sudan": "366755", "Suriname": "3382998", "Sweden": "2661886", "Switzerland": "2658434", "Syria": "163843", "Taiwan": "1668284", "Tajikistan": "1220409", "Tazania": "149590", "Thailand": "1605651", "Togo": "2363686", "Tonga": "4032283", "Trinidad and Tobago": "3573591", "Tunisia": "2464461", "Turkey": "298795", "Turkmenistan": "1218197", "USA": "6252001", "Uganda": "226074", "Ukraine": "690791", "United Arab Emirates": "290557", "United Kingdom": "2635167", "Uruguay": "3439705", "Uzebekistan": "1512440", "Venezuela": "3625428", "Vietnam": "1562822", "West Bank": "6254930", "Yemen": "69543", "Zambia": "895949", "Zimbabwe": "878675" };

            var continent = document.getElementById("continentLstBox");
            var countryLst = document.getElementById("countryLstBox");
            countryLst.length = 0; //reset list
            for (var index in countries) {
                var newCountry = document.createElement("option");
                newCountry.text = index.toString();
                for (var index2 in countriesID) {
                    if (index2 == newCountry.text) {
                        newCountry.value = countriesID[index2]; //assign Geonames ID
                    }
                }
                countryLst.add(newCountry, null); //add country to list
            }

            //set focus of continent lidt box to 'All'
            continent.value = "All";

            var USA = document.getElementById("stateLstBox");
            var USALbl = document.getElementById("StatesLbl");

            //hide USA
            USA.style.visibility = "hidden";
            USALbl.style.visibility = "hidden";
            USA.value = "";//clear focus



            //change years to 'YYYY'
            var fromTxtBox = document.getElementById("fromTxtBox");
            var toTxtBox = document.getElementById("toTxtBox");
            fromTxtBox.value = "YYYY";
            toTxtBox.value = "YYYY";

            //clear Host selection
            var hosts = document.getElementById("HostTxtBox");
            hosts.value = "";

            //set virus selection to H3N2
            var virusLst = document.getElementById("VirusLstBox");
            virusLst.length = 0; //clear current selection
            var newH3N2 = document.createElement("option");
            newH3N2.text = "H3N2 Influenza A";
            newH3N2.value = "119210";
            virusLst.add(newH3N2, null); //add H3N2
            var newPDM09 = document.createElement("option");
            newPDM09.text = "H1N1 pdm09 Influenza A";
            newPDM09.value = "114727";
            virusLst.add(newPDM09, null); //add pdm09
            var newH5N1 = document.createElement("option");
            newH5N1.text = "H5N1 Influenza A";
            newH5N1.value = "102793";
            virusLst.add(newH5N1, null); //add H5N1
            var newRabies = document.createElement("option");
            newRabies.text = "Rabies";
            newRabies.value = "11292";
            virusLst.add(newRabies, null); //add Rabies
            var newWNV = document.createElement("option");
            newWNV.text = "West Nile Virus";
            newWNV.value = "11082";
            virusLst.add(newWNV, null); //add WNV
            virusLst.value = "119210";//set focus to H3N2

            //set gene selection to PB2
            var geneLst = document.getElementById("GeneLstBox");
            geneLst.length = 0;//clear gene list
            var PB2 = document.createElement("option");
            PB2.value = "PB2";
            PB2.text = "PB2";
            geneLst.add(PB2, null); //add PB2
            var PB1 = document.createElement("option");
            PB1.value = "PB1";
            PB1.text = "PB1";
            geneLst.add(PB1, null); //add PB1
            var PA = document.createElement("option");
            PA.value = "PA";
            PA.text = "PA";
            geneLst.add(PA, null); //add PA
            var HA = document.createElement("option");
            HA.value = "HA";
            HA.text = "HA";
            geneLst.add(HA, null); //add HA
            var NP = document.createElement("option");
            NP.value = "NP";
            NP.text = "NP";
            geneLst.add(NP, null); //add NP
            var NA = document.createElement("option");
            NA.value = "NA";
            NA.text = "NA";
            geneLst.add(NA, null); //add NA
            var M = document.createElement("option");
            M.value = "M";
            M.text = "M";
            geneLst.add(M, null); //add M
            var NS = document.createElement("option");
            NS.value = "NS";
            NS.text = "NS";
            geneLst.add(NS, null); //add NS
            var whole = document.createElement("option");
            whole.value = "Whole Genome";
            whole.text = "Whole Genome";
            geneLst.add(whole, null); //add whole genome
            geneLst.value = "PB2"; //set focus to PB2


            //advanced settings
            var mcmc = $get('<%=this.mcmcTxtBox.ClientID %>'); //get mcmc client-side
                mcmc.value = "";
                var samp = $get('<%=this.sampTxtBox.ClientID %>');
                samp.value = "";
                var mdl = $get('<%=this.MdlLst.ClientID %>');
                mdl.value = "";
                var ig = $get('<%=this.InvGamLst.ClientID %>');
                ig.value = "";

            } //end function clearSelections()

            function checkMCMC() {
                var pattern = new RegExp("^\\d+$");
                var mcmc = $get('<%=this.mcmcTxtBox.ClientID %>');//get mcmc client-side
                var text = mcmc.value.replace(/,/g, "");
                text = removeZeros(text);

                if (pattern.test(text) == false) {
                    alert("Please enter a valid number such as 10,000,000");
                    mcmc.value = "10,000,000"; //clear entry
                }
                else {
                    var textInt = Math.floor(text); //cast string to int
                    if (textInt < 10000000) {
                        alert("Minimum must be atleast 10,000,000");
                        mcmc.value = "10,000,000"; //clear entry
                    }
                    else {
                        mcmc.value = addCommas(text);
                    }
                }

            }//end function check MCMC

            function removeZeros(num) {

                if (num.indexOf('.') > -1) {
                    var start = num.indexOf('.');
                    num = num.substring(0, start);

                    return num;
                }
                else return num;
            }


            function addCommas(num) {
                num += '';
                x = num.split('.');
                x1 = x[0];
                x2 = x.length > 1 ? '.' + x[1] : '';
                var rgx = /(\d+)(\d{3})/;
                while (rgx.test(x1)) {
                    x1 = x1.replace(rgx, '$1' + ',' + '$2');
                }
                return x1 + x2;
            }//end function addcomma

            function checkSamp() {
                var pattern = new RegExp("^\\d+$");
                var samp = $get('<%=this.sampTxtBox.ClientID %>'); //get mcmc client-sid
    var text = samp.value;
    text = text.replace(/,/g, ""); //temp remove commas
    text = removeZeros(text);
    if (pattern.test(text) == false) {
        alert("Please enter a valid number such as 1,000");
        samp.value = "1,000"; //clear entry
    }
    else {
        var textInt = Math.floor(text); //cast string to int
        if (textInt < 1000) {
            alert("Minimum must be atleast 1,000");
            samp.value = "1,000"; //clear entry
        }
        else {
            samp.value = addCommas(text);

        }

    }
}//end function checkSamp
function clearMCMC()//clear default MCMC '10,000'
{
    var mcmc = $get('<%=this.mcmcTxtBox.ClientID %>');//get client-side
                if (mcmc.value == "10,000,000") mcmc.value = "";

            } //end function clearMCMC()

            function clearSamp() {//clear default sampling of MCM '1,000'
                var samp = $get('<%=this.sampTxtBox.ClientID %>');
                if (samp.value == "1,000") samp.value = "";
            }//end function clearSamp

            //for accordionHeaderSelected, background-image: url('Files/arrow_collapse_arrow.png');
            //for header,  background: url('Files/arrow_collapse_arrow_closed.png') no-repeat 0 3px;

            function clearMdl() {//clear substitution models
                var samp = $get('<%=this.sampTxtBox.ClientID %>');
            }



    </script>
    <style type="text/css">
        .accordion
        {
            width: 400px;
        }
        .header
        {
            border: 1px solid #2F4F4F;
            color: White;
            cursor: pointer;
            background-color: #2E4D7B;
            font-family: Arial, Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            padding: 5px;
            margin-top:5px;
            cursor: pointer;
        }
        
     
        
        .headerSelected
        {
             
            border: 1px solid #2F4F4F;
            color: White;
            background-color: #5078B3;
            font-family: Arial, Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            padding: 5px;
            margin-top:5px;
            cursor: pointer;
        }
        .content
        {
            background-color: #D3DEEF;
            border: 1px dashed #2F4F4F;
            border-top: none;
            padding: 5px;
            padding-top: 10px;
        }
        
        .style1
        {
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
            width: 97px;
        }
        .style3
        {
            font-weight: bold;
            width: 125px;
        }
        .style4
        {
            font-weight: bold;
            width: 208px;
        }
    </style>
</head>

<body onload="">
    <form id="form1" runat="server">
        <div id="page">
			 
				        <div class="feature-inner">
					        <span class="maintext">
						        <a href="Default.aspx"><img src="imageFolder/zoophy.png" /></a>	
					        </span>
				        </div>
           
                    <header id="header">
				        <div id="header-inner">	
					        <div id="logo">	
					        </div>
					        <div id="top-nav">
						        <ul>
                                    <li>
							        Profile
							        <ul>
							          <a href="login.aspx"><li>Login</li></a>
							          <a href="signup.aspx"><li>Register</li></a>
							        </ul>
						          </li>
						          <li>
							        Queries
							        <ul>
							          <a href="search.aspx"><li>New Query</li></a>
							          <a href="viewJobs.aspx"><li>View Queries</li></a>
							        </ul>
						          </li>
						          <a href="about.aspx"><li>About</li></a>
						          <a href="contact.aspx"><li>Contact</li></a>
						        </ul>
					        </div>
					        </div>
					
				        </div>
			        </header>

        
    <asp:Panel ID="VirusPanel" runat="server" Wrap="False">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
  
        <br />
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    <asp:Label ID="VirusLbl" runat="server" Font-Bold="True" Text="1. Virus"></asp:Label>
                </td>
               
                <td class="style1" colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <asp:ListBox ID="VirusLstBox" runat="server" AutoPostBack="false" Height="85px">
                        <asp:ListItem Selected="True" Value="119210">H3N2 Influenza A</asp:ListItem>
                        <asp:ListItem Value="114727">H1N1 pdm09 Influenza A</asp:ListItem>
                        <asp:ListItem Value="102793">H5N1 Influenza A</asp:ListItem>
                        <asp:ListItem Value="11292">Rabies</asp:ListItem>
                        <asp:ListItem Value="11082">West Nile Virus</asp:ListItem>
                    </asp:ListBox>
                    </ContentTemplate>
                   </asp:UpdatePanel>
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="GeneLbl" runat="server" style="font-weight: 700" Text="2. Gene"></asp:Label>
                </td>
                <td class="style1" colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <asp:ListBox ID="GeneLstBox" runat="server" Height="150px" Width="118px" 
                        SelectionMode="Multiple">
                        <asp:ListItem Selected="True">PB2</asp:ListItem>
                        <asp:ListItem>PB1</asp:ListItem>
                        <asp:ListItem>PA</asp:ListItem>
                        <asp:ListItem>HA</asp:ListItem>
                        <asp:ListItem>NP</asp:ListItem>
                        <asp:ListItem>NA</asp:ListItem>
                        <asp:ListItem>M</asp:ListItem>
                        <asp:ListItem>NS</asp:ListItem>
                        <asp:ListItem>Whole Genome</asp:ListItem>
                    </asp:ListBox>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="HostLbl" runat="server" style="font-weight: 700" Text="3. Host"></asp:Label>
                </td>
                <td class="style3">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                   <ContentTemplate>
                    <asp:ListBox ID="hostLst" runat="server" Height="150px" Width="118px" 
                        SelectionMode="Multiple">
                        <asp:ListItem Selected="True" Value="32523">All</asp:ListItem>
                        <asp:ListItem Value="8782">Avian</asp:ListItem>
                        <asp:ListItem Value="9397">Bat</asp:ListItem>
                        <asp:ListItem Value="9913">Bovine</asp:ListItem>
                        <asp:ListItem Value="9836">Camel</asp:ListItem>
                        <asp:ListItem Value="9673">Civet</asp:ListItem>
                        <asp:ListItem Value="9615">Dog</asp:ListItem>
                        <asp:ListItem Value="9685">Cat</asp:ListItem>
                        <asp:ListItem Value="9793">Donkey</asp:ListItem>
                        <asp:ListItem Value="9669">Ferret</asp:ListItem>
                        <asp:ListItem Value="9796">Horse</asp:ListItem>
                        <asp:ListItem Value="9606">Human</asp:ListItem>
                        <asp:ListItem Value="319699">Mule</asp:ListItem>
                        <asp:ListItem Value="10060">Muskrat</asp:ListItem>
                        <asp:ListItem Value="212257">Panda</asp:ListItem>
                        <asp:ListItem Value="9654">Raccoon</asp:ListItem>
                        <asp:ListItem Value="9823">Swine</asp:ListItem>
                    </asp:ListBox>
                    </ContentTemplate>
                     </asp:UpdatePanel>
                </td>
                <td class="style4">
                  <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <asp:ListBox ID="avesLst" runat="server" Height="150px" Width="204px" 
                        SelectionMode="Multiple">
                        <asp:ListItem Value="290047">African Stonechat</asp:ListItem>
                        <asp:ListItem Value="75857">American Black Duck</asp:ListItem>
                        <asp:ListItem Value="75836">American Green-winged Teal</asp:ListItem>
                        <asp:ListItem Value="496005">American Kestrel</asp:ListItem>
                        <asp:ListItem Value="9188">American Robin</asp:ListItem>
                        <asp:ListItem Value="75832">American Widgeon</asp:ListItem>
                        <asp:ListItem Value="8924">Andean Condor</asp:ListItem>
                        <asp:ListItem Value="40180">Arabian Partridge</asp:ListItem>
                        <asp:ListItem Value="119635">Armenian Gull</asp:ListItem>
                        <asp:ListItem Value="45638">Australian Shelduck</asp:ListItem>
                        <asp:ListItem Value="9173">Babbler</asp:ListItem>
                        <asp:ListItem Value="56278">Baikal Teal</asp:ListItem>
                        <asp:ListItem Value="52644">Bald Eagle</asp:ListItem>
                        <asp:ListItem Value="105513">Baltimore Oriole</asp:ListItem>
                        <asp:ListItem Value="8846">Bar-headed Goose</asp:ListItem>
                        <asp:ListItem Value="40177">Barbary Partridge</asp:ListItem>
                        <asp:ListItem Value="184711">Barnacle Goose</asp:ListItem>
                        <asp:ListItem Value="43150">Barn Swallow</asp:ListItem>
                        <asp:ListItem Value="541010">Bewick's Swan</asp:ListItem>
                        <asp:ListItem Value="52810">Black Kite</asp:ListItem>
                        <asp:ListItem Value="9187">Blackbird</asp:ListItem>
                        <asp:ListItem Value="274062">Black-capped Lory</asp:ListItem>
                        <asp:ListItem Value="241766">Black-crested Bulbul</asp:ListItem>
                        <asp:ListItem Value="1192867">Black-headed Gull</asp:ListItem>
                        <asp:ListItem Value="198026">Black Scoter</asp:ListItem>
                        <asp:ListItem Value="75842">Blue-winged Teal</asp:ListItem>
                        <asp:ListItem Value="28727">Blue Jay</asp:ListItem>
                        <asp:ListItem Value="8971">Brahminy Kite</asp:ListItem>
                        <asp:ListItem Value="328044">Brown-headed Gull</asp:ListItem>
                        <asp:ListItem Value="13146">Budgerigar</asp:ListItem>
                        <asp:ListItem Value="279934">Bufflehead</asp:ListItem>
                        <asp:ListItem Value="141853">Cactus Wren</asp:ListItem>
                        <asp:ListItem Value="8853">Canada Goose</asp:ListItem>
                        <asp:ListItem Value="73323">Canary Islands Kinglet</asp:ListItem>
                        <asp:ListItem Value="110915">Canvasback</asp:ListItem>
                        <asp:ListItem Value="13114">Chattering Lory</asp:ListItem>
                        <asp:ListItem Value="9031">Chicken</asp:ListItem>
                        <asp:ListItem Value="9078">Chukar Partridge</asp:ListItem>
                        <asp:ListItem Value="75840">Cinnamon Teal</asp:ListItem>
                        <asp:ListItem Value="35549">Cockatoo</asp:ListItem>
                        <asp:ListItem Value="76058">Common Eider</asp:ListItem>
                        <asp:ListItem Value="107022">Common Goldeneye</asp:ListItem>
                        <asp:ListItem Value="175021">Common Iora</asp:ListItem>
                        <asp:ListItem Value="100819">Common Kestrel</asp:ListItem>
                        <asp:ListItem Value="8840">Common Mallard</asp:ListItem>
                        <asp:ListItem Value="8880">Common Merganser</asp:ListItem>
                        <asp:ListItem Value="13746">Common Murre</asp:ListItem>
                        <asp:ListItem Value="279927">Common Myna</asp:ListItem>
                        <asp:ListItem Value="219593">Common Pochard</asp:ListItem>
                        <asp:ListItem Value="9091">Common Quail</asp:ListItem>
                        <asp:ListItem Value="8797">Common Rhea</asp:ListItem>
                        <asp:ListItem Value="108405">Common Tern</asp:ListItem>
                        <asp:ListItem Value="9120">Coot</asp:ListItem>
                        <asp:ListItem Value="9206">Cormorant</asp:ListItem>
                        <asp:ListItem Value="9109">Cranes</asp:ListItem>
                        <asp:ListItem Value="30420">Crow</asp:ListItem>
                        <asp:ListItem Value="217133">Curlew Sandpiper</asp:ListItem>
                        <asp:ListItem Value="371910">Desert Cardinal</asp:ListItem>
                        <asp:ListItem Value="8919">Dunlin</asp:ListItem>
                        <asp:ListItem Value="30460">Eagle Owls</asp:ListItem>
                        <asp:ListItem Value="30382">Egyptian Goose</asp:ListItem>
                        <asp:ListItem Value="8790">Emu</asp:ListItem>
                        <asp:ListItem Value="9121">Eurasian Coot</asp:ListItem>
                        <asp:ListItem Value="30461">Eurasian Eagle-Owl</asp:ListItem>
                        <asp:ListItem Value="30423">Eurasian Jackdaw</asp:ListItem>
                        <asp:ListItem Value="211598">Eurasian Sparrowhawk</asp:ListItem>
                        <asp:ListItem Value="75839">Eurasian Teal</asp:ListItem>
                        <asp:ListItem Value="8838">Eurasian Wigeon</asp:ListItem>
                        <asp:ListItem Value="208483">European Herring Gull</asp:ListItem>
                        <asp:ListItem Value="175120">Fairy Bluebird</asp:ListItem>
                        <asp:ListItem Value="8952">Falcon</asp:ListItem>
                        <asp:ListItem Value="1196310">Forest Raven</asp:ListItem>
                        <asp:ListItem Value="8976">Fowl</asp:ListItem>
                        <asp:ListItem Value="75861">Gadwall</asp:ListItem>
                        <asp:ListItem Value="67773">Gambel's Quail</asp:ListItem>
                        <asp:ListItem Value="75856">Garganey</asp:ListItem>
                        <asp:ListItem Value="119637">Glaucous Gull</asp:ListItem>
                        <asp:ListItem Value="9089">Golden Pheasant</asp:ListItem>
                        <asp:ListItem Value="8847">Goose</asp:ListItem>
                        <asp:ListItem Value="8957">Goshawk</asp:ListItem>
                        <asp:ListItem Value="30448">Grebe</asp:ListItem>
                        <asp:ListItem Value="45630">Grey Teal</asp:ListItem>
                        <asp:ListItem Value="219518">Great Barbet</asp:ListItem>
                        <asp:ListItem Value="126702">Great Black-Headed Gull</asp:ListItem>
                        <asp:ListItem Value="8910">Gull</asp:ListItem>
                        <asp:ListItem Value="345573">Great Crested Grebe</asp:ListItem>
                        <asp:ListItem Value="189534">Greater Scaup</asp:ListItem>
                        <asp:ListItem Value="761979">Greater Scythebill</asp:ListItem>
                        <asp:ListItem Value="132590">Greater White-Fronted Goose</asp:ListItem>
                        <asp:ListItem Value="13245">Golden-crowned Kinglet</asp:ListItem>
                        <asp:ListItem Value="8847">Goose</asp:ListItem>
                        <asp:ListItem Value="30448">Grebe</asp:ListItem>
                        <asp:ListItem Value="9050">Green Peafowl</asp:ListItem>
                        <asp:ListItem Value="75836">Green-Winged Teal</asp:ListItem>
                        <asp:ListItem Value="925459">Grey Crowned-Crane</asp:ListItem>
                        <asp:ListItem Value="30390">Grey Heron</asp:ListItem>
                        <asp:ListItem Value="9052">Grey Partridge</asp:ListItem>
                        <asp:ListItem Value="45630">Grey Teal</asp:ListItem>
                        <asp:ListItem Value="8843">Greylag Goose</asp:ListItem>
                        <asp:ListItem Value="8990">Guineafowl</asp:ListItem>
                        <asp:ListItem Value="8910">Gull</asp:ListItem>
                        <asp:ListItem Value="8996">Helmeted Guineafowl</asp:ListItem>
                        <asp:ListItem Value="8899">Heron</asp:ListItem>
                        <asp:ListItem Value="35669">Herring Gull</asp:ListItem>
                        <asp:ListItem Value="279951">Hooded Merganser</asp:ListItem>
                        <asp:ListItem Value="30399">Hooded Vulture</asp:ListItem>
                        <asp:ListItem Value="28702">Horned Puffin</asp:ListItem>
                        <asp:ListItem Value="172680">Houbara Bustard</asp:ListItem>
                        <asp:ListItem Value="701737">House Crow</asp:ListItem>
                        <asp:ListItem Value="118194">Iceland Gull</asp:ListItem>
                        <asp:ListItem Value="9049">Indian Peafowl</asp:ListItem>
                        <asp:ListItem Value="93934">Japanese Quail</asp:ListItem>
                        <asp:ListItem Value="36299">Japanese White-Eye</asp:ListItem>
                        <asp:ListItem Value="40213">Junco</asp:ListItem>
                        <asp:ListItem Value="140445">Kalij Pheasant</asp:ListItem>
                        <asp:ListItem Value="37036">Kelp Gull</asp:ListItem>
                        <asp:ListItem Value="36249">Large-Billed Crow</asp:ListItem>
                        <asp:ListItem Value="126679">Laughing Gull</asp:ListItem>
                        <asp:ListItem Value="279935">Least Sandpiper</asp:ListItem>
                        <asp:ListItem Value="189533">Lesser Scaup</asp:ListItem>
                        <asp:ListItem Value="148594">Lesser Kestrel</asp:ListItem>
                        <asp:ListItem Value="188379">Little Egret</asp:ListItem>
                        <asp:ListItem Value="100828">Little Grebe</asp:ListItem>
                        <asp:ListItem Value="197941">Long-tailed Duck</asp:ListItem>
                        <asp:ListItem Value="34923">Magpie</asp:ListItem>
                        <asp:ListItem Value="28681">Mew Gull</asp:ListItem>
                        <asp:ListItem Value="9122">Moorhen</asp:ListItem>
                        <asp:ListItem Value="75846">Mottled Duck</asp:ListItem>
                        <asp:ListItem Value="40156">Munia</asp:ListItem>
                        <asp:ListItem Value="13745">Murre</asp:ListItem>
                        <asp:ListItem Value="8855">Muscovy Duck</asp:ListItem>
                        <asp:ListItem Value="8869">Mute Swan</asp:ListItem>
                        <asp:ListItem Value="383689">Nightingale</asp:ListItem>
                        <asp:ListItem Value="98964">Northern Cardinal</asp:ListItem>
                        <asp:ListItem Value="28680">Northern Pintail</asp:ListItem>
                        <asp:ListItem Value="75838">Northern Shoveler</asp:ListItem>
                        <asp:ListItem Value="84829">Orchard Oriole</asp:ListItem>
                        <asp:ListItem Value="8801">Ostrich</asp:ListItem>
                        <asp:ListItem Value="30458">Owl</asp:ListItem>
                        <asp:ListItem Value="37576">Oystercatcher</asp:ListItem>
                        <asp:ListItem Value="371922">Pacific Golden Plover</asp:ListItem>
                        <asp:ListItem Value="13146">Parakeet</asp:ListItem>
                        <asp:ListItem Value="9223">Parrot</asp:ListItem>
                        <asp:ListItem Value="171585">Peacock</asp:ListItem>
                        <asp:ListItem Value="36275">Pekin Robin</asp:ListItem>
                        <asp:ListItem Value="30444">Pelican</asp:ListItem>
                        <asp:ListItem Value="9231">Penguin</asp:ListItem>
                        <asp:ListItem Value="8954">Peregrine Falcon</asp:ListItem>
                        <asp:ListItem Value="9072">Pheasant</asp:ListItem>
                        <asp:ListItem Value="40181">Philby's Partridge</asp:ListItem>
                        <asp:ListItem Value="8930">Pigeon</asp:ListItem>
                        <asp:ListItem Value="132585">Pink-Footed Goose</asp:ListItem>
                        <asp:ListItem Value="40179">Przewalski's Partridge</asp:ListItem>
                        <asp:ListItem Value="315430">Purple-bellied Lory</asp:ListItem>
                        <asp:ListItem Value="181102">Red-Crested Cardinal</asp:ListItem>
                        <asp:ListItem Value="30387">Red-Crested Pochard</asp:ListItem>
                        <asp:ListItem Value="272047">Red-Necked Stint</asp:ListItem>
                        <asp:ListItem Value="30466">Red-Winged Tinamou</asp:ListItem>
                        <asp:ListItem Value="30385">Redhead</asp:ListItem>
                        <asp:ListItem Value="43518">Red Kite</asp:ListItem>
                        <asp:ListItem Value="227173">Red Knot</asp:ListItem>
                        <asp:ListItem Value="126683">Ring-Billed Gull</asp:ListItem>
                        <asp:ListItem Value="189535">Ring-Necked Duck</asp:ListItem>
                        <asp:ListItem Value="40178">Rock Patridge</asp:ListItem>
                        <asp:ListItem Value="75140">Rook</asp:ListItem>
                        <asp:ListItem Value="541013">Rosy-Billed Pochard</asp:ListItem>
                        <asp:ListItem Value="45639">Ruddy Shelduck</asp:ListItem>
                        <asp:ListItem Value="54971">Ruddy Turnstone</asp:ListItem>
                        <asp:ListItem Value="128050">Sabine's Gull</asp:ListItem>
                        <asp:ListItem Value="345164">Saker Falcon</asp:ListItem>
                        <asp:ListItem Value="279936">Sanderling</asp:ListItem>
                        <asp:ListItem Value="279961">Semipalmated Sandpiper</asp:ListItem>
                        <asp:ListItem Value="192723">Sharp-Tailed Sandpiper</asp:ListItem>
                        <asp:ListItem Value="8906">Shorebird</asp:ListItem>
                        <asp:ListItem Value="9193">Shrike</asp:ListItem>
                        <asp:ListItem Value="201335">Silver-Eared Mesia</asp:ListItem>
                        <asp:ListItem Value="119607">Slaty-Backed Gull</asp:ListItem>
                        <asp:ListItem Value="126701">Slender-Billed Gull</asp:ListItem>
                        <asp:ListItem Value="107026">Smew</asp:ListItem>
                        <asp:ListItem Value="8917">Snipe</asp:ListItem>
                        <asp:ListItem Value="8849">Snow Goose</asp:ListItem>
                        <asp:ListItem Value="425648">Sooty Tern</asp:ListItem>
                        <asp:ListItem Value="9158">Sparrow</asp:ListItem>
                        <asp:ListItem Value="75854">Spot-Billed Duck</asp:ListItem>
                        <asp:ListItem Value="658924">Spur-Winged Goose</asp:ListItem>
                        <asp:ListItem Value="9172">Starling</asp:ListItem>
                        <asp:ListItem Value="234623">Steller's Eider</asp:ListItem>
                        <asp:ListItem Value="8926">Stork</asp:ListItem>
                        <asp:ListItem Value="8800">Struthio</asp:ListItem>
                        <asp:ListItem Value="371863">Surf Scoter</asp:ListItem>
                        <asp:ListItem Value="8867">Swan</asp:ListItem>
                        <asp:ListItem Value="62155">Tanager</asp:ListItem>
                        <asp:ListItem Value="9183">Thrush</asp:ListItem>
                        <asp:ListItem Value="9160">Tree Sparrow</asp:ListItem>
                        <asp:ListItem Value="219594">Tufted Duck</asp:ListItem>
                        <asp:ListItem Value="110926">Tundra Swan</asp:ListItem>
                        <asp:ListItem Value="9103">Turkey</asp:ListItem>
                        <asp:ListItem Value="159581">Veery</asp:ListItem>
                        <asp:ListItem Value="371864">Velvet Scoter</asp:ListItem>
                        <asp:ListItem Value="56327">Vermilion Cardinal</asp:ListItem>
                        <asp:ListItem Value="8923">Vulture</asp:ListItem>
                        <asp:ListItem Value="400782">Warbler</asp:ListItem>
                        <asp:ListItem Value="261967">Watercock</asp:ListItem>
                        <asp:ListItem Value="8830">Waterfowl</asp:ListItem>
                        <asp:ListItem Value="125296">Waxwing</asp:ListItem>
                        <asp:ListItem Value="48683">Wedge-Tailed Shearwater</asp:ListItem>
                        <asp:ListItem Value="245059">Wheatear</asp:ListItem>
                        <asp:ListItem Value="297805">Whiskered Tern</asp:ListItem>
                        <asp:ListItem Value="89385">White Bellied Bustard</asp:ListItem>
                        <asp:ListItem Value="8876">White-Faced Whistling-Duck</asp:ListItem>
                        <asp:ListItem Value="40157">White-Rumped Munia</asp:ListItem>
                        <asp:ListItem Value="279940">White-Rumped Sandpiper</asp:ListItem>
                        <asp:ListItem Value="371864">White-Winged Scoter</asp:ListItem>
                        <asp:ListItem Value="371913">White Ibis</asp:ListItem>
                        <asp:ListItem Value="219595">Whooper Swan</asp:ListItem>
                        <asp:ListItem Value="8833">Wood Duck</asp:ListItem>
                        <asp:ListItem Value="36278">Wren</asp:ListItem>
                        <asp:ListItem Value="33586">Yellow-billed Stork</asp:ListItem>
                    </asp:ListBox>
                    </ContentTemplate>
                    </asp:UpdatePanel> 
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="YearsLbl" runat="server" style="font-weight: 700" Text="4. Years"></asp:Label>
                </td>
                <td class="style3">
                    From</td>
                <td class="style4">
                    To</td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:TextBox ID="fromTxtBox" runat="server" MaxLength="4">YYYY</asp:TextBox>
                </td>
                <td class="style4">
                    <asp:TextBox ID="toTxtBox" runat="server" MaxLength="4">YYYY</asp:TextBox>
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    5. Geography</td>
                <td class="style3">
                    Continent</td>
                <td class="style4">
                    Country</td>
                <td class="style1">
                    <asp:Label ID="StatesLbl" runat="server" style="font-weight: 700" Text="States"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <asp:ListBox ID="continentLstBox" runat="server" Height="138px">
                        <asp:ListItem Selected="True" Value="6295630">All</asp:ListItem>
                        <asp:ListItem Value="6255146">Africa</asp:ListItem>
                        <asp:ListItem Value="6255152">Antarctica</asp:ListItem>
                        <asp:ListItem Value="6255147">Asia</asp:ListItem>
                        <asp:ListItem Value="6255148">Europe</asp:ListItem>
                        <asp:ListItem Value="6255149">North America</asp:ListItem>
                        <asp:ListItem Value="6255151">Oceania</asp:ListItem>
                        <asp:ListItem Value="6255150">South America</asp:ListItem>
                    </asp:ListBox>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="style4">
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                   <ContentTemplate> 
                    <asp:ListBox ID="countryLstBox" runat="server" Height="138px" 
                        SelectionMode="Multiple">
                        <asp:ListItem Value="6255152">Afghanistan</asp:ListItem>
                        <asp:ListItem Value="783754">Albania</asp:ListItem>
                        <asp:ListItem Value="2589581">Algeria</asp:ListItem>
                        <asp:ListItem Value="3351879">Angola</asp:ListItem>
                        <asp:ListItem Value="6255152">Antarctica</asp:ListItem>
                        <asp:ListItem Value="3865483">Argentina</asp:ListItem>
                        <asp:ListItem Value="174982">Armenia</asp:ListItem>
                        <asp:ListItem Value="3577279">Aruba</asp:ListItem>
                        <asp:ListItem Value="2077456">Australia</asp:ListItem>
                        <asp:ListItem Value="2782113">Austria</asp:ListItem>
                        <asp:ListItem Value="587116">Azerbaijan</asp:ListItem>
                        <asp:ListItem Value="290291">Bahrain</asp:ListItem>
                        <asp:ListItem Value="1210997">Bangladesh</asp:ListItem>
                        <asp:ListItem Value="3374084">Barbados</asp:ListItem>
                        <asp:ListItem Value="630336">Belarus</asp:ListItem>
                        <asp:ListItem Value="2802361">Belgium</asp:ListItem>
                        <asp:ListItem Value="2395170">Benin</asp:ListItem>
                        <asp:ListItem Value="1252634">Bhutan</asp:ListItem>
                        <asp:ListItem Value="3923057">Bolivia</asp:ListItem>
                        <asp:ListItem Value="3277605">Bosnia and Herzegovina</asp:ListItem>
                        <asp:ListItem Value="933860">Botswana</asp:ListItem> 
                        <asp:ListItem Value="3469034">Brazil</asp:ListItem>
                        <asp:ListItem Value="1820814">Brunei</asp:ListItem>
                        <asp:ListItem Value="732800">Bulgaria</asp:ListItem>
                        <asp:ListItem Value="2361809">Burkina Faso</asp:ListItem>
                        <asp:ListItem Value="1831722">Cambodia</asp:ListItem>
                        <asp:ListItem Value="2233387">Cameroon</asp:ListItem>
                        <asp:ListItem Value="6251999">Canada</asp:ListItem>
                        <asp:ListItem Value="239880">Central African Republic</asp:ListItem>
                        <asp:ListItem Value="2434508">Chad</asp:ListItem>
                        <asp:ListItem Value="3895114">Chile</asp:ListItem>
                        <asp:ListItem Value="1814991">China</asp:ListItem>
                        <asp:ListItem Value="3686110">Columbia</asp:ListItem>
                        <asp:ListItem Value="203312">Congo</asp:ListItem> 
                        <asp:ListItem Value="1899402">Cook Islands</asp:ListItem>
                        <asp:ListItem Value="3624060">Costa Rica</asp:ListItem>
                        <asp:ListItem Value="2287781">Cote dIvoire</asp:ListItem>
                        <asp:ListItem Value="3202326">Croatia</asp:ListItem>
                        <asp:ListItem Value="3562981">Cuba</asp:ListItem>
                        <asp:ListItem Value="7626836">Curacao</asp:ListItem>
                        <asp:ListItem Value="146669">Cypress</asp:ListItem>
                        <asp:ListItem Value="3077311">Czech Republic</asp:ListItem>
                        <asp:ListItem Value="2623032">Denmark</asp:ListItem>
                        <asp:ListItem Value="223816">Djibouti</asp:ListItem>
                        <asp:ListItem Value="3508796">Dominican Republic</asp:ListItem>
                        <asp:ListItem Value="3658394">Ecuador</asp:ListItem>
                        <asp:ListItem Value="357994">Egypt</asp:ListItem>
                        <asp:ListItem Value="3585968">El Salvador</asp:ListItem>
                        <asp:ListItem Value="453733">Estonia</asp:ListItem>
                        <asp:ListItem Value="337996">Ethiopia</asp:ListItem>
                        <asp:ListItem Value="3474414">Falkland Islands</asp:ListItem>
                        <asp:ListItem Value="2205218">Fiji</asp:ListItem>
                        <asp:ListItem Value="660013">Finland</asp:ListItem>
                        <asp:ListItem Value="3017382">France</asp:ListItem>
                        <asp:ListItem Value="3381670">French Guiana</asp:ListItem>
                        <asp:ListItem Value="4030656">French Polynesia</asp:ListItem>
                        <asp:ListItem Value="614540">Georgia</asp:ListItem>
                        <asp:ListItem Value="2921044">Germany</asp:ListItem>
                        <asp:ListItem Value="2300660">Ghana</asp:ListItem>
                        <asp:ListItem Value="390903">Greece</asp:ListItem>
                        <asp:ListItem Value="3579143">Guadeloupe</asp:ListItem>
                        <asp:ListItem Value="4043988">Guam</asp:ListItem>
                        <asp:ListItem Value="3595528">Guatemala</asp:ListItem>
                        <asp:ListItem Value="2420477">Guinea</asp:ListItem>
                        <asp:ListItem Value="3378535">Guyana</asp:ListItem>
                        <asp:ListItem Value="3723988">Haiti</asp:ListItem>
                        <asp:ListItem Value="3608932">Honduras</asp:ListItem>
                        <asp:ListItem Value="1819730">Hong Kong</asp:ListItem>
                        <asp:ListItem Value="719819">Hungary</asp:ListItem>
                        <asp:ListItem Value="2629691">Iceland</asp:ListItem>
                        <asp:ListItem Value="1269750">India</asp:ListItem>
                        <asp:ListItem Value="1643084">Indonesia</asp:ListItem>
                        <asp:ListItem Value="130758">Iran</asp:ListItem>
                        <asp:ListItem Value="99237">Iraq</asp:ListItem>
                        <asp:ListItem Value="2963597">Ireland</asp:ListItem>
                        <asp:ListItem Value="294640">Israel</asp:ListItem>
                        <asp:ListItem Value="3175395">Italy</asp:ListItem>
                        <asp:ListItem Value="3489940">Jamaica</asp:ListItem>
                        <asp:ListItem Value="1861060">Japan</asp:ListItem>
                        <asp:ListItem Value="248816">Jordan</asp:ListItem>
                        <asp:ListItem Value="1522867">Kazakhstan</asp:ListItem>
                        <asp:ListItem Value="192950">Kenya</asp:ListItem>
                        <asp:ListItem Value="831053">Kosovo</asp:ListItem>
                        <asp:ListItem Value="285570">Kuwait</asp:ListItem>
                        <asp:ListItem Value="1527747">Kyrgyzstan</asp:ListItem>
                        <asp:ListItem Value="1655842">Laos</asp:ListItem>
                        <asp:ListItem Value="458258">Latvia</asp:ListItem>
                        <asp:ListItem Value="272103">Lebanon</asp:ListItem>
                        <asp:ListItem Value="2275384">Liberia</asp:ListItem>
                        <asp:ListItem Value="3042058">Lichtenstein</asp:ListItem> 
                        <asp:ListItem Value="2215636">Libya</asp:ListItem>
                        <asp:ListItem Value="597427">Lithuania</asp:ListItem>
                        <asp:ListItem Value="2960313">Luxembourg</asp:ListItem>
                        <asp:ListItem Value="1821275">Macau</asp:ListItem>
                        <asp:ListItem Value="718075">Macedonia</asp:ListItem>
                        <asp:ListItem Value="1062947">Madagascar</asp:ListItem>
                        <asp:ListItem Value="927384">Malawi</asp:ListItem>
                        <asp:ListItem Value="1733045">Malaysia</asp:ListItem>
                        <asp:ListItem Value="2453866">Mali</asp:ListItem>
                        <asp:ListItem Value="2562770">Malta</asp:ListItem>
                        <asp:ListItem Value="934292">Mauritius</asp:ListItem>
                        <asp:ListItem Value="3996063">Mexico</asp:ListItem>
                        <asp:ListItem Value="617790">Moldova</asp:ListItem>
                        <asp:ListItem Value="2993457">Monaco</asp:ListItem>
                        <asp:ListItem Value="2029969">Mongolia</asp:ListItem>
                        <asp:ListItem Value="3194884">Montenegro</asp:ListItem>
                        <asp:ListItem Value="3578097">Montserrat</asp:ListItem>
                        <asp:ListItem Value="2542007">Morocco</asp:ListItem>
                        <asp:ListItem Value="1036973">Mozambique</asp:ListItem>
                        <asp:ListItem Value="1327865">Myanmar</asp:ListItem>
                        <asp:ListItem Value="3355338">Namibia</asp:ListItem>
                        <asp:ListItem Value="1282988">Nepal</asp:ListItem>
                        <asp:ListItem Value="2750405">Netherlands</asp:ListItem>
                        <asp:ListItem Value="2139685">New Caledonia</asp:ListItem>
                        <asp:ListItem Value="2186224">New Zealand</asp:ListItem>
                        <asp:ListItem Value="3617476">Nicaragua</asp:ListItem>
                        <asp:ListItem Value="2440476">Niger</asp:ListItem>
                        <asp:ListItem Value="2328926">Nigeria</asp:ListItem>
                        <asp:ListItem Value="1873107">North Korea</asp:ListItem>
                        <asp:ListItem Value="4041468">Northern Mariana Islands</asp:ListItem>
                        <asp:ListItem Value="3144096">Norway</asp:ListItem>
                        <asp:ListItem Value="286963">Oman</asp:ListItem>
                        <asp:ListItem Value="1168579">Pakistan</asp:ListItem>
                        <asp:ListItem Value="3703430">Panama</asp:ListItem>
                        <asp:ListItem Value="2088628">Papua New Guinea</asp:ListItem>
                        <asp:ListItem Value="3437598">Paraguay</asp:ListItem>
                        <asp:ListItem Value="3932488">Peru</asp:ListItem>
                        <asp:ListItem Value="1694008">Philippines</asp:ListItem>
                        <asp:ListItem Value="798544">Poland</asp:ListItem>
                        <asp:ListItem Value="2264397">Portugal</asp:ListItem>
                        <asp:ListItem Value="4566966">Puerto Rico</asp:ListItem>
                        <asp:ListItem Value="289688">Qatar</asp:ListItem>
                        <asp:ListItem Value="798549">Romania</asp:ListItem>
                        <asp:ListItem Value="2017370">Russia</asp:ListItem>
                        <asp:ListItem Value="49518">Rwanda</asp:ListItem>
                        <asp:ListItem Value="4034894">Samoa</asp:ListItem>
                        <asp:ListItem Value="102358">Saudi Arabia</asp:ListItem>
                        <asp:ListItem Value="2245662">Senegal</asp:ListItem>
                        <asp:ListItem Value="6290252">Serbia</asp:ListItem>
                        <asp:ListItem Value="2403846">Sierra Leone</asp:ListItem>
                        <asp:ListItem Value="1880251">Singapore</asp:ListItem>
                        <asp:ListItem Value="3057568">Slovakia</asp:ListItem>
                        <asp:ListItem Value="3190538">Slovenia</asp:ListItem>
                        <asp:ListItem Value="2103350">Solomon Islands</asp:ListItem>
                        <asp:ListItem Value="51537">Somalia</asp:ListItem>
                        <asp:ListItem Value="953987">South Africa</asp:ListItem>
                        <asp:ListItem Value="1835841">South Korea</asp:ListItem>
                        <asp:ListItem Value="7909807">South Sudan</asp:ListItem> 
                        <asp:ListItem Value="2510769">Spain</asp:ListItem>
                        <asp:ListItem Value="1227603">Sri Lanka</asp:ListItem>
                        <asp:ListItem Value="366755">Sudan</asp:ListItem>
                        <asp:ListItem Value="3382998">Suriname</asp:ListItem> 
                        <asp:ListItem Value="2661886">Sweden</asp:ListItem>
                        <asp:ListItem Value="2658434">Switzerland</asp:ListItem>
                        <asp:ListItem Value="163843">Syria</asp:ListItem>
                        <asp:ListItem Value="1668284">Taiwan</asp:ListItem>
                        <asp:ListItem Value="1220409">Tajikistan</asp:ListItem> 
                        <asp:ListItem Value="149590">Tazania</asp:ListItem>
                        <asp:ListItem Value="1605651">Thailand</asp:ListItem>
                        <asp:ListItem Value="2363686">Togo</asp:ListItem>
                        <asp:ListItem Value="4032283">Tonga</asp:ListItem>
                        <asp:ListItem Value="3573591">Trinidad and Tobago</asp:ListItem>
                        <asp:ListItem Value="2464461">Tunisia</asp:ListItem>
                        <asp:ListItem Value="298795">Turkey</asp:ListItem>
                        <asp:ListItem Value="1218197">Turkmenistan</asp:ListItem>
                        <asp:ListItem Value="6252001">USA</asp:ListItem>
                        <asp:ListItem Value="226074">Uganda</asp:ListItem>
                        <asp:ListItem Value="690791">Ukraine</asp:ListItem>
                        <asp:ListItem Value="290557">United Arab Emirates</asp:ListItem>
                        <asp:ListItem Value="2635167">United Kingdom</asp:ListItem>
                        <asp:ListItem Value="3439705">Uruguay</asp:ListItem>
                        <asp:ListItem Value="1512440">Uzebekistan</asp:ListItem>
                        <asp:ListItem Value="3625428">Venezuela</asp:ListItem>
                        <asp:ListItem Value="1562822">Vietnam</asp:ListItem>
                        <asp:ListItem Value="6254930">West Bank</asp:ListItem>
                        <asp:ListItem Value="69543">Yemen</asp:ListItem>
                        <asp:ListItem Value="895949">Zambia</asp:ListItem>
                        <asp:ListItem Value="878675">Zimbabwe</asp:ListItem>
                    </asp:ListBox>
                    </ContentTemplate> 
                    </asp:UpdatePanel> 
                </td>
                <td class="style1">
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                   <ContentTemplate>
                    <asp:ListBox ID="stateLstBox" runat="server" Height="138px" 
                        SelectionMode="Multiple">
                        <asp:ListItem Value="4829764">Alabama</asp:ListItem>
                        <asp:ListItem Value="5879092">Alaska</asp:ListItem>
                        <asp:ListItem Value="5551752">Arizona</asp:ListItem>
                        <asp:ListItem Value="4099753">Arkansas</asp:ListItem>
                        <asp:ListItem Value="5332921">California</asp:ListItem>
                        <asp:ListItem Value="5417618">Colorado</asp:ListItem>
                        <asp:ListItem Value="4831725">Connecticut</asp:ListItem>
                        <asp:ListItem Value="4142224">Delaware</asp:ListItem>
                        <asp:ListItem Value="4138106">District of Columbia</asp:ListItem>
                        <asp:ListItem Value="4155751">Florida</asp:ListItem>
                        <asp:ListItem Value="4197000">Georgia</asp:ListItem>
                        <asp:ListItem Value="5855797">Hawaii</asp:ListItem>
                        <asp:ListItem Value="5596512">Idaho</asp:ListItem>
                        <asp:ListItem Value="4896861">Illinois</asp:ListItem>
                        <asp:ListItem Value="4921868">Indiana</asp:ListItem>
                        <asp:ListItem Value="4862182">Iowa</asp:ListItem>
                        <asp:ListItem Value="4273857">Kansas</asp:ListItem>
                        <asp:ListItem Value="6254925">Kentucky</asp:ListItem>
                        <asp:ListItem Value="4331987">Louisiana</asp:ListItem>
                        <asp:ListItem Value="4971068">Maine</asp:ListItem>
                        <asp:ListItem Value="4361885">Maryland</asp:ListItem>
                        <asp:ListItem Value="6254926">Massachusetts</asp:ListItem>
                        <asp:ListItem Value="5001836">Michigan</asp:ListItem>
                        <asp:ListItem Value="5037779">Minnesota</asp:ListItem>
                        <asp:ListItem Value="4436296">Mississippi</asp:ListItem>
                        <asp:ListItem Value="4398678">Missouri</asp:ListItem>
                        <asp:ListItem Value="5667009">Montana</asp:ListItem>
                        <asp:ListItem Value="5073708">Nebraska</asp:ListItem>
                        <asp:ListItem Value="5509151">Nevada</asp:ListItem>
                        <asp:ListItem Value="5090174">New Hampshire</asp:ListItem>
                        <asp:ListItem Value="5101760">New Jersey</asp:ListItem>
                        <asp:ListItem Value="5481136">New Mexico</asp:ListItem>
                        <asp:ListItem Value="5128638">New York</asp:ListItem>
                        <asp:ListItem Value="4482348">North Carolina</asp:ListItem>
                        <asp:ListItem Value="5690763">North Dakota</asp:ListItem>
                        <asp:ListItem Value="5165418">Ohio</asp:ListItem>
                        <asp:ListItem Value="4544379">Oklahoma</asp:ListItem>
                        <asp:ListItem Value="5744337">Oregon</asp:ListItem>
                        <asp:ListItem Value="6254927">Pennsylvania</asp:ListItem>
                        <asp:ListItem Value="5224323">Rhode Island</asp:ListItem>
                        <asp:ListItem Value="4597040">South Carolina</asp:ListItem>
                        <asp:ListItem Value="5769223">South Dakota</asp:ListItem>
                        <asp:ListItem Value="4662168">Tennessee</asp:ListItem>
                        <asp:ListItem Value="4736286">Texas</asp:ListItem>
                        <asp:ListItem Value="5549030">Utah</asp:ListItem>
                        <asp:ListItem Value="5242283">Vermont</asp:ListItem>
                        <asp:ListItem Value="6254928">Virginia</asp:ListItem>
                        <asp:ListItem Value="5815135">Washington</asp:ListItem>
                        <asp:ListItem Value="4826850">West Virginia</asp:ListItem>
                        <asp:ListItem Value="5279468">Wisconsin</asp:ListItem>
                        <asp:ListItem Value="5843591">Wyoming</asp:ListItem>
                    </asp:ListBox>
                    </ContentTemplate> 
                    </asp:UpdatePanel> 
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" colspan="3">
                   
                  
                    <asp:Accordion ID="myAccordion" runat="server" CssClass="accordion" 
                        HeaderCssClass="header" HeaderSelectedCssClass="headerSelected" 
                        ContentCssClass="content" RequireOpenedPane="False" SelectedIndex="-1" 
                        SuppressHeaderPostbacks="True" Width="424px" Height="267px">
                    <Panes>
                        <asp:AccordionPane ID="myPane" runat="server">
                        <Header>Advanced Settings</Header>
                        <Content>
                        <table>
                        <tr>
                        <td>
                            <asp:Label ID="lblMCMC" runat="server" Text="MCMC Chain Length" ToolTip="Total number of steps in Markov chain Monte Carlo simulation. Min is 10,00,000."></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="mcmcTxtBox" runat="server" Text="10,000,000"></asp:TextBox>
                        </td>
                        </tr>
                        <tr>
                        <td>
                            <asp:Label ID="lblSamp" runat="server" Text="MCMC Sampling Frequency" ToolTip="Number of steps per sample in Markov chain Monte Carlo simulation. Min is 1,000."></asp:Label></td>
                        <td>
                        <asp:TextBox ID="sampTxtBox" runat="server" Text="1,000"></asp:TextBox>
                        </td>
                        </tr>
                        <tr>
                        <td>
                            <asp:Label ID="lblMdl" runat="server" Text="Model Selection"></asp:Label></td>
                        <td>
                            <asp:ListBox ID="MdlLst" runat="server">
                            <asp:ListItem Selected="True" ></asp:ListItem>
                            <asp:ListItem>HKY</asp:ListItem>
                            <asp:ListItem>TN</asp:ListItem>
                            <asp:ListItem>GTR</asp:ListItem>
                            </asp:ListBox>
                        </td>
                        </tr>
                        <tr>
                        <td> <asp:Label ID="Label2" runat="server" Text="Site Hetereogeneity"></asp:Label></td>
                        <td> 
                            <asp:ListBox ID="InvGamLst" runat="server">
                            <asp:ListItem Selected="True"></asp:ListItem>
                            <asp:ListItem>G</asp:ListItem>
                            <asp:ListItem>I</asp:ListItem>
                            <asp:ListItem>G+I</asp:ListItem>
                            </asp:ListBox>
                        </td>
                        </tr>
                        </table>
                        </Content>
                        </asp:AccordionPane>
                    </Panes>
                    </asp:Accordion>
                   
                </td>
                <td class="style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td align="right" class="style4">
                    <asp:Button ID="clearBtn" runat="server" style="font-weight: 700" Text="Clear" />
                </td>
                <td class="style1">
                    <asp:Button ID="nextBtn" runat="server" style="font-weight: 700" Text="Next" 
                        onclick="nextBtn_Click" />
                    
                </td>
            </tr>
        </table>
       
       
        <br />
    </asp:Panel>

        <nav id="sidebar">
						<div class="widget">						
						</div>
						
					</nav>			
					
					<div class="clr">
					</div>
				</div>
			</div>

			<div id="footerblurb">
				<div id="footerblurb-inner">			
					<div class="clr">
					</div>
				</div>
			</div>
		
			<footer id="footer">
				<div id="footer-inner">
					<p>&copy; Copyright Zoophy &#124; <a href="terms.aspx">Terms of Use</a> &#124; <a href="privacy.aspx">Privacy Policy</a></p>
					<div class="clr">
					</div>
				</div>
			</footer>
		</div>
    </form>
</body>
</html>