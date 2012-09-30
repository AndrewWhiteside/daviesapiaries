<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Contacts.aspx.vb"
    Inherits="Main_Contacts" Title="Contacts" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HyperLink ID="HplAddContact" runat="server" CssClass="LinkButton" NavigateUrl="~/Main/Contacts/ContactDetails.aspx?Mode=Insert">Add new Contact</asp:HyperLink>
    <asp:GridView ID="gvContacts" runat="server" AutoGenerateColumns="False" DataKeyNames="ContactID"
        DataSourceID="ContactsDataSource" PageSize="100" AllowPaging="true">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ContactID" DataNavigateUrlFormatString="ContactDetails.aspx?ContactID={0}"
                Text="View Details" />
            <asp:BoundField DataField="District" HeaderText="Area/District" SortExpression="District" />
            <asp:BoundField DataField="ContactName" HeaderText="Contact Name" SortExpression="ContactName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Telephone" HeaderText="Telephone" SortExpression="Telephone" />
            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
            <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
            <asp:BoundField DataField="UHF" HeaderText="UHF" SortExpression="UHF" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="ContactsDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        TableName="Contacts">
    </asp:LinqDataSource>
</asp:Content>
