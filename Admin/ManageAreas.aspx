<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageAreas.aspx.vb"
    Inherits="Admin_ManageAreas" Title="Areas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:LinkButton ID="lkbAddArea" CssClass="LinkButton" runat="server">Add Area</asp:LinkButton>
    <asp:ValidationSummary ID="vsAreas" runat="server" ValidationGroup="AreaValidators" />
    <asp:FormView ID="fvAreas" runat="server" DataKeyNames="AreaID" DataSourceID="AreasDataSource"
        DefaultMode="Insert" EnableViewState="False" Visible="False">
        <InsertItemTemplate>
            <table>
                <tr>
                    <td class="subhead">
                        Area:
                    </td>
                    <td>
                        <asp:TextBox ID="AreaDescriptionTextBox" runat="server" Text='<%# Bind("AreaDescription") %>' />
                        <asp:RequiredFieldValidator ID="rfAreaDescription" runat="server" ErrorMessage="Please enter an Area"
                            Text="*" ControlToValidate="AreaDescriptionTextBox" ValidationGroup="AreaValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" ValidationGroup="AreaValidators" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
    </asp:FormView>
    <br />
    <asp:GridView ID="gvAreas" runat="server" AutoGenerateColumns="False" DataKeyNames="AreaID"
        DataSourceID="AreasDataSource" PageSize="1000" >
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="AreaDescription" HeaderText="Area" SortExpression="AreaDescription" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="AreasDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="Areas" OrderBy="AreaDescription">
    </asp:LinqDataSource>
</asp:Content>
