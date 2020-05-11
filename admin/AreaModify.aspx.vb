Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_CategoryModify
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            bindCateGory()
            If Convert.ToInt32(Request("id")) > 0 Then
                binddata()
            End If


        End If


    End Sub

    Private Sub binddata()

        Dim sql(0) As SqlParameter
        sql(0) = New SqlParameter("@cityid", Convert.ToInt32(Request("id")))
        Dim dt As DataTable = sqlHelper.getDataTable("[CityListAdmin]", sql, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
            txtCat.Text = Convert.ToString(dt.Rows(0)("CityName"))
            txtAmount.Text = Convert.ToString(dt.Rows(0)("ShipingAmount"))


            Try
                dpdPState.SelectedValue = Convert.ToString(dt.Rows(0)("pstateid"))
                bindPStateChange()
            Catch ex As Exception

            End Try
            drpParCategory.SelectedValue = Convert.ToString(dt.Rows(0)("stateid"))
        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim sql(4) As SqlParameter
        sql(0) = New SqlParameter("@cityid", Convert.ToInt32(Request("id")))
        sql(1) = New SqlParameter("@CityName", txtCat.Text.Trim())
        sql(2) = New SqlParameter("@Stateid", drpParCategory.SelectedValue)
        sql(3) = New SqlParameter("@ShipingAmount", txtAmount.Text.Trim)
        sql(4) = New SqlParameter("@ShipingAmount", txtAmount.Text.Trim)
        sqlHelper.executeNonQuery("CityModify", sql, CommandType.StoredProcedure)

        If Convert.ToInt32(Request("id")) > 0 Then
            app.msgSuccess(divMsg, "SubArea Updated Successfully")
        Else
            app.msgSuccess(divMsg, "SubArea Inserted Successfully")
            txtCat.Text = ""
            drpParCategory.ClearSelection()
        End If


    End Sub

    Private Sub bindCateGory()

        Dim dtCat As DataTable = sqlHelper.getDataTable("[dbo].[pStateListdrpwn]", CommandType.StoredProcedure)
        dpdPState.DataSource = dtCat
        dpdPState.DataBind()

        dpdPState.Items.Insert(0, New ListItem("Select City", "0"))
    End Sub
    Protected Sub dpdPState_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpdPState.SelectedIndexChanged
        bindPStateChange()
    End Sub

    Private Sub bindPStateChange()
        If dpdPState.SelectedValue <> "0" Then

            Dim sqlpar(0) As SqlParameter
            sqlpar(0) = New SqlParameter("@PStateId", dpdPState.SelectedValue)

            Dim dtc As DataTable = sqlHelper.getDataTable("[pStatewiseStateList]", sqlpar, CommandType.StoredProcedure)

            drpParCategory.DataSource = dtc
            drpParCategory.DataBind()
            drpParCategory.Items.Insert(0, New ListItem("Select Area", "0"))
        Else
            drpParCategory.ClearSelection()

        End If

    End Sub
End Class
