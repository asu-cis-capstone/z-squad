<%--This is a CONTENT PAGE. This means it inherits a master page file.
    
    This is useful for keeping the look/feel of your website consistent 
    throughout the application. This will differ, but the master page will stay the same--%>


<%--Added to this is the MasterPageFile property. This allows this page to be a content page--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Demonstration.Default" MasterPageFile="~/Site1.Master" %>
<%--This is an added line. It allows you to refer to public properties on the master page--%>
<%@ MasterType VirtualPath="~/Site1.Master" %>

<%--This is where the content will begin. Anything withing the asp:Content element will 
    be inserted into the asp:ContentPlaceHolder, myContent, on the master page--%>
<asp:Content ID="someContent" ContentPlaceHolderID="myContent" runat="server">
    This button will execute an event on the content page.

    This event is utilizing your web service. 
    It is supplying it with generic strings, so it WILL NOT work
    <asp:Button ID="callService" runat="server" OnClick="callService_Click" Text="Execute Some Code" />
    <asp:HyperLink ID="something" runat="server"></asp:HyperLink>
</asp:Content>
