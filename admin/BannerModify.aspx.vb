
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Imports System.Data
Imports System.Data.SqlClient

Partial Public Class Admin_LotModify
    Inherits System.Web.UI.Page
#Region "Page Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not IsPostBack Then
            If (Convert.ToInt32(Request.QueryString("id"))) > 0 Then

                bindEditPage()

            End If
        End If
    End Sub



    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim filename As [String] = hdnedit.Value


        If imgupload.HasFile Then

            filename = DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(imgupload.PostedFile.FileName)

            imgupload.PostedFile.SaveAs(Server.MapPath("~/userFiles/BannerImage/" + filename))
        End If



        Dim spar As SqlParameter() = New SqlParameter(7) {}
        spar(0) = New SqlParameter("@intBannerId", Convert.ToInt32(Convert.ToString(Request.QueryString("id"))))
        spar(1) = New SqlParameter("@strBannerName", txtName.Text.Trim())
        spar(2) = New SqlParameter("@strImage", filename)
        spar(3) = New SqlParameter("@strUrl", txtUrl.Text.Trim)
        spar(4) = New SqlParameter("@bitIsHome", chkHome.Checked)
        spar(5) = New SqlParameter("@bitIsCart", chkCart.Checked)
        spar(6) = New SqlParameter("@intOrder", txtOrder.Text.Trim)


        sqlHelper.executeNonQuery("[dbo].[BannerModify]", spar, CommandType.StoredProcedure)

        If Convert.ToInt32(Request("id")) > 0 Then
            app.msgSuccess(divMsg, "Banner Updated Successfully")
        Else
            app.msgSuccess(divMsg, "Banner Inserted Successfully")
            txtName.Text = ""
            txtUrl.Text = ""
        End If

    End Sub

#End Region


#Region "Functions"

    Private Sub bindEditPage()

        If Not String.IsNullOrEmpty(Convert.ToString(Request.QueryString("id"))) Then
            Dim spar As SqlParameter() = New SqlParameter(0) {}
            spar(0) = New SqlParameter("@intBannerId", Convert.ToInt32(Convert.ToString(Request.QueryString("id"))))



            Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[BannerListAdmin]", spar, CommandType.StoredProcedure)

            If dt.Rows.Count > 0 Then
                Try
                    txtName.Text = Convert.ToString(dt.Rows(0)("strBannerName"))

                    hdnedit.Value = Convert.ToString(dt.Rows(0)("strImage"))

                    imgedit.Src = "../userFiles/BannerImage/" + Convert.ToString(dt.Rows(0)("strImage"))

                    txtUrl.Text = Convert.ToString(dt.Rows(0)("strUrl"))
                    h2Banner.InnerText = "Modify Banner"

                Catch ex As Exception

                End Try

                Try
                    txtOrder.Text = Convert.ToString(dt.Rows(0)("intOrder"))
                Catch ex As Exception

                End Try
                Try
                    chkCart.Checked = Convert.ToBoolean(dt.Rows(0)("bitIsCart"))
                    chkHome.Checked = Convert.ToBoolean(dt.Rows(0)("bitIsHome"))
                Catch ex As Exception

                End Try

            End If
        End If

    End Sub



    Private Sub clear()

    End Sub

#End Region

End Class


