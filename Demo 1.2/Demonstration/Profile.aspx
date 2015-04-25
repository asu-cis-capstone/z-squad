<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Demonstration.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">		
	<!-- Title -->
	<title>ZooPhy | Profile Page</title>
</asp:Content>
	
<asp:Content ID="Content2" ContentPlaceHolderID="Contentplaceholder1" runat="server">
			<div id="content">
				<div id="content-inner">	
					<main id="contentbar">
						<div class="article">
							<!-- MAIN/CENTER -->
			<div id="profile">
				<span class="profPic"><img src="imageFolder/defaultProfile.jpg" alt=""/></span>
				<span class="profHead"><h2>Batman</h2></span>
				<br/>
				<p>
				Institution: Justice League of America (JLA)
				<br/>
				Member Since: 1939
				<br/>
				Queries Run: 27
				<br/>
				Open Queries: 2
				</br>
				Completed Queries: 25
				</p>
				
			</div>
						</div>

					</main>
</asp:Content>
