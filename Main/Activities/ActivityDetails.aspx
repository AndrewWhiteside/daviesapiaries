<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ActivityDetails.aspx.vb"
    Inherits="Main_Activities_ActivityDetails" Title="Activity Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:ValidationSummary ID="vsEditActivity" runat="server" ValidationGroup="EditActivityValidators" />
    <asp:ValidationSummary ID="vsInsertActivity" runat="server" ValidationGroup="InsertActivityValidators" />
    <asp:FormView ID="fvActivityDetails" runat="server" DataKeyNames="ActivityID" DataSourceID="ActivitiesDataSource">
        <EditItemTemplate>
            <table>
                <tr>
                    <td class="subhead">
                        Activity Date:
                    </td>
                    <td>
                        <asp:TextBox ID="EditActivityDateTextBox" runat="server" Text='<%# Bind("ActivityDate", "{0:d}") %>' />
                        <asp:Image ID="EditActivityDateCalendar" runat="server" ImageUrl="~/img/Calendar_scheduleHS.png" />
                        <cc1:CalendarExtender ID="ceEditActivityDate" runat="server" TargetControlID="EditActivityDateTextBox"
                            Format="dd/MM/yyyy" PopupButtonID="EditActivityDateCalendar">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ID="rfEditActivityDate" runat="server" ErrorMessage="Activity Date is compulsory"
                            Text="*" ControlToValidate="EditActivityDateTextBox" ValidationGroup="EditActivityValidators"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="EditActivityDateValidator" runat="server" ErrorMessage="Please select a valid date"
                            Type="Date" Operator="DataTypeCheck" ValidationGroup="EditActivityValidators"
                            ControlToValidate="EditActivityDateTextBox" Text="*"></asp:CompareValidator>
                    </td>
                    <td class="subhead">
                        Activity Type:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEditActivityType" runat="server" DataSourceID="ActivityTypeDataSource"
                            DataTextField="ActivityTypeDescription" DataValueField="ActivityTypeID" SelectedValue='<%# Bind("ActivityTypeID") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Activity Description:
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="ActivityDescriptionTextBox" runat="server" Text='<%# Bind("ActivityDescription") %>'
                            EnableTheming="False" Width="699px" Height="200px" TextMode="MultiLine" />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Current Attachment:
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="ActivityMapTextBox" runat="server" Text='<%# Bind("ActivityMap") %>'
                            Width="700px" size="87.5" EnableTheming="false" ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        New Attachment:
                    </td>
                    <td colspan="3">
                        <asp:FileUpload ID="fuEditMap" runat="server" Width="700px" size="87.5" EnableTheming="false" />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Apiary Sites:
                    </td>
                    <td colspan="3">
                        <asp:ListBox ID="lstRelatedSites" runat="server" DataTextField="SiteNo" DataValueField="ApiarySiteID" EnableTheming="false" Width="310px" Height="150px" />
                        <asp:Button ID="btnRemoveSite" runat="server" Text=">" OnClick="btnRemoveSite_Click" />
                        <asp:Button ID="btnAddSite" runat="server" Text="<" OnClick="btnAddSite_Click" />
                        <asp:ListBox ID="lstSiteList" runat="server" DataSourceID="ApiaryDataSource" DataTextField="SiteNo"
                            DataValueField="ApiarySiteID" EnableTheming="false" Width="310px" Height="150px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" ValidationGroup="EditActivityValidators" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table>
                <tr>
                    <td class="subhead">
                        Activity Date:
                    </td>
                    <td>
                        <asp:TextBox ID="InsertActivityDateTextBox" runat="server" Text='<%# Bind("ActivityDate", "{0:d}") %>' />
                        <asp:Image ID="InsertActivityDateCalendar" runat="server" ImageUrl="~/img/Calendar_scheduleHS.png" />
                        <cc1:CalendarExtender ID="ceInsertActivityDate" runat="server" TargetControlID="InsertActivityDateTextBox"
                            Format="dd/MM/yyyy" PopupButtonID="InsertActivityDateCalendar">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ID="rfInsertActivityDate" runat="server" ErrorMessage="Activity Date is compulsory"
                            Text="*" ControlToValidate="InsertActivityDateTextBox" ValidationGroup="InsertActivityValidators"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="InsertActivityDateValidator" runat="server" ErrorMessage="Please select a valid date"
                            Type="Date" Operator="DataTypeCheck" ValidationGroup="InsertActivityValidators"
                            ControlToValidate="InsertActivityDateTextBox" Text="*"></asp:CompareValidator>
                    </td>
                    <td class="subhead">
                        Activity Type:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlInsertActivityType" runat="server" DataSourceID="ActivityTypeDataSource"
                            DataTextField="ActivityTypeDescription" DataValueField="ActivityTypeID" SelectedValue='<%# Bind("ActivityTypeID") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Activity Description:
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="ActivityDescriptionTextBox" runat="server" Text='<%# Bind("ActivityDescription") %>'
                            EnableTheming="False" Width="612px" Height="200px" TextMode="MultiLine" />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Attachment:
                    </td>
                    <td colspan="3">
                        <asp:FileUpload ID="fuInsertMap" runat="server" Width="700px" size="87.5" EnableTheming="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" ValidationGroup="InsertActivityValidators" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr>
                    <td class="subhead">
                        Activity Date:
                    </td>
                    <td>
                        <asp:Label ID="ActivityDateLabel" runat="server" Text='<%# Bind("ActivityDate", "{0:d}") %>' />
                    </td>
                    <td class="subhead">
                        Activity Type:
                    </td>
                    <td>
                        <asp:Label ID="ActivityTypeLabel" runat="server" Text='<%# Bind("ActivityType.ActivityTypeDescription") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Activity Description:
                    </td>
                    <td colspan="3">
                        <asp:Label ID="ActivityDescriptionLabel" runat="server" Text='<%# Bind("ActivityDescription") %>'
                            EnableTheming="false" />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Attachment:
                    </td>
                    <td colspan="3">
                        <asp:Label ID="ActivityMapLabel" runat="server" EnableTheming="false" Text='<%# Bind("ActivityMap") %>' />
                        <br />
                        <asp:HyperLink ID="HypOpenPDF" runat="server" NavigateUrl='<%# GetPDFPath() %>' Target="_blank">View Attachment(PDF Only)</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Apiary Sites:
                    </td>
                    <td colspan="3">
                        <asp:ListBox ID="lstApiarySites" runat="server" Width="570px" Enabled="True" EnableTheming="false" Height="150px"></asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" />
                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:LinqDataSource ID="ApiaryDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        OrderBy="SiteNo" Select="new (ApiarySiteID, CommonName, SiteNo)" TableName="ApiarySites">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ActivitiesDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        EnableInsert="True" EnableUpdate="True" EnableDelete="true" TableName="Activities" Where="ActivityID == @ActivityID">
        <WhereParameters>
            <asp:QueryStringParameter Name="ActivityID" QueryStringField="ActivityID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ActivityTypeDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        Select="new (ActivityTypeID, ActivityTypeDescription)" TableName="ActivityTypes">
    </asp:LinqDataSource>
</asp:Content>
