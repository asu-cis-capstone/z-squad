<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Demonstration.login" EnableEventValidation ="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Link tags for CSS -->
	<link type="text/css" rel="stylesheet" href="Style/signup_form.css" />

    <title>ZooPhy | Login</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Contentplaceholder1" runat="server">
			<div id="content">
				<div id="content-inner">
				
					<main id="contentbar">
						<div class="article">
							<div class="container">

							    <form id="signup" action="" method="post">

							        <div class="header">
							            <h3>Log In</h3>
							        </div>
							        
							        <div class="sep"></div>

							        <div class="inputs">
							        
                                        <asp:Label ID="errorMsg" Text="" Visible="true" runat="server" />
                                        <br />
                                        <asp:TextBox ID="email" runat="server" placeholder="Email" autofocus required pattern="[a-z0-9.$-]+@[a-z0-9-]+\.[a-z]{2,16}"></asp:TextBox>
							           
							       
                                        <asp:TextBox TextMode="Password" ID="password" runat="server" placeholder="Password" required pattern="[a-zA-Z0-9-_!$]{5,15}"></asp:TextBox>

                                        <asp:Button runat="server" ID="submit" Text="Login" OnClick="submit_Click" />
							        

							        </div>

							    </form>

							</div>
						</div>
					</main>
</asp:Content>
					
					

   