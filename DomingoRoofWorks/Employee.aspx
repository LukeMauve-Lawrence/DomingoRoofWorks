<%@ Page Title="Employee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="DomingoRoofWorks.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div id="dvGrid" style="padding: 10px; width: 450px">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
            DataKeyNames="Employee_No" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "10" AllowPaging ="true" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
            Width="1050">
            <Columns>
                <asp:TemplateField HeaderText="Employee_No" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblEmployee_No" runat="server" Text='<%# Eval("Employee_No") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmployee_No" runat="server" Text='<%# Eval("Employee_No") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First_Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblFirst_Name" runat="server" Text='<%# Eval("First_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFirst_Name" runat="server" Text='<%# Eval("First_Name") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last_Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblLast_Name" runat="server" Text='<%# Eval("Last_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLast_Name" runat="server" Text='<%# Eval("Last_Name") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Eval("Email") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone_Number" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblPhone_Number" runat="server" Text='<%# Eval("Phone_Number") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPhone_Number" runat="server" Text='<%# Eval("Phone_Number") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address_ID" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblAddress_ID" runat="server" Text='<%# Eval("Address_ID") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAddress_ID" runat="server" Text='<%# Eval("Address_ID") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                    ItemStyle-Width="150" />
            </Columns>
        </asp:GridView>
        <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
            <tr>
                <td style="width: 150px">
                    Employee_No:<br />
                    <asp:TextBox ID="txtEmployee_No" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    First_Name:<br />
                    <asp:TextBox ID="txtFirst_Name" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    Last_Name:<br />
                    <asp:TextBox ID="txtLast_Name" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    Email:<br />
                    <asp:TextBox ID="txtEmail" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    Phone_Number:<br />
                    <asp:TextBox ID="txtPhone_Number" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    Address_ID:<br />
                    <asp:TextBox ID="txtAddress_ID" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
</div>
</asp:Content>
