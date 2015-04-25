<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="viewJobs.aspx.cs" Inherits="Demonstration.viewJobs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<!-- Title -->
	<title>ZooPhy | Phylogeography for Zoonotic Disease Surveillance</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Contentplaceholder1" runat="server">

	
			<div id="content">
				<div id="content-inner-jobs">
				To view Phylogenic Tree, please click <a href="http://tree.bio.ed.ac.uk/software/figtree/" onclick="window.open(this.href); return false;">here</a> to download FigTree.
					<main id="article">
						<div class="currentjobs">
							<h2>Current Jobs</h2>
							<div id="daterun">
							<p>Date Run: 12/24/2014</p>
							</div>
							
							<div id="queryinfo">
							<p>Status: complete</p>
							<p>Query Info: </p>
							<p>Percent complete: 100%</p>
							<p><a href="kmlMap.html">Phylogeographic Map</a></p>
							</div>
						</div>
						
						<div class="clr"></div>
					</main>
</asp:Content>