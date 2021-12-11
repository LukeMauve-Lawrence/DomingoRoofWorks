
<%@ Page Title="Rates" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rates.aspx.cs" Inherits="DomingoRoofWorks.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div id="dvGrid" style="padding: 10px; width: 450px">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
            DataKeyNames="Job_Type_ID" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "3" AllowPaging ="true" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" EmptyDataText="No records has been added."
            Width="450">
            <Columns>
                <asp:TemplateField HeaderText="Job_Type_ID" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblJob_Type_ID" runat="server" Text='<%# Eval("Job_Type_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job_Type" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblJob_Type" runat="server" Text='<%# Eval("Job_Type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Daily_Rate" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblDaily_Rate" runat="server" Text='<%# Eval("Daily_Rate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDaily_Rate" runat="server" Text='<%# Eval("Daily_Rate") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Link" ShowEditButton="true"
                    ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>
    </ContentTemplate>
</asp:UpdatePanel>
</div>

</asp:Content>

