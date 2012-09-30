<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="ContactDetails.aspx.vb"
    Inherits="Main_Contacts_ContactDetails" Title="Contact Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:FormView ID="fvContacts" runat="server" DataKeyNames="ContactID" DataSourceID="ContactsDataSource"
        Width="570px">
        <EditItemTemplate>
            <table>
                <tr>
                    <td class="subhead">
                        Area/District:
                    </td>
                    <td>
                        <asp:TextBox ID="DistrictTextBox" runat="server" Text='<%# Bind("District") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Contact Name:
                    </td>
                    <td>
                        <asp:TextBox ID="ContactNameTextBox" runat="server" Text='<%# Bind("ContactName") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Email:
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Telephone:
                    </td>
                    <td>
                        <asp:TextBox ID="TelephoneTextBox" runat="server" Text='<%# Bind("Telephone") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Fax:
                    </td>
                    <td>
                        <asp:TextBox ID="FaxTextBox" runat="server" Text='<%# Bind("Fax") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Mobile:
                    </td>
                    <td>
                        <asp:TextBox ID="MobileTextBox" runat="server" Text='<%# Bind("Mobile") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        UHF:
                    </td>
                    <td>
                        <asp:TextBox ID="UHFTextBox" runat="server" Text='<%# Bind("UHF") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Additional Info:
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="AdditionalInfoTextBox" runat="server" Text='<%# Bind("AdditionalInfo") %>'
                            TextMode="MultiLine" Width="570px" Height="50px" EnableTheming="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="Update" />
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
                        Area/District:
                    </td>
                    <td>
                        <asp:TextBox ID="DistrictTextBox" runat="server" Text='<%# Bind("District") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Contact Name:
                    </td>
                    <td>
                        <asp:TextBox ID="ContactNameTextBox" runat="server" Text='<%# Bind("ContactName") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Email:
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Telephone:
                    </td>
                    <td>
                        <asp:TextBox ID="TelephoneTextBox" runat="server" Text='<%# Bind("Telephone") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Fax:
                    </td>
                    <td>
                        <asp:TextBox ID="FaxTextBox" runat="server" Text='<%# Bind("Fax") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Mobile:
                    </td>
                    <td>
                        <asp:TextBox ID="MobileTextBox" runat="server" Text='<%# Bind("Mobile") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        UHF:
                    </td>
                    <td>
                        <asp:TextBox ID="UHFTextBox" runat="server" Text='<%# Bind("UHF") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Additional Info:
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="AdditionalInfoTextBox" runat="server" Text='<%# Bind("AdditionalInfo") %>'
                            ReadOnly="False" Width="570px" Height="50px" EnableTheming="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="Insert" />
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
                        Area/District:
                    </td>
                    <td>
                        <asp:Label ID="DistrictLabel" runat="server" Text='<%# Bind("District") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Contact Name:
                    </td>
                    <td>
                        <asp:Label ID="ContactNameLabel" runat="server" Text='<%# Bind("ContactName") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Email:
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Telephone:
                    </td>
                    <td>
                        <asp:Label ID="TelephoneLabel" runat="server" Text='<%# Bind("Telephone") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Fax:
                    </td>
                    <td>
                        <asp:Label ID="FaxLabel" runat="server" Text='<%# Bind("Fax") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Mobile:
                    </td>
                    <td>
                        <asp:Label ID="MobileLabel" runat="server" Text='<%# Bind("Mobile") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        UHF:
                    </td>
                    <td>
                        <asp:Label ID="UHFLabel" runat="server" Text='<%# Bind("UHF") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="subhead">
                        Additional Info:
                    </td>
                    <td colspan="3">
                        <asp:Label ID="AdditionalInfoLabel" runat="server" Text='<%# Bind("AdditionalInfo") %>'
                            Width="570px" Height="50px" />
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
    <asp:LinqDataSource ID="ContactsDataSource" runat="server" ContextTypeName="DaviesApiariesDataContext"
        EnableInsert="True" EnableUpdate="True" TableName="Contacts" Where="ContactID == @ContactID">
        <WhereParameters>
            <asp:QueryStringParameter Name="ContactID" QueryStringField="ContactID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
