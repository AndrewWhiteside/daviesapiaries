
Partial Class Main_Activities_ActivityDetails
    Inherits System.Web.UI.Page

    Protected Sub fvActivityDetails_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvActivityDetails.ItemCommand
        If e.CommandName = "Cancel" Then
            Response.Redirect("Activities.aspx", False)
        End If
    End Sub

    Protected Sub fvActivityDetails_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvActivityDetails.ItemInserted
        Response.Redirect(String.Format("ActivitySites.aspx"), False)
    End Sub

    Protected Sub fvActivityDetails_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles fvActivityDetails.ItemInserting
        Dim fu As FileUpload = fvActivityDetails.FindControl("fuInsertMap")
        If fu.HasFile Then
            e.Values("ActivityMap") = fu.FileName
        End If
    End Sub



    Protected Sub fvActivityDetails_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles fvActivityDetails.ItemUpdating
        'Update Map
        Dim fu As FileUpload = fvActivityDetails.FindControl("fuEditMap")
        If fu.HasFile Then
            e.NewValues("ActivityMap") = fu.FileName
        End If
    End Sub

    Protected Sub fvActivityDetails_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvActivityDetails.Load
        If Not Page.IsPostBack Then
            If Request.QueryString("Mode") = "Insert" Then
                fvActivityDetails.DefaultMode = FormViewMode.Insert
                Dim DateTextBox As TextBox = fvActivityDetails.FindControl("InsertActivityDateTextBox")
                DateTextBox.Text = Date.Now.Date
            ElseIf Request.QueryString("Mode") = "Edit" Then
                fvActivityDetails.DefaultMode = FormViewMode.Edit
            Else
                fvActivityDetails.DefaultMode = FormViewMode.ReadOnly
            End If
        End If
    End Sub

    Protected Sub fvActivityDetails_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvActivityDetails.PreRender
        Dim db As New DaviesApiariesDataContext
        Dim lb As ListBox = fvActivityDetails.FindControl("lstApiarySites")
        Dim ActivityID As Integer = fvActivityDetails.SelectedValue

        If Not IsNothing(lb) Then
            lb.DataSource = From ApiarySiteActivities In db.ApiarySiteActivities _
                            Where ApiarySiteActivities.ActivityID = ActivityID _
                                     Select ApiarySiteActivities.ApiarySite.SiteNo _
                                     Order By SiteNo
            lb.DataBind()
        End If

        If fvActivityDetails.CurrentMode = FormViewMode.Edit Then
            Dim Editlb As ListBox = fvActivityDetails.FindControl("lstRelatedSites")
            Editlb.DataSource = From ApiarySiteActivities In db.ApiarySiteActivities _
                                Where ApiarySiteActivities.ActivityID = ActivityID _
                                     Select ApiarySiteActivities.ApiarySiteID, ApiarySiteActivities.ApiarySite.SiteNo _
                                     Order By SiteNo
            Editlb.DataBind()
            Dim Availablelb As ListBox = fvActivityDetails.FindControl("lstSiteList")
            For Each li As ListItem In Editlb.Items
                Availablelb.Items.Remove(Editlb.Items.FindByValue(li.Value))
            Next
        End If

    End Sub

    Protected Function GetPDFPath() As String
        Return "~/OpenPDF.aspx?FilePath=" & Server.UrlEncode(Eval("ActivityMap"))
    End Function

    Protected Sub btnRemoveSite_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim lstSelectedSites As ListBox = fvActivityDetails.FindControl("lstRelatedSites")
        For Each li As ListItem In lstSelectedSites.Items
            If li.Selected Then
                Dim dc As New DaviesApiariesDataContext
                Dim asa As New ApiarySiteActivity()
                asa.ApiarySiteID = li.Value
                asa.ActivityID = fvActivityDetails.SelectedValue
                dc.ApiarySiteActivities.Attach(asa)
                dc.ApiarySiteActivities.DeleteOnSubmit(asa)
                dc.SubmitChanges()
            End If
        Next

        lstSelectedSites.DataBind()
    End Sub

    Protected Sub btnAddSite_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim lstAvaliableSites As ListBox = fvActivityDetails.FindControl("lstSiteList")
        For Each li As ListItem In lstAvaliableSites.Items
            If li.Selected Then
                Dim dc As New DaviesApiariesDataContext
                Dim newASA As New ApiarySiteActivity()
                newASA.ActivityID = fvActivityDetails.SelectedValue
                newASA.ApiarySiteID = li.Value
                dc.ApiarySiteActivities.InsertOnSubmit(newASA)
                dc.SubmitChanges()
            End If
        Next
        Dim lstSelectedSites As ListBox = fvActivityDetails.FindControl("lstRelatedSites")
        lstSelectedSites.DataBind()
    End Sub

    Protected Sub ActivitiesDataSource_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LinqDataSourceStatusEventArgs) Handles ActivitiesDataSource.Deleted
        Response.Redirect("Activities.aspx", False)
    End Sub

    Protected Sub ActivitiesDataSource_Deleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LinqDataSourceDeleteEventArgs) Handles ActivitiesDataSource.Deleting

        Dim deleteActivity As Activity = DirectCast(e.OriginalObject, Activity)

        Dim dc As New DaviesApiariesDataContext
        Dim asa = From ApiarySiteActivities In dc.ApiarySiteActivities _
                                                 Where ApiarySiteActivities.ActivityID = deleteActivity.ActivityID

        dc.ApiarySiteActivities.DeleteAllOnSubmit(asa)
        dc.SubmitChanges()
    End Sub
End Class
