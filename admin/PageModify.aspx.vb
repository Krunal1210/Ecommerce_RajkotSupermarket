Imports System.Data
Imports System.Data.SqlClient

Partial Class admin_SchoolModify
    Inherits System.Web.UI.Page

#Region "Declarations"

#End Region

#Region "Page Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            bindPageType()

            Try
                If (Not String.IsNullOrEmpty(Convert.ToString(Request("id")))) And Convert.ToInt32(Request("id")) > 0 Then
                     bindPage()

                End If
            Catch ex As Exception
            End Try

        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Try
            'add/edit starts
            Dim sqlParColl(8) As SqlParameter
            sqlParColl(0) = New SqlParameter("@bintPageId", Convert.ToInt64(hdnPageId.Value))
            sqlParColl(1) = New SqlParameter("@strPageName", txtName.Text.Trim)

            Dim strBanner As String = hdnBannnerName.Value

            If hdnPageId.Value = "0" Then
                If fupBanner.HasFile() Then
                    If Not app.isImage(System.IO.Path.GetExtension(fupBanner.PostedFile.FileName)) Then
                        Throw New Exception("Please upload valid banner file.")
                    Else
                        strBanner = DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(fupBanner.PostedFile.FileName)
                        fupBanner.PostedFile.SaveAs(Server.MapPath("~/userFiles/BannerFiles/") + strBanner)
                    End If
                End If
            Else
                If fupBanner.HasFile() Then
                    If Not app.isImage(System.IO.Path.GetExtension(fupBanner.PostedFile.FileName)) Then
                        Throw New Exception("Please upload valid banner file.")
                    Else

                        Try
                            System.IO.File.Delete(Server.MapPath("~/userFiles/BannerFiles/") + hdnBannnerName.Value)
                        Catch ex As Exception
                        End Try

                        strBanner = DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(fupBanner.PostedFile.FileName)
                        fupBanner.PostedFile.SaveAs(Server.MapPath("~/userFiles/BannerFiles/") + strBanner)

                        hdnPageId.Value = strBanner
                        imgBannerImg.Src = "../userFiles/BannerFiles/" + strBanner

                    End If
                End If
            End If


            sqlParColl(2) = New SqlParameter("@strPageBanner", strBanner)
            sqlParColl(3) = New SqlParameter("@bitHasPdf", chkHasPdf.Checked)

            If drpPageType.SelectedItem.Text = "PDF" Then
                sqlParColl(4) = New SqlParameter("@strContent", DBNull.Value)

                Dim strPdf As String = hdnPdfName.Value
                If hdnPageId.Value = "0" Then
                    If fupPDF.HasFile() Then
                        If Not app.isPdf(System.IO.Path.GetExtension(fupPDF.PostedFile.FileName)) Then
                            Throw New Exception("Please upload valid PDF File")
                        Else
                            strPdf = DateTime.Now.Ticks.ToString() + ".pdf"
                            fupPDF.PostedFile.SaveAs(Server.MapPath("~/userFiles/PdfFiles/") + strPdf)
                        End If
                    Else
                        Throw New Exception("Please upload PDF File")
                    End If
                Else
                    If fupPDF.HasFile() Then
                        If Not app.isPdf(System.IO.Path.GetExtension(fupPDF.PostedFile.FileName)) Then
                            Throw New Exception("Please upload valid PDF File")
                        Else
                            strPdf = hdnPdfName.Value
                            If strPdf = "" Then
                                strPdf = DateTime.Now.Ticks.ToString() + ".pdf"
                            End If
                            fupPDF.PostedFile.SaveAs(Server.MapPath("~/userFiles/PdfFiles/") + strPdf)

                        End If
                    End If
                End If

                sqlParColl(5) = New SqlParameter("@strPdfFileName", strPdf)
            Else
                sqlParColl(4) = New SqlParameter("@strContent", txtContent.Text.Trim)
                sqlParColl(5) = New SqlParameter("@strPdfFileName", DBNull.Value)
            End If

            sqlParColl(6) = New SqlParameter("@intRetVal", 0)
            sqlParColl(6).Direction = ParameterDirection.Output

            Select Case drpPageType.SelectedItem.Text
                Case "Link"
                    sqlParColl(7) = New SqlParameter("@strLink", txtUrl.Text.Trim())
                Case "TopMenu"
                    sqlParColl(7) = New SqlParameter("@strLink", "#")
                Case Else
                    sqlParColl(7) = New SqlParameter("@strLink", DBNull.Value)
            End Select

            sqlParColl(8) = New SqlParameter("@bintPageTypeId", drpPageType.SelectedValue)

            sqlHelper.executeNonQuery("[dbo].[PageModify]", sqlParColl, CommandType.StoredProcedure)
            'add/edit ends

            If sqlParColl(6).Value <> "0" Then
                app.msgError(divMsg, "Same Item name already exists. Please add new name.")
            Else

                If hdnPageId.Value <> "0" Then
                    app.msgSuccess(divMsg, "Page updated successfully.")
                Else
                    app.msgSuccess(divMsg, "Page inserted successfully.")
                    clear()
                End If

            End If

        Catch ex As Exception
            app.msgError(divMsg, ex.Message)
        End Try

    End Sub

    Protected Sub chkHasPdf_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkHasPdf.CheckedChanged
        trPDF.Visible = chkHasPdf.Checked
        trContent.Visible = Not chkHasPdf.Checked
    End Sub


    Protected Sub drpPageType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpPageType.SelectedIndexChanged


        trPDF.Visible = False
        trContent.Visible = False
        trLink.Visible = False

        Select Case drpPageType.SelectedItem.Text

            Case "HTML"
                trContent.Visible = True
            Case "Link"
                trLink.Visible = True
            Case "PDF"
                trPDF.Visible = True
        End Select



    End Sub


#End Region

#Region "Functions"

    Private Sub bindPage()

        'get data starts
        Dim sqlParColl(0) As SqlParameter
        sqlParColl(0) = New SqlParameter("@bintPageId", Convert.ToInt32(Request("id")))
        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[PageListAdmin]", sqlParColl, CommandType.StoredProcedure)
        'get data ends

        If dt.Rows.Count > 0 Then
            txtName.Text = Convert.ToString(dt.Rows(0)("strPageName"))

            aUrl.Visible = True
            spnUrl.Visible = True
            spnUrl.InnerText = app.Value("siteUrl") + "Pages/" + Convert.ToString(dt.Rows(0)("strPageUrl"))

            txtContent.Text = Convert.ToString(dt.Rows(0)("strContent"))
   
            imgBannerImg.Src = "../userFiles/BannerFiles/" + Convert.ToString(dt.Rows(0)("strPageBanner"))

            hdnBannnerName.Value = Convert.ToString(dt.Rows(0)("strPageBanner"))
            hdnPdfName.Value = Convert.ToString(dt.Rows(0)("strPdfFileName"))
            hdnPageId.Value = Convert.ToString(dt.Rows(0)("bintPageId"))

           
            drpPageType.SelectedValue = Convert.ToString(dt.Rows(0)("bintPageTypeId"))

            trPDF.Visible = False
            trContent.Visible = False
            trLink.Visible = False
            aDownloadPdf.Visible = False

            Select Case drpPageType.SelectedItem.Text

                Case "HTML"
                    trContent.Visible = True
                Case "Link"
                    trLink.Visible = True

                Case "PDF"
                    trPDF.Visible = True
                    aDownloadPdf.Visible = True
                    aDownloadPdf.HRef = "../userFiles/PdfFiles/" + Convert.ToString(dt.Rows(0)("strPdfFileName"))

            End Select

            txtUrl.Text = Convert.ToString(dt.Rows(0)("strLink"))

            h2Title.InnerHtml = "Edit Item"

        End If

    End Sub

    Private Sub bindPageType()

        Dim dt As DataTable = sqlHelper.getDataTable("[PageTypeListAdmin]", CommandType.StoredProcedure)
        drpPageType.DataSource = dt
        drpPageType.DataBind()

        drpPageType.Items.Insert(0, New ListItem("Select Page Type", "0"))

    End Sub



    Private Sub clear()
        ClearData.clearAllTextBox(pnlData)
        txtContent.Text = ""
    End Sub

#End Region



End Class
