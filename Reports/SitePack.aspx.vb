
Partial Class Reports_SitePack
    Inherits System.Web.UI.Page

    Protected Sub ddlApiarySite_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlApiarySite.SelectedIndexChanged
        rvSitePack.LocalReport.Refresh()
    End Sub
End Class
