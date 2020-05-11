Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_BrandMasterModify
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
        sql(0) = New SqlParameter("@brandId", Convert.ToInt32(Request("id")))
        Dim dt As DataTable = sqlHelper.getDataTable("dbo.BrandMasterListAdmin", sql, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
            txtCat.Text = Convert.ToString(dt.Rows(0)("strName"))
            txtDesc.Text = Convert.ToString(dt.Rows(0)("strDesc"))
            
            hdnedit.Value = Convert.ToString(dt.Rows(0)("strlogo"))

            imgedit.Src = "../userFiles/BrandImage/" & Convert.ToString(dt.Rows(0)("strlogo"))
        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim filename As String = hdnedit.Value

        If imgupload.HasFile Then

            filename = DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(imgupload.PostedFile.FileName)

            imgupload.PostedFile.SaveAs(Server.MapPath("~/userFiles/BrandImage/" + filename))



        End If
        Dim sql(3) As SqlParameter
        sql(0) = New SqlParameter("@brandId", Convert.ToInt32(Request("id")))
        sql(1) = New SqlParameter("@strName", txtCat.Text.Trim())
        sql(2) = New SqlParameter("@strDesc", txtDesc.Text.Trim())
        sql(3) = New SqlParameter("@strlogo", filename)

        sqlHelper.executeNonQuery("dbo.Brandmodify", sql, CommandType.StoredProcedure)

        If Convert.ToInt32(Request("id")) > 0 Then
            app.msgSuccess(divMsg, "BrandMaster Updated Successfully")
        Else
            app.msgSuccess(divMsg, "BrandMaster Inserted Successfully")
        End If


    End Sub

     

End Class
