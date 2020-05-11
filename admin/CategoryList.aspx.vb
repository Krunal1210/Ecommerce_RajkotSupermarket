
Partial Class admin_CategoryList
    Inherits System.Web.UI.Page
    Protected Sub btnAction_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim drpAct As DropDownList = CType(ListView1.FindControl("drpActions"), DropDownList)
        Dim hdnVal As HiddenField = CType(ListView1.FindControl("hdnChk"), HiddenField)
        app.GeneralOpration("tblCategory", "bintCategoryId", hdnVal.Value.Trim(","), drpAct.SelectedValue)
        hdnVal.Value = ""
        ListView1.DataBind()
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        Dim strQry As String = "1=1 "

        
        If txtName.Text <> "" Then
            strQry += " And Cathirarchy like '%" & txtName.Text.Trim() & "%'"
        End If

        SqlDataSource1.FilterExpression = strQry
        ListView1.DataBind()
    End Sub
End Class
