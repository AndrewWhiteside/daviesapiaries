
Partial Class Management_ManageActivityTypes
    Inherits System.Web.UI.Page

    Protected Sub lkbAddActivityType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lkbAddActivityType.Click
        fvActivityTypes.Visible = True
    End Sub


    Protected Sub fvActivityTypes_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvActivityTypes.ItemCommand
        If e.CommandName = "Cancel" Then
            fvActivityTypes.Visible = False
        End If
    End Sub


    Protected Sub fvActivityTypes_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvActivityTypes.ItemInserted
        fvActivityTypes.Visible = False
        gvActivityTypes.DataBind()
    End Sub
End Class
