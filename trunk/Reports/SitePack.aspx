<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="SitePack.aspx.vb" Inherits="Reports_SitePack" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table>
        <tr>
            <td>
                Apiary Site
            </td>
            <td>
                <asp:DropDownList ID="ddlApiarySite" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="ApiarySiteDataSource" DataTextField="SiteNo" 
                    DataValueField="ApiarySiteID" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <rsweb:ReportViewer ID="rvSitePack" runat="server" BorderStyle="Solid" BorderWidth="1px"
        Font-Names="Verdana" Font-Size="8pt" Height="717px" Width="825px">
        <LocalReport ReportPath="Reports\SitePack.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="ReportDS_ApiarySitePack" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" ConvertNullToDBNull="True"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ReportDSTableAdapters.ApiarySitePackTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlApiarySite" Name="ApiarySiteID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:LinqDataSource ID="ApiarySiteDataSource" runat="server" 
        ContextTypeName="DaviesApiariesDataContext" 
        Select="new (ApiarySiteID, CommonName, SiteNo)" TableName="ApiarySites">
    </asp:LinqDataSource>
</asp:Content>
