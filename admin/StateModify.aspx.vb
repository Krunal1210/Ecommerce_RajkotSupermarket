Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_CategoryModify
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            If Convert.ToInt32(Request("id")) > 0 Then
                binddata()
            End If


        End If


    End Sub

    Private Sub binddata()

        Dim sql(0) As SqlParameter
        sql(0) = New SqlParameter("@pstateId", Convert.ToInt32(Request("id")))
        Dim dt As DataTable = sqlHelper.getDataTable("[PStateListAdmin]", sql, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
            txtCat.Text = Convert.ToString(dt.Rows(0)("statename"))
            
        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        
        Dim sql(1) As SqlParameter
        sql(0) = New SqlParameter("@PstateId", Convert.ToInt32(Request("id")))
        sql(1) = New SqlParameter("@statename", txtCat.Text.Trim())
       

        sqlHelper.executeNonQuery("[PStateModify]", sql, CommandType.StoredProcedure)

        If Convert.ToInt32(Request("id")) > 0 Then
            app.msgSuccess(divMsg, "City Updated Successfully")
        Else
            app.msgSuccess(divMsg, "City Inserted Successfully")
            txtCat.Text = ""
        End If


    End Sub

   

End Class
