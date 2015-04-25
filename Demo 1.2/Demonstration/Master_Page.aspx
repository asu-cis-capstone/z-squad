<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Master_Page.aspx.cs" Inherits="Demonstration.Master_Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div id="top-nav">
						<ul><li>
							Profile
							<ul>
							  <a href="login.aspx"><li>Login</li></a>
							  <a href="signup.aspx"><li>Register</li></a>
							</ul>
						  </li>
						  <li>
							Queries
							<ul>
							  <a href="login.aspx"><li>New Query</li></a>
							  <a href="login.aspx"><li>View Queries</li></a>
							</ul>
						  </li>
						  <a href="Default.aspx"><li>About</li></a>
						  <a href="contact.aspx"><li>Contact</li></a>
						</ul>
					</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="myContent" runat="server">
</asp:Content>
