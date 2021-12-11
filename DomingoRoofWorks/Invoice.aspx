<%@ Page Title="Invoice" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="DomingoRoofWorks.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
    </p>
<p>
        <asp:Button ID="ViewInvoiceButton" runat="server" OnClick="ViewInvoiceButton_Click" Text="View Invoice" />
    </p>
<p>
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </p>
    </asp:Content>
