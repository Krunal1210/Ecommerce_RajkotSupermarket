Imports System.Data
Imports System.Data.SqlClient

Partial Class OrderDetails
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
        lblAddress.Text = "  " + Convert.ToString(ds.Tables(0).Rows(0)("address"))

        If Convert.ToString(ds.Tables(0).Rows(0)("Landmark")) = "" Then
            idlandmark.Visible = False
        Else
            lblLandmark.Text = "  " + Convert.ToString(ds.Tables(0).Rows(0)("Landmark"))
        End If

        lblCity.Text = " " + Convert.ToString(ds.Tables(0).Rows(0)("City"))
        lblState.Text = " " + Convert.ToString(ds.Tables(0).Rows(0)("State"))
        lblPincode.Text = "   " + Convert.ToString(ds.Tables(0).Rows(0)("Zipcode"))
        lblCountry.Text = "  " + Convert.ToString(ds.Tables(0).Rows(0)("Contry"))

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



        'Dim spar As SqlParameter() = New SqlParameter(0) {}
        'spar(0) = New SqlParameter("@strSession", Convert.ToString(Request.QueryString("id")))

        'Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[ShoppingCartList]", spar, CommandType.StoredProcedure)
        'TotalAmount.InnerHtml = "Rs." & Convert.ToString(dt.Rows(0)("decprice"))
        'Shipping.InnerHtml = "Rs." & Convert.ToString(dt.Rows(0)("decshipping"))
        'AmountPayble.InnerHtml = "Rs." & Convert.ToString(dt.Rows(0)("decnetprice"))
        'TotalQnty.InnerHtml = Convert.ToString(dt.Rows(0)("TotalQty"))

        TotalAmount.InnerHtml = "Rs." & Convert.ToString(ds.Tables(0).Rows(0)("decprice"))
        Shipping.InnerHtml = "Rs." & Convert.ToString(ds.Tables(0).Rows(0)("decshipping"))
        AmountPayble.InnerHtml = "Rs." & Convert.ToString(ds.Tables(0).Rows(0)("decnetprice"))
        TotalQnty.InnerHtml = Convert.ToString(ds.Tables(0).Rows(0)("TotalQty"))
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("Myorder.aspx", True)
    End Sub
End Class
