
Partial Class Main_ApiarySites
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Dim FilterString As New StringBuilder

            If ddlPrimaryResource.SelectedValue <> -1 Then
                FilterString.Append(String.Format("PrimaryResourceID = {0}", ddlPrimaryResource.SelectedValue))
            End If

            If ddlArea.SelectedValue <> -1 Then
                If FilterString.Length > 1 Then
                    FilterString.Append(" AND")
                End If
                FilterString.Append(String.Format(" AreaID = {0}", ddlArea.SelectedValue))
            End If

            ApiarySitesDataSource.Where = FilterString.ToString
            gvApiarySites.DataBind()
        End If
    End Sub


End Class
