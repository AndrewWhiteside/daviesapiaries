
Partial Class Main_Contacts_ContactDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Request.QueryString("Mode") = "Insert" Then
                fvContacts.DefaultMode = FormViewMode.Insert
            ElseIf Request.QueryString("Mode") = "Edit" Then
                fvContacts.DefaultMode = FormViewMode.Edit
            Else
                fvContacts.DefaultMode = FormViewMode.ReadOnly
            End If
        End If
    End Sub


    Protected Sub fvContacts_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvContacts.ItemCommand
        If e.CommandName = "Cancel" Then
            Response.Redirect("Contacts.aspx", False)
        End If
    End Sub


    Protected Sub fvContacts_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvContacts.ItemInserted
        Response.Redirect("Contacts.aspx", False)
    End Sub
End Class
