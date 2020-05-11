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
        sql(0) = New SqlParameter("@bintCategoryId", Convert.ToInt32(Request("id")))
        Dim dt As DataTable = sqlHelper.getDataTable("[CategoryListAdmin]", sql, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
            txtCat.Text = Convert.ToString(dt.Rows(0)("strCategoryName"))
            txtDesc.Text = Convert.ToString(dt.Rows(0)("strDesc"))
            txtCode.Text = Convert.ToString(dt.Rows(0)("OrderId"))
            drpParCategory.SelectedValue = Convert.ToString(dt.Rows(0)("ParentId"))
            hdnedit.Value = Convert.ToString(dt.Rows(0)("strPhoto"))

            imgedit.Src = "../userFiles/CategoryImage/" & Convert.ToString(dt.Rows(0)("strPhoto"))

            Try

                txtDisplayname.Text = Convert.ToString(dt.Rows(0)("DisplayName"))
            Catch ex As Exception

            End Try
            Try
                chkHome.Checked = Convert.ToBoolean(dt.Rows(0)("IsDisplayOnHome"))
            Catch ex As Exception

            End Try
        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim filename As String = hdnedit.Value

        If imgupload.HasFile Then

            filename = DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(imgupload.PostedFile.FileName)

            imgupload.PostedFile.SaveAs(Server.MapPath("~/userFiles/CategoryImage/" + filename))


        
        End If
        Dim sql(7) As SqlParameter
        sql(0) = New SqlParameter("@bintCategoryId", Convert.ToInt32(Request("id")))
        sql(1) = New SqlParameter("@strCategoryName", txtCat.Text.Trim())
        sql(2) = New SqlParameter("@strDesc", txtDesc.Text.Trim())
        sql(3) = New SqlParameter("@OrderId", txtCode.Text.Trim())
        sql(4) = New SqlParameter("@ParentId", drpParCategory.SelectedValue)
        sql(5) = New SqlParameter("@strPhoto", filename)
        sql(6) = New SqlParameter("@DisplayName", txtDisplayname.Text.Trim())
        sql(7) = New SqlParameter("@IsDisplayOnHome", chkHome.Checked)
        sqlHelper.executeNonQuery("CategoryModify", sql, CommandType.StoredProcedure)

        If Convert.ToInt32(Request("id")) > 0 Then
            app.msgSuccess(divMsg, "Category Updated Successfully")
        Else
            app.msgSuccess(divMsg, "Category Inserted Successfully")
        End If


    End Sub

    Private Sub bindCateGory()

        Dim dtCat As DataTable = sqlHelper.getDataTable("[dbo].[ParentCategoryListDrpdn]", CommandType.StoredProcedure)
        drpParCategory.DataSource = dtCat
        drpParCategory.DataBind()

        drpParCategory.Items.Insert(0, New ListItem("Root", "0"))
    End Sub

End Class
