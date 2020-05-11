Imports System.Data
Imports System.Data.SqlClient


Partial Class userControls_ImageGallery
    Inherits System.Web.UI.UserControl


    

#Region "Declarations"

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            bindGallery()
        End If

    End Sub

#End Region


#Region "Functions"

    Private Sub bindGallery()


        Dim dt As DataTable = sqlHelper.getDataTable("[GalleryListFront]", CommandType.StoredProcedure)

        rptNews.DataSource = dt
        rptNews.DataBind()

    End Sub



#End Region




End Class
