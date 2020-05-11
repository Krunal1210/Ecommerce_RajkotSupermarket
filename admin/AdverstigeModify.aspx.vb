
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Imports System.Data
Imports System.Data.SqlClient

Partial Public Class admin_Addv
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

            imgupload.PostedFile.SaveAs(Server.MapPath("~/userFiles/Addimage/" + filename))
        End If



        Dim spar As SqlParameter() = New SqlParameter(5) {}
        spar(0) = New SqlParameter("@intAdverstigeId", Convert.ToInt32(Convert.ToString(Request.QueryString("id"))))
        spar(1) = New SqlParameter("@strAdverstigeName", txtName.Text.Trim())
        spar(2) = New SqlParameter("@intAdverstigeLocationId", Convert.ToInt32(dpdLocation.SelectedValue))
        spar(3) = New SqlParameter("@strImage", filename)
        spar(4) = New SqlParameter("@strUrl", txtUrl.Text.Trim)
        spar(5) = New SqlParameter("@intOrder", txtOrder.Text.Trim)

        sqlHelper.executeNonQuery("[dbo].[AdverstigeModify]", spar, CommandType.StoredProcedure)

        If Convert.ToInt32(Request("id")) > 0 Then
            app.msgSuccess(divMsg, "Adverstige Updated Successfully")
        Else
            app.msgSuccess(divMsg, "Adverstige Inserted Successfully")
            txtName.Text = ""
            txtUrl.Text = ""
            txtOrder.Text = ""
            dpdLocation.ClearSelection()
        End If

    End Sub

#End Region


#Region "Functions"

    Private Sub bindEditPage()

        If Not String.IsNullOrEmpty(Convert.ToString(Request.QueryString("id"))) Then
            Dim spar As SqlParameter() = New SqlParameter(0) {}
            spar(0) = New SqlParameter("@intAdverstigeId", Convert.ToInt32(Convert.ToString(Request.QueryString("id"))))



            Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[AdverstigeListAdmin]", spar, CommandType.StoredProcedure)

            If dt.Rows.Count > 0 Then
                Try
                    txtName.Text = Convert.ToString(dt.Rows(0)("strAdverstigeName"))

                    dpdLocation.SelectedValue = Convert.ToInt32(dt.Rows(0)("intAdverstigeLocationId"))

                    hdnedit.Value = Convert.ToString(dt.Rows(0)("strImage"))

                    imgedit.Src = "../userFiles/Addimage/" + Convert.ToString(dt.Rows(0)("strImage"))

                    txtUrl.Text = Convert.ToString(dt.Rows(0)("strUrl"))

                    txtOrder.Text = Convert.ToInt32(dt.Rows(0)("intOrder"))

                    h2Adverstige.InnerText = "Modify Adverstige"
                Catch ex As Exception

                End Try

            End If
        End If

    End Sub



    Private Sub clear()

    End Sub

#End Region

End Class


