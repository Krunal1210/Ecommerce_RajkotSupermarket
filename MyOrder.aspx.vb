Imports System.Data
Imports System.Data.SqlClient
Partial Class MyOrder
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Page.Title = " My Order History | Rajkot Supermarket"
            BindData()
        End If

    End Sub

    Private Sub BindData()
        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@UserId", loginclass.getClientID())
        Dim dt As DataTable = sqlHelper.getDataTable("[UserOrderList]", sqlpar, CommandType.StoredProcedure)
        rptrOrderlist.DataSource = dt
        rptrOrderlist.DataBind()
    End Sub

End Class
