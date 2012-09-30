Imports System.Configuration.ConfigurationManager


Partial Class Main_ApiarySites_ApiarySiteDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Request.QueryString("Mode") = "Insert" Then
                fvApiarySite.DefaultMode = FormViewMode.Insert
            ElseIf Request.QueryString("Mode") = "Edit" Then
                fvApiarySite.DefaultMode = FormViewMode.Edit
            Else
                fvApiarySite.DefaultMode = FormViewMode.ReadOnly
            End If
        End If

        If Not IsNothing(Request.QueryString("ApiarySiteID")) Then
            HplAddActivity.NavigateUrl = String.Format("~/Main/Activities/InsertActivity.aspx?ApiarySiteID={0}", Request.QueryString("ApiarySiteID"))
        End If

    End Sub

    Protected Sub fvApiarySite_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvApiarySite.ItemCommand
        If e.CommandName = "Cancel" Then
            Response.Redirect("ApiarySites.aspx", False)
        End If
    End Sub


    Protected Sub fvApiarySite_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvApiarySite.ItemInserted
        Response.Redirect("ApiarySites.aspx", False)
    End Sub

    Protected Function GetPDFPath() As String
        Return "~/OpenPDF.aspx?FilePath=" & Server.UrlEncode(Eval("Map"))
    End Function

    Protected Sub fvApiarySite_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles fvApiarySite.ItemInserting
        Dim fu As FileUpload = fvApiarySite.FindControl("fuInsertMap")
        If fu.HasFile Then
            e.Values("Map") = fu.FileName
        End If
        If String.IsNullOrEmpty(e.Values("GPSLatitude")) Then
            e.Values("GPSLatitude") = Convert.ToDecimal(0)
        End If
        If String.IsNullOrEmpty(e.Values("GPSLongitude")) Then
            e.Values("GPSLongitude") = Convert.ToDecimal(0)
        End If
    End Sub

    Protected Sub fvApiarySite_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles fvApiarySite.ItemUpdating
        Dim fu As FileUpload = fvApiarySite.FindControl("fuEditMap")
        If fu.HasFile Then
            CopyFiletoStore(AppSettings("FileStorePath"), fu)
            e.NewValues("Map") = fu.FileName
        End If
    End Sub

    Protected Sub fvApiarySite_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvApiarySite.PreRender
        If fvApiarySite.CurrentMode <> FormViewMode.Insert Then
            Dim db As New DaviesApiariesDataContext
            gvSiteActivities.DataSource = From a In db.Activities, asa In db.ApiarySiteActivities _
                                          Where asa.ApiarySiteID = fvApiarySite.SelectedValue.ToString _
                                          And a.ActivityID = asa.ActivityID _
                                     Select a.ActivityDate, a.ActivityType, a.ActivityDescription, a.ActivityID _
                                     Order By ActivityDate
            gvSiteActivities.DataBind()
        End If
    End Sub

    Private Sub CopyFileToStore(ByVal FileStorePath As String, ByVal oFile As FileUpload)
        EnsurePathExists(AppSettings("FileStorePath"))
        oFile.PostedFile.SaveAs(AppSettings("FileStorePath") & oFile.FileName)
    End Sub

    Private Sub EnsurePathExists(ByVal sPath As String)

        EnsurePathExists(New System.IO.DirectoryInfo(sPath))

    End Sub

    Private Sub EnsurePathExists(ByVal oDirInfo As System.IO.DirectoryInfo)

        If Not oDirInfo.Parent Is Nothing Then
            EnsurePathExists(oDirInfo.Parent)
        End If
        If Not oDirInfo.Exists Then
            oDirInfo.Create()
        End If

    End Sub
End Class
