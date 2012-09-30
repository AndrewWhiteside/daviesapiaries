
Partial Class Admin_ManagePrimaryResources
    Inherits System.Web.UI.Page

    Protected Sub lkbAddPrimaryResource_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lkbAddPrimaryResource.Click
        fvPrimaryResource.Visible = True
    End Sub


    Protected Sub fvPrimaryResource_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvPrimaryResource.ItemCommand
        If e.CommandName = "Cancel" Then
            fvPrimaryResource.Visible = False
        End If
    End Sub


    Protected Sub fvPrimaryResource_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvPrimaryResource.ItemInserted
        fvPrimaryResource.Visible = False
        gvPrimaryResource.DataBind()
    End Sub
End Class
