Imports System.Data
Imports System.Data.SqlClient


Partial Class userControls_Tenders
    Inherits System.Web.UI.UserControl




#Region "Declarations"

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            If Not String.IsNullOrEmpty(Convert.ToString(Session("pageType"))) Then
                If Session("pageType") = "tender" Then

                    bindTender()

                End If
            End If
        End If


     

    End Sub

#End Region


#Region "Functions"

    Private Sub bindTender()


        Dim dt As DataTable = sqlHelper.getDataTable("[TenderListFront]", CommandType.StoredProcedure)

        rptTender.DataSource = dt
        rptTender.DataBind()

    End Sub



#End Region




End Class
