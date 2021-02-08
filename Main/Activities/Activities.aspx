<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Activities.aspx.vb"
    Inherits="Main_Activities_Activities" Title="Activities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:HyperLink ID="HplAddActivity" runat="server" CssClass="LinkButton" NavigateUrl="~/Main/Activities/InsertActivity.aspx">Add new Activity</asp:HyperLink>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ActivityID"
        DataSourceID="ActivitiesDataSource" PageSize="1000">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ActivityID" DataNavigateUrlFormatString="ActivityDetails.aspx?ActivityID={0}"
                Text="View Details" />
            <asp:BoundField DataField="ActivityDate" HeaderText="Activity Date" SortExpression="ActivityDate"
                DataFormatString="{0:d}" />
            <asp:TemplateField HeaderText="Activity Type" SortExpression="ActivityTypeID">
                <ItemTemplate>
                    <%#Eval("ActivityType.ActivityTypeDescription")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ActivityDescription" HeaderText="Activity Description"
                SortExpression="ActivityDescription" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="ActivitiesDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        TableName="Activities">
    </asp:LinqDataSource>
</asp:Content>
