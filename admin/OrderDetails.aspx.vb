
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Imports System.Data
Imports System.Data.SqlClient

Partial Public Class Admin_LotModify
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            bindLastData()
        End If
    End Sub

    Private Sub bindLastData()

        spnOrderNo.InnerHtml = Convert.ToString(Request.QueryString("id"))

        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@OrderNo", Convert.ToString(Request.QueryString("id")))
        Dim ds As DataSet = sqlHelper.getDataset("[OrderDetailsByOrderNo]", sqlpar, CommandType.StoredProcedure)
        spnOrderDate.InnerHtml = Convert.ToDateTime(ds.Tables(0).Rows(0)("dateCreated")).ToString("dd/MM/yyyy")
        grdCart.DataSource = ds.Tables(1)
        grdCart.DataBind()
        lblName.Text = Convert.ToString(ds.Tables(0).Rows(0)("Name"))
        lblAddress.Text = "Address : " + Convert.ToString(ds.Tables(0).Rows(0)("address"))

        If Convert.ToString(ds.Tables(0).Rows(0)("Landmark")) = "" Then
            idlandmark.Visible = False
        Else
            lblLandmark.Text = "Land Mark : " + Convert.ToString(ds.Tables(0).Rows(0)("Landmark"))
        End If

        lblCity.Text = "City : " + Convert.ToString(ds.Tables(0).Rows(0)("City"))
        lblState.Text = "State : " + Convert.ToString(ds.Tables(0).Rows(0)("State"))
        lblPincode.Text = "Pincode/Zipcode : " + Convert.ToString(ds.Tables(0).Rows(0)("Zipcode"))
        lblCountry.Text = "Country : " + Convert.ToString(ds.Tables(0).Rows(0)("Contry"))

        If Convert.ToString(ds.Tables(0).Rows(0)("phone")) = "" Then
            idcontact.Visible = False
        Else
            lblContact.Text = "Contact No. : +91-" + Convert.ToString(ds.Tables(0).Rows(0)("phone"))
        End If

        If Convert.ToString(ds.Tables(0).Rows(0)("LandLinde")) = "" Then
            idlandline.Visible = False
        Else
            lblLandline.Text = "LandLine No. : " + Convert.ToString(ds.Tables(0).Rows(0)("LandLinde"))
        End If
        spnPaymentOptino.InnerHtml = Convert.ToString(ds.Tables(0).Rows(0)("paymentOption"))


        Dim spar As SqlParameter() = New SqlParameter(0) {}
        spar(0) = New SqlParameter("@strSessionId", Convert.ToString(Request.QueryString("id")))

        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[TempShopCartQuickDtl]", spar, CommandType.StoredProcedure)
        TotalQnty.InnerHtml = Convert.ToString(dt.Rows(0)("intTotalItem"))
        TotalAmount.InnerHtml = "Rs. " & Convert.ToString(dt.Rows(0)("ita"))
        Shipping.InnerHtml = "Rs. " & Convert.ToString(dt.Rows(0)("iso"))

        AmountPayble.InnerHtml = "Rs. " & Convert.ToString(dt.Rows(0)("decNetPrice"))

        If ds.Tables(0).Rows(0)("bitIsProceed") Then
            btnProcess.Visible = False
        End If


    End Sub

    
    Protected Sub btnProcess_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcess.Click

        Dim strOrder As String = Convert.ToString(Request.QueryString("id"))
        Dim strQry As String = "update tblOrder set bitIsProceed=1 where strSessionId= '" & strOrder & "'"
        sqlHelper.executeNonQuery(strQry, CommandType.Text)
        Response.Redirect("OrderDetails.aspx?id=" & strOrder)
    End Sub
End Class


