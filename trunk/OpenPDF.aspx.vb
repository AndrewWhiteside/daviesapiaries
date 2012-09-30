Imports System.IO
Imports System.Configuration.ConfigurationManager


Partial Class OpenPDF
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim fi As FileInfo = New FileInfo(AppSettings("FileStorePath") & Request.QueryString("FilePath"))
        If fi.Exists Then
            Response.Clear()
            Response.ContentType = "application/pdf"
            Response.AddHeader("Content-Disposition", "inline; filename=" + fi.Name)
            Response.AddHeader("Content-Length", fi.Length.ToString())
            Response.WriteFile(fi.FullName)
            Response.End()
        Else
            lblErrorMessage.Visible = True
            lblErrorMessage.Text = String.Format("file:({0}) does not exist!", AppSettings("FileStorePath") & Request.QueryString("FilePath"))
        End If

    End Sub



End Class
