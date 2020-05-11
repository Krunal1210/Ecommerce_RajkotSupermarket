Imports System.Data
Imports System.Data.SqlClient


Partial Class userControls_VideoGallery
    Inherits System.Web.UI.UserControl




#Region "Declarations"

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            If Not String.IsNullOrEmpty(Convert.ToString(Session("pageType"))) Then
                If Session("pageType") = "videogallery" Then


                    bindVideoGallery()


                End If
            End If
        End If


         

    End Sub

#End Region


#Region "Functions"

    Private Sub bindVideoGallery()




        Dim dt As DataTable = sqlHelper.getDataTable("[VideoGalleryListFront]", CommandType.StoredProcedure)

        rptVideoGallery.DataSource = dt
        rptVideoGallery.DataBind()

    End Sub



#End Region





End Class
