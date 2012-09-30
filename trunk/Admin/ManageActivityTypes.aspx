<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ManageActivityTypes.aspx.vb"
    Inherits="Management_ManageActivityTypes" Title="Activity Types" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:LinkButton ID="lkbAddActivityType" CssClass="LinkButton" runat="server">Add Activity Type</asp:LinkButton>
    <asp:ValidationSummary ID="vsActivityTypes" runat="server" ValidationGroup="ActivityTypeValidators" />
    <asp:FormView ID="fvActivityTypes" runat="server" DataKeyNames="ActivityTypeID" DataSourceID="ActivityTypeDataSource"
        DefaultMode="Insert" EnableViewState="False" Visible="False">
        <InsertItemTemplate>
            <table>
                <tr>
                    <td class="subhead">
                        Activity Type:
                    </td>
                    <td>
                        <asp:TextBox ID="ActivityTypeDescriptionTextBox" runat="server" Text='<%# Bind("ActivityTypeDescription") %>' />
                        <asp:RequiredFieldValidator ID="rfActivityTypeDescription" runat="server" ErrorMessage="Please Enter an Activity Type"
                            Text="*" ControlToValidate="ActivityTypeDescriptionTextBox" ValidationGroup="ActivityTypeValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" ValidationGroup="ActivityTypeValidators" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
    </asp:FormView>
    <br />
    <asp:GridView ID="gvActivityTypes" runat="server" AutoGenerateColumns="false" DataKeyNames="ActivityTypeID"
        DataSourceID="ActivityTypeDataSource" PageSize="1000">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="ActivityTypeDescription" HeaderText="Activity Type" SortExpression="ActivityTypeDescription" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="ActivityTypeDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" TableName="ActivityTypes" OrderBy="ActivityTypeDescription">
    </asp:LinqDataSource>
</asp:Content>
