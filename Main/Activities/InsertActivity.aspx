<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="InsertActivity.aspx.vb" Inherits="Main_Activities_ActivitySites" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ValidationSummary ID="vsInsertActivities" runat="server" ValidationGroup="InsertActivityValidators" />
    <table>
        <tr>
            <td class="subhead">
                Activity Date:
            </td>
            <td>
                <telerik:RadDatePicker ID="rdbInsertActivity" runat="server">
                </telerik:RadDatePicker>
                <asp:RequiredFieldValidator ID="rfInsertActivityDate" runat="server" ErrorMessage="Activity Date is compulsory"
                    Text="*" ControlToValidate="rdbInsertActivity" ValidationGroup="InsertActivityValidators" />
            </td>
            <td class="subhead">
                Activity Type:
            </td>
            <td>
                <asp:DropDownList ID="ddlActivityType" runat="server" DataSourceID="ActivityTypeDataSource"
                    DataTextField="ActivityTypeDescription" DataValueField="ActivityTypeID">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="subhead">
                Activity Description
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtActivityDecription" runat="server" EnableTheming="False" Width="690px"
                    Height="200px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="subhead">
                Attachment:
            </td>
            <td colspan="3">
                <asp:FileUpload ID="fuInsertMap" runat="server" Width="700px" size="90" EnableTheming="false" />
            </td>
        </tr>
        <tr>
            <td class="subhead">
                Add Sites Related to this Activity:
            </td>
            <td colspan="3">
                <asp:ListBox ID="lstRelatedSites" runat="server" SelectionMode="Multiple" EnableTheming="false" Width="310px" Height="150px" />
                <asp:Button ID="btnRemoveSite" runat="server" Text=">" />
                <asp:Button ID="btnAddSite" runat="server" Text="<" />
                <asp:ListBox ID="lstAvaliableSites" runat="server" DataSourceID="SitesDataSource"
                    DataTextField="SiteNo" DataValueField="ApiarySiteID" SelectionMode="Multiple"
                    EnableTheming="false" Width="310px" Height="150px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="btnConfirm" runat="server" Text="Insert" CausesValidation="true"
                    ValidationGroup="InsertActivityValidators" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
    </table>
    <asp:LinqDataSource ID="ActivityTypeDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        OrderBy="ActivityTypeDescription" Select="new (ActivityTypeID, ActivityTypeDescription)"
        TableName="ActivityTypes">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="SitesDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        OrderBy="SiteNo" Select="new (ApiarySiteID, SiteNo)" TableName="ApiarySites">
    </asp:LinqDataSource>
    <p>
        &nbsp;</p>
</asp:Content>
