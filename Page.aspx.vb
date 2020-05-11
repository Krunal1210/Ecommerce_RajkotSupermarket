Imports System.Data
Imports System.Data.SqlClient

Partial Class About
    Inherits System.Web.UI.Page



#Region "Declarations"

    Public strMeta As String

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            bindPage()
          

        End If


    End Sub
    Public Shared Function GetCurrentDate() As DateTime
        Dim timeUtc As DateTime = System.DateTime.UtcNow
        Dim cstZone As TimeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")
        Dim cstTime As DateTime = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, cstZone)
        Return cstTime
    End Function
#End Region


#Region "Functions"

    Private Sub bindPage()

        Dim sqlPar(0) As SqlParameter
        sqlPar(0) = New SqlParameter("@strPageUrl", Convert.ToString(Request("url")))
        Dim dt As DataTable = sqlHelper.getDataTable("[PageShortDetailByUrl]", sqlPar, CommandType.StoredProcedure)

        If dt.Rows.Count > 0 Then

            liCrumb.InnerHtml = Convert.ToString(dt.Rows(0)("strPagename")).ToUpper
            Select Case Convert.ToString(dt.Rows(0)("strPageType")).ToLower
                Case "html"
                    ucHtml.Visible = True
                    Session("pageType") = "html"
                    Exit Select
                Case "link"
                Case "topmenu"
                Case "imagegallery"
                    ucImgGallery.Visible = True
                    Session("pageType") = "imagegallery"
                    Exit Select
                Case "videogallery"
                    ucVideoGallery.Visible = True
                    Session("pageType") = "videogallery"
                    Exit Select
                Case "download"
                    ucDownload.Visible = True
                    Session("pageType") = "download"
                    Exit Select
                Case "tender"
                    ucTender.Visible = True
                    Session("pageType") = "tender"
                    Exit Select
                Case "news"
                    ucNews.Visible = True
                    Session("pageType") = "news"
                    Exit Select
                Case "pdf"
                    ucPdf.Visible = True
                    Session("pageType") = "pdf"
                    Exit Select
                Case "grievances"
                    ucGrievances.Visible = True
                    Session("pageType") = "grievances"
                    Exit Select
                Case "feedback"
                    ucFeedback.Visible = True
                    Session("pageType") = "feedback"
                    Exit Select
            End Select


            h2Header.InnerHtml = Convert.ToString(dt.Rows(0)("strPageName"))

            Page.Title = h2Header.InnerHtml + " , Rajkot Supermarket"

            'If Not String.IsNullOrEmpty(dt.Rows(0)("strPageBanner")) Then
            '    imgBanner.Src = app.Value("siteUrl") + "userFiles/BannerFiles/" + Convert.ToString(dt.Rows(0)("strPageBanner"))
            'End If

            ltrlMeta.Text = "<meta name=""title"" lang=""eng"" Content=""" + h2Header.InnerHtml + " , Rajkot Supermarket""> <meta name=""description""  Content="" Rajkot Supermarket offers " + h2Header.InnerHtml + " , Rajkot Supermarket "">"


        End If

    End Sub



#End Region




End Class
