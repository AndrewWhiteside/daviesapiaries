<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ApiarySiteDetails.aspx.vb"
    Inherits="Main_ApiarySites_ApiarySiteDetails" Title="Apiary Site Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ValidationSummary ID="vsEditApiarySite" runat="server" ValidationGroup="EditApiarySiteValidators" />
    <asp:ValidationSummary ID="vsInsertApiarySite" runat="server" ValidationGroup="InsertApiarySiteValidators" />
    <asp:FormView ID="fvApiarySite" runat="server" DataKeyNames="ApiarySiteID" DataSourceID="ApiarySiteDataSource">
        <EditItemTemplate>
            <table>
                <tr>
                    <td class="subhead">
                        Site No:
                    </td>
                    <td>
                        <asp:TextBox ID="SiteNoTextBox" runat="server" Text='<%# Bind("SiteNo") %>' />
                    </td>
                    <td class="subhead">
                        Common Name:
                    </td>
                    <td>
                        <asp:TextBox ID="CommonNameTextBox" runat="server" Text='<%# Bind("CommonName") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        GPS Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="EditGPSLatitudeTextBox" runat="server" Text='<%# Bind("GPSLatitude") %>' />
                        <asp:CompareValidator ID="cvEditLatitude" runat="server" ErrorMessage="Please enter a valid latutude value"
                            Text="*" Type="Double" ControlToValidate="EditGPSLatitudeTextBox" ValidationGroup="EditApiarySiteValidators"
                            Operator="DataTypeCheck"></asp:CompareValidator>
                    </td>
                    <td class="subhead">
                        Location Description:
                    </td>
                    <td>
                        <asp:TextBox ID="LocationDescriptionTextBox" runat="server" Text='<%# Bind("LocationDescription") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        GPS Longitude:
                    </td>
                    <td>
                        <asp:TextBox ID="GPSLongitudeTextBox" runat="server" Text='<%# Bind("GPSLongitude") %>' />
                        <asp:CompareValidator ID="cvEditLongitude" runat="server" ErrorMessage="Please enter a valid longitude value"
                            Text="*" Type="Double" ControlToValidate="GPSLongitudeTextBox" ValidationGroup="EditApiarySiteValidators"
                            Operator="DataTypeCheck"></asp:CompareValidator>
                    </td>
                    <td class="subhead">
                        Primary Resource:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEditPrimaryResource" runat="server" DataSourceID="PrimaryResourceDataSource"
                            DataTextField="PrimaryResourceDescription" DataValueField="PrimaryResourceID"
                            SelectedValue='<%# Bind("PrimaryResourceID") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Area:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEditArea" runat="server" DataSourceID="AreaDataSource" DataTextField="AreaDescription"
                            DataValueField="AreaID" SelectedValue='<%# Bind("AreaID") %>'>
                        </asp:DropDownList>
                    </td>
                    <td class="subhead">
                        Zone:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEditZone" runat="server" SelectedValue='<%# Bind("Zone") %>'>
                            <asp:ListItem>Private</asp:ListItem>
                            <asp:ListItem>Remote</asp:ListItem>
                            <asp:ListItem>Southwest</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        DEC District:
                    </td>
                    <td>
                        <asp:TextBox ID="CALMDistrictTextBox" runat="server" Text='<%# Bind("CALMDistrict") %>' />
                    </td>
                    <td class="subhead">
                        Water Catchment:
                    </td>
                    <td>
                        <asp:CheckBox ID="WCCheckBox" runat="server" Checked='<%# Bind("WC") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Land Tenure:
                    </td>
                    <td>
                        <asp:TextBox ID="LandTenureTextBox" runat="server" Text='<%# Bind("LandTenure") %>' />
                    </td>
                    <td class="subhead">
                        Pastoral Lease:
                    </td>
                    <td>
                        <asp:CheckBox ID="PLCheckBox" runat="server" Checked='<%# Bind("PL") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Management Plan:
                    </td>
                    <td>
                        <asp:TextBox ID="ManagementPlanTextBox" runat="server" Text='<%# Bind("ManagementPlan") %>' />
                    </td>
                    <td class="subhead">
                        Disease Risk Area:
                    </td>
                    <td>
                        <asp:CheckBox ID="DRACheckBox" runat="server" Checked='<%# Bind("DRA") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Contact:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEditContact" runat="server" DataSourceID="ContactDataSource"
                            DataTextField="ContactName" DataValueField="ContactID" SelectedValue='<%# Bind("ContactID") %>'>
                        </asp:DropDownList>
                    </td>
                    <td class="subhead">
                        Organic Certified:
                    </td>
                    <td>
                        <asp:CheckBox ID="OrganicCheckBox" runat="server" Checked='<%# Bind("Organic") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Status:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEditStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Archived</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <tr>
                        <td class="subhead">
                            COG Plan:
                        </td>
                        <td>
                            <asp:TextBox ID="COGPlanTextBox" runat="server" Text='<%# Bind("COGPlan") %>' />
                        </td>
                    </tr>
                </tr>
                <tr>
                    <td class="subhead">
                        Current Map
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="CurrentMapTextBox" runat="server" EnableTheming="false" Width="545px"
                            Text='<%# Bind("Map") %>' ReadOnly="true" />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        New Map:
                    </td>
                    <td colspan="3">
                        <asp:FileUpload ID="fuEditMap" runat="server" Width="700px" size="87.5" EnableTheming="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" ValidationGroup="EditApiarySiteValidators" />
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
                        Site No:
                    </td>
                    <td>
                        <asp:TextBox ID="SiteNoTextBox" runat="server" Text='<%# Bind("SiteNo") %>' />
                    </td>
                    <td class="subhead">
                        Common Name:
                    </td>
                    <td>
                        <asp:TextBox ID="CommonNameTextBox" runat="server" Text='<%# Bind("CommonName") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        GPS Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="InsertGPSLatitudeTextBox" runat="server" Text='<%# Bind("GPSLatitude") %>' />
                        <asp:CompareValidator ID="cvInsertLatitude" runat="server" ErrorMessage="Please enter a valid latutude value"
                            Text="*" Type="Double" ControlToValidate="InsertGPSLatitudeTextBox" ValidationGroup="InsertApiarySiteValidators"
                            Operator="DataTypeCheck"></asp:CompareValidator>
                    </td>
                    <td class="subhead">
                        Location Description:
                    </td>
                    <td>
                        <asp:TextBox ID="LocationDescriptionTextBox" runat="server" Text='<%# Bind("LocationDescription") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        GPS Longitude:
                    </td>
                    <td>
                        <asp:TextBox ID="InsertGPSLongitudeTextBox" runat="server" Text='<%# Bind("GPSLongitude") %>' />
                        <asp:CompareValidator ID="cvInsertLongitude" runat="server" ErrorMessage="Please enter a valid longitude value"
                            Text="*" Type="Double" ControlToValidate="InsertGPSLongitudeTextBox" ValidationGroup="InsertApiarySiteValidators"
                            Operator="DataTypeCheck"></asp:CompareValidator>
                    </td>
                    <td class="subhead">
                        Primary Resource:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlInsertPrimaryResource" runat="server" DataSourceID="PrimaryResourceDataSource"
                            DataTextField="PrimaryResourceDescription" DataValueField="PrimaryResourceID"
                            SelectedValue='<%# Bind("PrimaryResourceID") %>'>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Area:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlInsertArea" runat="server" DataSourceID="AreaDataSource"
                            DataTextField="AreaDescription" DataValueField="AreaID" SelectedValue='<%# Bind("AreaID") %>'>
                        </asp:DropDownList>
                    </td>
                    <td class="subhead">
                        Zone:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlInsertZone" runat="server" SelectedValue='<%# Bind("Zone") %>'>
                            <asp:ListItem>Private</asp:ListItem>
                            <asp:ListItem>Remote</asp:ListItem>
                            <asp:ListItem>Southwest</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        DEC District:
                    </td>
                    <td>
                        <asp:TextBox ID="CALMDistrictTextBox" runat="server" Text='<%# Bind("CALMDistrict") %>' />
                    </td>
                    <td class="subhead">
                        Water Catchment:
                    </td>
                    <td>
                        <asp:CheckBox ID="WCCheckBox" runat="server" Checked='<%# Bind("WC") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Land Tenure:
                    </td>
                    <td>
                        <asp:TextBox ID="LandTenureTextBox" runat="server" Text='<%# Bind("LandTenure") %>' />
                    </td>
                    <td class="subhead">
                        Pastoral Lease:
                    </td>
                    <td>
                        <asp:CheckBox ID="PLCheckBox" runat="server" Checked='<%# Bind("PL") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Management Plan:
                    </td>
                    <td>
                        <asp:TextBox ID="ManagementPlanTextBox" runat="server" Text='<%# Bind("ManagementPlan") %>' />
                    </td>
                    <td class="subhead">
                        Disease Risk Area:
                    </td>
                    <td>
                        <asp:CheckBox ID="DRACheckBox" runat="server" Checked='<%# Bind("DRA") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Contact:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlInsertContact" runat="server" DataSourceID="ContactDataSource"
                            DataTextField="ContactName" DataValueField="ContactID" SelectedValue='<%# Bind("ContactID") %>'>
                        </asp:DropDownList>
                    </td>
                    <td class="subhead">
                        Organic Certified:
                    </td>
                    <td>
                        <asp:CheckBox ID="OrganicCheckBox" runat="server" Checked='<%# Bind("Organic") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Status:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlInsertStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Archived</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="subhead">
                        COG Plan:
                    </td>
                    <td>
                        <asp:TextBox ID="COGPlanTextBox" runat="server" Text='<%# Bind("COGPlan") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Map:
                    </td>
                    <td colspan="3">
                        <asp:FileUpload ID="fuInsertMap" runat="server" Width="700px" size="87.5" EnableTheming="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" ValidationGroup="InsertApiarySiteValidators" />
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
                        Site No:
                    </td>
                    <td>
                        <asp:Label ID="SiteNoLabel" runat="server" Text='<%# Bind("SiteNo") %>' />
                    </td>
                    <td class="subhead">
                        Common Name:
                    </td>
                    <td>
                        <asp:Label ID="CommonNameLabel" runat="server" Text='<%# Bind("CommonName") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        GPS Latitude:
                    </td>
                    <td>
                        <asp:Label ID="GPSLatitudeLabel" runat="server" Text='<%# Bind("GPSLatitude") %>' />
                    </td>
                    <td class="subhead">
                        Location Description:
                    </td>
                    <td>
                        <asp:Label ID="LocationDescriptionLabel" runat="server" Text='<%# Bind("LocationDescription") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        GPS Longitude:
                    </td>
                    <td>
                        <asp:Label ID="GPSLongitudeLabel" runat="server" Text='<%# Bind("GPSLongitude") %>' />
                    </td>
                    <td class="subhead">
                        Primary Resource:
                    </td>
                    <td>
                        <asp:Label ID="PrimaryResourceLabel" runat="server" Text='<%# Eval("PrimaryResource.PrimaryResourceDescription") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Area:
                    </td>
                    <td>
                        <asp:Label ID="AreaLabel" runat="server" Text='<%# Eval("Area.AreaDescription") %>' />
                    </td>
                    <td class="subhead">
                        Zone:
                    </td>
                    <td>
                        <asp:Label ID="ZoneLabel" runat="server" Text='<%# Bind("Zone") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        DEC District:
                    </td>
                    <td>
                        <asp:Label ID="CALMDistrictLabel" runat="server" Text='<%# Bind("CALMDistrict") %>' />
                    </td>
                    <td class="subhead">
                        Water Catchment:
                    </td>
                    <td>
                        <asp:CheckBox ID="WCCheckBox" runat="server" Checked='<%# Bind("WC") %>' Enabled="false" />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Land Tenure:
                    </td>
                    <td>
                        <asp:Label ID="LandTenureLabel" runat="server" Text='<%# Bind("LandTenure") %>' />
                    </td>
                    <td class="subhead">
                        Pastoral Lease:
                    </td>
                    <td>
                        <asp:CheckBox ID="PLCheckBox" runat="server" Checked='<%# Bind("PL") %>' Enabled="false" />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Management Plan:
                    </td>
                    <td>
                        <asp:Label ID="ManagementPlanLabel" runat="server" Text='<%# Bind("ManagementPlan") %>' />
                    </td>
                    <td class="subhead">
                        Disease Risk Area:
                    </td>
                    <td>
                        <asp:CheckBox ID="DRACheckBox" runat="server" Checked='<%# Bind("DRA") %>' Enabled="false" />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Contact:
                    </td>
                    <td>
                        <asp:Label ID="ContactLabel" runat="server" Text='<%# Eval("Contact.ContactName") %>' />
                    </td>
                    <td class="subhead">
                        Organic Certified:
                    </td>
                    <td>
                        <asp:CheckBox ID="OrganicCheckBox" runat="server" Checked='<%# Bind("Organic") %>'
                            Enabled="false" />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Status:
                    </td>
                    <td>
                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                    </td>
                    <td class="subhead">
                        COGPlan:
                    </td>
                    <td>
                        <asp:Label ID="COGPlanLabel" runat="server" Text='<%# Bind("COGPlan") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Map:
                    </td>
                    <td>
                        <asp:HyperLink ID="HypOpenPDF" runat="server" NavigateUrl='<%# GetPDFPath() %>' Target="_blank">View Map</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    &nbsp;<br />
    Site Activities:<br />
    <br />
    <asp:HyperLink ID="HplAddActivity" runat="server" CssClass="LinkButton" NavigateUrl="">Add new Activity</asp:HyperLink>
    <asp:GridView ID="gvSiteActivities" runat="server" AutoGenerateColumns="False" EmptyDataText="There are no Activities recorded against this site">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ActivityID" DataNavigateUrlFormatString="~/Main/Activities/ActivityDetails.aspx?ActivityID={0}"
                Text="View Details" />
            <asp:BoundField DataField="ActivityDate" DataFormatString="{0:d}" HeaderText="Activity Date"
                SortExpression="ActivityDate" />
            <asp:TemplateField HeaderText="Activity Type" SortExpression="ActivityTypeID">
                <ItemTemplate>
                    <%#Eval("ActivityType.ActivityTypeDescription")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ActivityDescription" HeaderText="Activity Description"
                SortExpression="ActivityDescription" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="ActivityDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        TableName="Activities">
    </asp:LinqDataSource>
    <br />
    <asp:LinqDataSource ID="AreaDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        Select="new (AreaID, AreaDescription)" TableName="Areas">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ContactDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        OrderBy="ContactName" Select="new (ContactName, ContactID)" TableName="Contacts">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="PrimaryResourceDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        Select="new (PrimaryResourceID, PrimaryResourceDescription)" TableName="PrimaryResources">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ApiarySiteDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        EnableInsert="True" EnableUpdate="True" TableName="ApiarySites" Where="ApiarySiteID == @ApiarySiteID">
        <WhereParameters>
            <asp:QueryStringParameter Name="ApiarySiteID" QueryStringField="ApiarySiteID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
