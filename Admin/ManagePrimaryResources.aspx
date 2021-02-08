<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManagePrimaryResources.aspx.vb"
    Inherits="Admin_ManagePrimaryResources" Title="Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:LinkButton ID="lkbAddPrimaryResource" CssClass="LinkButton" runat="server">Add Primary Resource</asp:LinkButton>
    <asp:ValidationSummary ID="vsPrimaryResource" runat="server" ValidationGroup="PrimaryResourceValidators" />
    <asp:FormView ID="fvPrimaryResource" runat="server" DataKeyNames="PrimaryResourceID"
        DataSourceID="PrimaryResourceDataSource" DefaultMode="Insert" EnableViewState="False"
        Visible="False">
        <InsertItemTemplate>
            <table>
                <tr>
                    <td class="subhead">
                        Primary Resource:
                    </td>
                    <td>
                        <asp:TextBox ID="PrimaryResourceDescriptionTextBox" runat="server" Text='<%# Bind("PrimaryResourceDescription") %>' />
                         <asp:RequiredFieldValidator ID="rfPrimaryResource" runat="server" ErrorMessage="Please enter a Primary Resource"
                            Text="*" ControlToValidate="PrimaryResourceDescriptionTextBox" ValidationGroup="PrimaryResourceValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" ValidationGroup="PrimaryResourceValidators" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
    </asp:FormView>
    <br />
    <asp:GridView ID="gvPrimaryResource" runat="server" AutoGenerateColumns="False" DataKeyNames="PrimaryResourceID"
        DataSourceID="PrimaryResourceDataSource" PageSize="1000">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="PrimaryResourceDescription" HeaderText="Primary Resource"
                SortExpression="PrimaryResourceDescription" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="PrimaryResourceDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="PrimaryResources" OrderBy="PrimaryResourceDescription">
    </asp:LinqDataSource>
</asp:Content>
