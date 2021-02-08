
Partial Class Main_Activities_ActivitySites
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAddSite_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddSite.Click
        Dim Removeitems As New ListItemCollection
        For Each myitem As ListItem In lstAvaliableSites.Items
            If myitem.Selected Then
                lstRelatedSites.Items.Add(myitem)
                Removeitems.Add(myitem)
            End If
        Next
        For Each removeitem As ListItem In Removeitems
            lstAvaliableSites.Items.Remove(removeitem)
        Next
    End Sub

    Protected Sub btnRemoveSite_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoveSite.Click
        Dim Removeitems As New ListItemCollection
        For Each myitem As ListItem In lstRelatedSites.Items
            If myitem.Selected Then
                lstAvaliableSites.Items.Add(myitem)
                Removeitems.Add(myitem)
            End If
        Next
        For Each RemoveItem As ListItem In Removeitems
            lstRelatedSites.Items.Remove(RemoveItem)
        Next
    End Sub

    Protected Sub btnConfirm_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnConfirm.Click
        Dim dc As New DaviesApiariesDataContext

        'create the activity to be inserted
        Dim thisActivity As New Activity
        thisActivity.ActivityDate = rdbInsertActivity.SelectedDate
        thisActivity.ActivityTypeID = ddlActivityType.SelectedValue
        thisActivity.ActivityDescription = txtActivityDecription.Text
        thisActivity.ActivityMap = fuInsertMap.FileName
        dc.Activities.InsertOnSubmit(thisActivity)

        'submit these changes so we can get the ID inserted.
        dc.SubmitChanges()

        'Insert the ApiarySiteActivity records
        For Each myitem As ListItem In lstRelatedSites.Items
            Dim thisASA As New ApiarySiteActivity
            thisASA.ActivityID = thisActivity.ActivityID
            thisASA.ApiarySiteID = myitem.Value
            dc.ApiarySiteActivities.InsertOnSubmit(thisASA)

        Next

        dc.SubmitChanges()

        If lstRelatedSites.Items.Count = 1 Then
            Dim thisSite As Integer = lstRelatedSites.Items(0).Value
            Response.Redirect(String.Format("~/Main/ApiarySites/ApiarySiteDetails.aspx?ApiarySiteID={0}", thisSite), True)
        End If
        Response.Redirect("Activities.aspx", False)

    End Sub


    Protected Sub lstAvaliableSites_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles lstAvaliableSites.DataBound
        If Not IsNothing(Request.QueryString("ApiarySiteID")) Then
            lstRelatedSites.Items.Add(lstAvaliableSites.Items.FindByValue(Request.QueryString("ApiarySiteID")))
            lstAvaliableSites.Items.Remove(lstAvaliableSites.Items.FindByValue(Request.QueryString("ApiarySiteID")))
        End If
    End Sub
End Class
