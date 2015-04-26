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
				<span class="profHead"><h2><asp:Label ID="user_name" Text="" runat="server" /></h2></span>
				<br/>
				<asp:Label ID="email" Text="" runat="server" />
				<br/>
				<asp:Label ID="institution" Text="" runat="server" />
				<br/>
				Open Queries: 2
				</br>
				Completed Queries: 25
				</p>
				
			</div>
						</div>
					</main>
					
					</div>
            </div>
</asp:Content>
