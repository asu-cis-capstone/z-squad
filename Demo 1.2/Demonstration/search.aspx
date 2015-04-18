 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="Demonstration.search" %> 
 
 <!DOCTYPE html>
 
 <html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <!-- Meta Tag -->
 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
 	<!-- Icon Link -->
 	<link rel="icon" href="imageFolder/zoophy.ico" />
 		
 	<!-- CSS Link -->
 	<link type="text/css" rel="stylesheet" href="style/main_style.css" />
 
     <!-- jQuery Link -->
 		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
 		</script>
 
 	<!-- jQuery Search Function-->
 		<script>
 		    $(document).ready(function () {
 		        $("#advSearchLink").click(function () {
 		            $("#advSearch").toggle();
 		        });
 		    });
 		</script>

     	<script>
     		 $(document).ready(function () {
     		     $("#advSearchLink").click(function () {
     		         $("#advSearch").toggle();
     		     });
     		});
 		</script>
 
     <!-- Title -->
     <title>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</title>
 </head>
 <body>
     <form id="form1" runat="server">
     <div id="page">
 			<header id="header">
 				<div id="header-inner">	
 					<div id="logo">	
 					</div>
 					<div id="top-nav">
 						<ul><li>
 							Profile
 							<ul>
 							  <a href="profile.aspx"><li>Profile</li></a>
 							  <a href="about.aspx"><li>Logout</li></a>
 							</ul>
 						  </li>
 						  <li>
 							Queries
 							<ul>
 							  <a href="search.aspx"><li>New Query</li></a>
 							  <a href="viewjobs.aspx"><li>View Queries</li></a>
 							</ul>
 						  </li>
 						  <a href="about.aspx"><li>About</li></a>
 						  <a href="contact.aspx"><li>Contact</li></a>
 						</ul>
 					
 					
 						<!-- <ul>
 						<li><a href="login.html">Profile</a></li>
 						<li><a href="main.html">Queries</a></li> 
 						<li><a href="about.html">About</a></li> 
 						<li><a href="contact.html">Contact</a></li> 
 						</ul> -->
 					</div>
 					<!-- Header Spacing -->
 					<div class="clr">
 					</div>
 				</div>
 			</header>
 			
 			<div class="feature">
 				<div class="feature-inner">
 					<span class="maintext">
 						<h1>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</h1>
 					</span>
 				</div>
 			</div>
 	
 			<div id="content">
 				<div id="content-inner">	
 					<main id="contentbar">
 						<div class="article">
 							<!-- MAIN/CENTER -->
 						
 									 <form id="search" action="#" method="#">
 											<div class="search">


 												<!-- Search Virus Name -->
                                                
                                                <label for="vHost">Virus:</label>
												<asp:ListBox ID="VirusLstBox" runat="server" AutoPostBack="false" Height="85px" OnSelectedIndexChanged="VirusLstBox_SelectedIndexChanged">
                                                    <asp:ListItem Selected="True" Value="119210">H3N2 Influenza A</asp:ListItem>
                                                    <asp:ListItem Value="114727">H1N1 pdm09 Influenza A</asp:ListItem>
                                                    <asp:ListItem Value="102793">H5N1 Influenza A</asp:ListItem>
                                                    <asp:ListItem Value="11292">Rabies</asp:ListItem>
                                                    <asp:ListItem Value="11082">West Nile Virus</asp:ListItem>
                                                    <asp:ListItem Value="11081">Zombie Virus</asp:ListItem>
                                                </asp:ListBox>
                                                 <br />
 
 												<!-- Search gene -->
                                                <label for="vHost">Gene:</label>
												<asp:ListBox ID="GeneLstBox" runat="server" Height="150px" Width="118px" SelectionMode="Multiple" OnSelectedIndexChanged="GeneLstBox_SelectedIndexChanged">
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
                                                  <br />
 
 												<!-- Search Host -->
 												<label for="vHost">Virus Host:</label>
												<asp:ListBox ID="hostLst" runat="server" Height="150px" Width="118px" SelectionMode="Multiple" OnSelectedIndexChanged="hostLst_SelectedIndexChanged">
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
                                                  <br />
 
                                                 <!-- Time frame -->
                                                <asp:Label ID="YearsLbl" runat="server" style="font-weight: 700" Text="Years:"></asp:Label>
                                                 <asp:Label ID="Label1" runat="server" style="font-weight: 700" Text="From"></asp:Label>
                                                 <asp:Label ID="Label2" runat="server" style="font-weight: 700" Text="To"></asp:Label>
                                                 <br />
                                                <asp:TextBox ID="fromTxtBox" runat="server" MaxLength="4" OnTextChanged="fromTxtBox_TextChanged">YYYY</asp:TextBox>
                                                <asp:TextBox ID="toTxtBox" runat="server" MaxLength="4" OnTextChanged="toTxtBox_TextChanged">YYYY</asp:TextBox>
                                                  <br />
 
                                                 <!-- Geography -->
 												<label for="vGeo">Geography:</label>
                                                 <label for="vGeo">Continent</label>
                                                 <label for="vCountry">Country</label>
                                                 <label for="vState">States</label>
                                                 <br />
                                                <!-- Continent -->
                                             
												<asp:ListBox ID="continentLstBox" runat="server" Height="138px" OnSelectedIndexChanged="continentLstBox_SelectedIndexChanged">
                                                    <asp:ListItem Selected="True" Value="6295630">All</asp:ListItem>
                                                    <asp:ListItem Value="6255146">Africa</asp:ListItem>
                                                    <asp:ListItem Value="6255152">Antarctica</asp:ListItem>
                                                    <asp:ListItem Value="6255147">Asia</asp:ListItem>
                                                    <asp:ListItem Value="6255148">Europe</asp:ListItem>
                                                    <asp:ListItem Value="6255149">North America</asp:ListItem>
                                                    <asp:ListItem Value="6255151">Oceania</asp:ListItem>
                                                    <asp:ListItem Value="6255150">South America</asp:ListItem>
                                                </asp:ListBox>
                                                <!-- Country -->
 												
												<asp:ListBox ID="countryLstBox" runat="server" Height="138px" SelectionMode="Multiple" OnSelectedIndexChanged="countryLstBox_SelectedIndexChanged">
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
                                                <!-- States if in united States -->
												
                                                    <asp:ListBox ID="stateLstBox" runat="server" Height="138px" 
                                                        SelectionMode="Multiple" OnSelectedIndexChanged="stateLstBox_SelectedIndexChanged">
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
                                                    <br />

                                                 <a id="advSearchLink" href="#">Advanced Search</a>
											<p id="advSearch">

												<!-- MCMC chain length -->
												<asp:Label ID="lblSamp" runat="server" Text="MCMC Sampling Frequency" ToolTip="Number of steps per sample in Markov chain Monte Carlo simulation. Min is 1,000."></asp:Label></td>
                                                <asp:TextBox ID="sampTxtBox" runat="server" Text="1,000"></asp:TextBox>

											</p>
										</form>
                                                

											</div>
											<p class="submit">
												<input type="submit" value="Search Virus" />
												<span class="reset">
													<input type="reset" value="Clear Search" onclick="history.go(0)" />
												</span>
											</p>

											
									
								
						</div>
					</main>
					
					<nav id="sidebar">
 						<div class="widget">						
 						</div>
 						<img src="imageFolder/zoophy.ico" alt="Zoophy" />
 					</nav>			
 					
 					<div class="clr">
 					</div>
 				</div>
 			</div>
 		
 			<div id="footerblurb">
 				<div id="footerblurb-inner">
 				
 					<div class="column">
 						<!-- BOTTOM LEFT -->
 						<h2><span>Search</span></h2>
 						<p>Use Zoophy to query multiple databases 
 							of virus genomes across the nation.</p> 
 						<!-- <p><script>generateText(2)</script></p> -->
 					</div>	
 					<div class="column">
 						<!-- BOTTOM MIDDLE -->
 						<h2><span>Find</span></h2>
 						<p>Find virus trajectory by selecting specific RNA sequences.</p> 
 						<!-- <p><script>generateText(2)</script></p> -->
 					</div>
 					<div class="column">
 						<!-- BOTTOM RIGHT -->
 						<h2><span>Map It</span></h2>
 						<p>Once complete, recceive a map over 
 							Google Earth of your queries results.</p> 
 						<!-- <p><script>generateText(2)</script></p> -->
 					</div>	
 					
 					<div class="clr"></div>
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
