﻿Imports System.Data
Imports System.Data.SqlClient


Partial Class userControls_Html
    Inherits System.Web.UI.UserControl




#Region "Declarations"

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            If Not String.IsNullOrEmpty(Convert.ToString(Session("pageType"))) Then
                If Session("pageType") = "pdf" Then


                    If String.IsNullOrEmpty(Convert.ToString(Request("url"))) Then
                        bindPageNotFound()
                    Else
                        bindPage()
                    End If



                End If
            End If
        End If
         
    End Sub



    Protected Sub lnkDownload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkDownload.Click

        Try


            Response.Clear()
            Response.ContentType = "Application/pdf"
            Response.AddHeader("Content-Disposition", "attachment; filename=" & ViewState("strPdfFile"))
            Dim FilePath As String = MapPath("~/userFiles\PdfFiles\" & ViewState("strPdfFile"))
            Response.WriteFile(FilePath)
            Response.End()

        Catch ex As Exception

        End Try


    End Sub


#End Region


#Region "Functions"

    Private Sub bindPage()

        Dim sqlPar(0) As SqlParameter
        sqlPar(0) = New SqlParameter("@strPageUrl", Convert.ToString(Request("url")))
        Dim dt As DataTable = sqlHelper.getDataTable("[PageDetailByUrl]", sqlPar, CommandType.StoredProcedure)

        If dt.Rows.Count > 0 Then


            ltrlTitle1.Text = Convert.ToString(dt.Rows(0)("strPageName"))
            ltrlTitle2.Text = Convert.ToString(dt.Rows(0)("strPageName"))


            ViewState("strPdfFile") = Convert.ToString(dt.Rows(0)("strPdfFileName"))
            lnkDownload.Visible = True

            tdContent.InnerHtml = " <embed src=""" + app.Value("siteUrl") + "userFiles/PdfFiles/" + Convert.ToString(dt.Rows(0)("strPdfFileName")) + """ width=""930"" height=""500"">"


        Else
            bindPageNotFound()
        End If

    End Sub

    Private Sub bindPageNotFound()

    End Sub

#End Region




   
End Class
