
Partial Class admin_SchoolList
    Inherits System.Web.UI.Page

#Region "Page events"

    Protected Sub btnAction_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim drpAct As DropDownList = CType(ListView1.FindControl("drpActions"), DropDownList)
        Dim hdnVal As HiddenField = CType(ListView1.FindControl("hdnChk"), HiddenField)
        app.GeneralOpration("tblMenu", "bintMenuId", hdnVal.Value.Trim(","), drpAct.SelectedValue)
        hdnVal.Value = ""
        ListView1.DataBind()
    End Sub

#End Region


End Class
