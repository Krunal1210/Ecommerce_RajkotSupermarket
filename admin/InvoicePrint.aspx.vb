Imports System.Data
Imports System.Data.SqlClient
Partial Class Soft_InvoicePrint
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            BindData()



            



        End If


    End Sub

    Private Sub BindData()
        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@OrderNo", Convert.ToString(Request.QueryString("id")))
        Dim ds1 As DataSet = sqlHelper.getDataset("[OrderDetailsByOrderNo]", sqlpar, CommandType.StoredProcedure)
        rptrMember.DataSource = ds1.Tables(1)
        rptrMember.DataBind()
        Dim sqlpar1(0) As SqlParameter
        sqlpar1(0) = New SqlParameter("@OrderNo", Convert.ToString(Request.QueryString("id")))
        Dim ds As DataTable = sqlHelper.getDataTable("[OrderDetailsByOrderNo]", sqlpar1, CommandType.StoredProcedure)
        If ds.Rows.Count > 0 Then


            lblorderno.Text = Convert.ToString(Request.QueryString("id"))
            lblorderdate.Text = ds.Rows(0)("dateCreated")
            lblname.Text = Convert.ToString(ds.Rows(0)("Name"))
            lbladdrss.Text = Convert.ToString(ds.Rows(0)("address"))
            lblcity.Text = Convert.ToString(ds.Rows(0)("City"))
            lblpincode.Text = Convert.ToString(ds.Rows(0)("Landmark"))
            lblmobile.Text = Convert.ToString(ds.Rows(0)("phone"))

            lblnote.Text = Convert.ToString(ds.Rows(0)("paymentOption"))

        End If
      
        Dim spar As SqlParameter() = New SqlParameter(0) {}
        spar(0) = New SqlParameter("@strSessionId", Convert.ToString(Request.QueryString("id")))

        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[TempShopCartQuickDtl]", spar, CommandType.StoredProcedure)
        lbltotalitem.Text = Convert.ToString(dt.Rows(0)("intTotalItem"))
        lblTotalamount.Text = "Rs. " & Convert.ToString(dt.Rows(0)("ita"))
        lblshipping.Text = "Rs. " & Convert.ToString(dt.Rows(0)("iso"))
        lblAmountpaid.Text = "Rs. " & Convert.ToString(dt.Rows(0)("decNetPrice"))

    End Sub

   
End Class
