Imports System.Data
Imports System.Data.SqlClient


Partial Class userControls_Html
    Inherits System.Web.UI.UserControl




#Region "Declarations"

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            If Not String.IsNullOrEmpty(Convert.ToString(Session("pageType"))) Then
                If Session("pageType") = "html" Then

                    If String.IsNullOrEmpty(Convert.ToString(Request("url"))) Then

                        bindPageNotFound()
                    Else
                        bindPage()
                    End If

                End If
            End If

          
        End If

       
    End Sub

#End Region


#Region "Functions"

    Private Sub bindPage()

        Dim sqlPar(0) As SqlParameter
        sqlPar(0) = New SqlParameter("@strPageUrl", Convert.ToString(Request("url")))
        Dim dt As DataTable = sqlHelper.getDataTable("[PageDetailByUrl]", sqlPar, CommandType.StoredProcedure)

        If dt.Rows.Count > 0 Then


            
            tdContent.InnerHtml = "<br />" + Convert.ToString(dt.Rows(0)("strContent"))


        Else
            bindPageNotFound()
        End If
        

    End Sub

    Private Sub bindPageNotFound()

    End Sub

#End Region




End Class
