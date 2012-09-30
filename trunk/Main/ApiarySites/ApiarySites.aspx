<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ApiarySites.aspx.vb"
    Inherits="Main_ApiarySites" Title="Apiary Sites" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:HyperLink ID="HplAddApiarySite" runat="server" CssClass="LinkButton" NavigateUrl="~/Main/ApiarySites/ApiarySiteDetails.aspx?Mode=Insert">Add new Apiary Site</asp:HyperLink>
    <asp:UpdatePanel ID="udpApiarySites" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td class="subhead">
                        Primary Resource
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPrimaryResource" runat="server" AppendDataBoundItems="True"
                            AutoPostBack="True" DataSourceID="PrimaryResourceDataSource" DataTextField="PrimaryResourceDescription"
                            DataValueField="PrimaryResourceID">
                            <asp:ListItem Value="-1">-All Resources-</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="subhead">
                        Area
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlArea" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                            DataSourceID="AreaDataSource" DataTextField="AreaDescription" DataValueField="AreaID">
                            <asp:ListItem Value="-1">-All Areas-</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvApiarySites" runat="server" AutoGenerateColumns="False" DataKeyNames="ApiarySiteID"
                DataSourceID="ApiarySitesDataSource" AccessKey="S" EmptyDataText="There are no Apiary Sites that meet the selected criteria."
                AllowSorting="True" PageSize="1000">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="ApiarySiteID" DataNavigateUrlFormatString="ApiarySiteDetails.aspx?ApiarySiteID={0}"
                        Text="View Details" />
                    <asp:BoundField DataField="SiteNo" HeaderText="Site No" SortExpression="SiteNo" />
                    <asp:BoundField DataField="CommonName" HeaderText="Common Name" SortExpression="CommonName" />
                    <asp:BoundField DataField="GPSLatitude" HeaderText="GPS Latitude" SortExpression="GPSLatitude" />
                    <asp:BoundField DataField="GPSLongitude" HeaderText="GPS Longitude" SortExpression="GPSLongitude" />
                    <asp:TemplateField HeaderText="Primary Resource" SortExpression="PrimaryResourceID">
                        <ItemTemplate>
                            <%#Eval("PrimaryResource.PrimaryResourceDescription")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Area" SortExpression="AreaID">
                        <ItemTemplate>
                            <%#Eval("Area.AreaDescription")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Zone" HeaderText="Zone" SortExpression="Zone" />
                    <asp:TemplateField HeaderText="Contact Name" SortExpression="ContactID">
                        <ItemTemplate>
                            <%#Eval("Contact.ContactName")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinqDataSource ID="PrimaryResourceDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        OrderBy="PrimaryResourceDescription" Select="new (PrimaryResourceID, PrimaryResourceDescription)"
        TableName="PrimaryResources">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="ApiarySitesDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        TableName="ApiarySites" OrderBy="SiteNo">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="AreaDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        OrderBy="AreaDescription" Select="new (AreaID, AreaDescription)" TableName="Areas">
    </asp:LinqDataSource>
</asp:Content>
