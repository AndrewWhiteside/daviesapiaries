
Partial Class Admin_ManageAreas
    Inherits System.Web.UI.Page

    Protected Sub lkbAddArea_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lkbAddArea.Click
        fvAreas.Visible = True
    End Sub


    Protected Sub fvAreas_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvAreas.ItemCommand
        If e.CommandName = "Cancel" Then
            fvAreas.Visible = False
        End If
    End Sub


    Protected Sub fvAreas_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvAreas.ItemInserted
        fvAreas.Visible = False
        gvAreas.DataBind()
    End Sub
End Class
