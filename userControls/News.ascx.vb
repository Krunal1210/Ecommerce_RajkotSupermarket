Imports System.Data
Imports System.Data.SqlClient


Partial Class userControls_News
    Inherits System.Web.UI.UserControl




#Region "Declarations"

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not Page.IsPostBack Then

            If Not String.IsNullOrEmpty(Convert.ToString(Session("pageType"))) Then
                If Session("pageType") = "news" Then


                    bindNews()


                End If
            End If
        End If



       

    End Sub

#End Region


#Region "Functions"

    Private Sub bindNews()


        Dim dt As DataTable = sqlHelper.getDataTable("[NewsListClient]", CommandType.StoredProcedure)

        rptNews.DataSource = dt
        rptNews.DataBind()

    End Sub



#End Region





End Class
