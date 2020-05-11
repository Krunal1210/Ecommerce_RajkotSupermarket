Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_CategoryModify
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            bindCity()
            If Convert.ToInt32(Request("id")) > 0 Then
                binddata()
            End If


        End If


    End Sub

    Private Sub binddata()

        Dim sql(0) As SqlParameter
        sql(0) = New SqlParameter("@stateId", Convert.ToInt32(Request("id")))
        Dim dt As DataTable = sqlHelper.getDataTable("[StateListAdmin]", sql, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
            txtCat.Text = Convert.ToString(dt.Rows(0)("statename"))
            dpdPState.SelectedValue = Convert.ToString(dt.Rows(0)("pstateid"))
        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        
        Dim sql(2) As SqlParameter
        sql(0) = New SqlParameter("@stateId", Convert.ToInt32(Request("id")))
        sql(1) = New SqlParameter("@statename", txtCat.Text.Trim())
        sql(2) = New SqlParameter("@pstateid", dpdPState.SelectedValue)

        sqlHelper.executeNonQuery("[StateModify_Area]", sql, CommandType.StoredProcedure)

        If Convert.ToInt32(Request("id")) > 0 Then
            app.msgSuccess(divMsg, "Area Updated Successfully")
        Else
            app.msgSuccess(divMsg, "Area Inserted Successfully")
            txtCat.Text = ""
        End If


    End Sub

    Private Sub bindCity()
        Dim dtCat As DataTable = sqlHelper.getDataTable("[dbo].[PStateListdrpwn]", CommandType.StoredProcedure)
        dpdPState.DataSource = dtCat
        dpdPState.DataBind()

        dpdPState.Items.Insert(0, New ListItem("Select City", "0"))
    End Sub

   

End Class
