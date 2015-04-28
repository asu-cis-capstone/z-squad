﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Demonstration.signup" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link type="text/css" rel="stylesheet" href="style/signup_form.css" />

    <!-- Title -->
	<title>Signup Page</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Contentplaceholder1" runat="server">
		<div id="content">
			<div id="content-inner">
				
				<main id="contentbar">
					<div class="article">
						<div class="container">

                            <%--added attribute runat="server". This is necessary for asp.net. 
                                also, removed some an extra form tag that was above.
                                removed action and method, not necessary in asp.net--%>
							<form id="signup" runat="server">

							    <div class="header">
							        
							        <h3>Sign Up</h3>
							            
							        <p>Please fill out this form</p>

                                    <%--Added a random button here to demonstrate how to alter what displays
                                        Notice the Onclick event, look in the code behind for the code that 
                                        will be executed in this event when it is clicked
                                        
                                        You will have to fill out your form to allow HTML5 to post back: your validation will block
                                        this postback otherwise, as it happens client-side
                                    <asp:Button ID="randomButton" runat="server" Text="Random button" OnClick="randomButton_Click" />
                                    <asp:Label ID="randomLabel" runat="server" Text="This will change when you click the above button" />
							            --%>
							    </div>
							        
							    <div class="sep"></div>
                                    
							    <div class="inputs">
							        <!-- First Name -->
							        <%--<input type="text" id="fName" name="fName" placeholder="First Name" autofocus required pattern="[a-zA-Z-' ]{1,25}" />
                                        *****************
                                        Note, asp.net doesn't like the html5 properties placeholder, autofocus, etc.
                                            These aren't asp.net properties, so it will leave them as is when it generates the html5
                                            Therefore, they will still work as originially intended
                                        ****************--%>
                                    <asp:TextBox ID="fName" runat="server" placeholder="First Name" autofocus required pattern="[a-zA-Z-' ]{1,25}"></asp:TextBox>
							            
                                    <!-- Last Name -->
							        <%--<input type="text" id="lName" name="lName" placeholder="Last Name" required pattern="[a-zA-Z-' ]{2,30}"/>--%>
                                    <asp:TextBox ID="lName" runat="server" placeholder="Last Name" required pattern="[a-zA-Z-' ]{2,30}"></asp:TextBox>
							            
                                    <!-- Email -->
							        <%--<input type="text" id="email" name="email" placeholder="Email" 
									required maxlength="50" />--%>
                                    <asp:TextBox ID="email" runat="server" placeholder="Email" required maxlength="50" TextMode="Email"></asp:TextBox>
							        	
                                    <!-- Password -->
							        <%--<input type="password" id="password" name="password" placeholder="Password" 
									required
									pattern="[a-zA-Z0-9-_!$]{5,20}" onchange="form.reenter.pattern=this.value;" /> --%>

                                    <asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password"
                                        required pattern="[a-zA-Z0-9-_!$]{5,20}" onchange="form.reenter.pattern=this.value;"></asp:TextBox>
										
                                    <!-- Re-enter -->
									<%--<input type="password" id="reenter" name="reenter" required placeholder="Verify Password" />--%>
                                    <asp:TextBox ID="reenter" runat="server" placeholder="Verify Password" TextMode="Password" />

									<!-- Institution -->
							        <%--<input type="text" id="institution" name="institution" placeholder="Institution" 
									required
									pattern="[a-zA-Z0-9]{2,25}" /> --%>

                                    <asp:TextBox ID="institution" runat="server" placeholder="Institution" required pattern="[a-zA-Z0-9]{2,25}"></asp:TextBox>
							            
							        <div class="checkboxy">
                                        I accept the <a href="terms.html" onclick="window.open(this.href); return false">Terms of Use</a>
                                        <asp:CheckBox ID="checky" required runat="server" />
							            <%--<input name="cecky" id="checky" value="1" type="checkbox" required /><label class="terms">I accept the <a href="terms.html" onclick="window.open(this.href); return false">Terms of Use</a></label>--%>
							        </div>
							            
							        <%--Commented out to replace with ASP:Button. This allows us to use c# in the code behind, by creating an event
                                            
                                        <input type="submit" id="submit" value="REGISTER" />
                                            
                                        Notice that the button's OnClick event is submit_Click. 
                                        Look at this event in the codebehind files for the processing--%>
                                    <asp:Button ID="submit" runat="server" OnClick="submit_Click" Text="REGISTER"/>
							        
							    </div>

							</form>

						</div>
					</div>
				</main>
</asp:Content>				