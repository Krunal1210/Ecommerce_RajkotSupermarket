Imports System.Data
Imports System.Data.SqlClient
Partial Class Category
    Inherits System.Web.UI.Page


    Protected Sub ListView1_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim currentPage As Integer = (DataPager1.StartRowIndex / DataPager1.PageSize) + 1
        Dim totalPages As Integer = (DataPager1.TotalRowCount / DataPager1.PageSize) + 1
        'spnCurent.InnerHtml = Convert.ToString(currentPage)
        'spnLast.InnerHtml = Convert.ToString(totalPages)
        'spnFirst1.InnerHtml = Convert.ToString(currentPage)
        'spnLast1.InnerHtml = Convert.ToString(totalPages)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Not String.IsNullOrEmpty(Convert.ToString(Request("url1"))) Then
                bindData()
            End If
        End If
    End Sub

    Private Sub bindData()

        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@url", Convert.ToString(Request("url1")))
        Dim dt As DataTable = sqlHelper.getDataTable("[ProductListByCategoryUrlfront]", sqlpar, CommandType.StoredProcedure)

        If dt.Rows.Count > 0 Then
            ListView1.DataSource = dt
            ListView1.DataBind()

            h2Header.InnerHtml = dt.Rows(0)("DepNm")
            liMainCat.InnerHtml = dt.Rows(0)("DepNm")
        End If
    End Sub

End Class
