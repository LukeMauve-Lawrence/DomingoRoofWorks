<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DomingoRoofWorks._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %></h2>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
    </p>
<p>
        <asp:Button ID="ViewJobCardButton" runat="server" OnClick="ViewInvoiceButton_Click" Text="View JobCard" />
    </p>
<p>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </p>

</asp:Content>
