Imports System.Data
Imports System.Data.SqlClient
Partial Class Cart
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Page.Title = " Shopping Cart, Rajkot Supermarket"

            BindShipping()
            BindStateCityDrpData()
            bindData()


        End If


    End Sub


    Private Sub BindStateCityDrpData()
        Try
            Dim strqry As String = "select stateid,cityid from tblShoppingCart where strSessionId='" & app.getCurrentSession() & "'"
            Dim dtcat As DataTable = sqlHelper.getDataTable(strqry, CommandType.Text)

            dpdState.SelectedValue = Convert.ToString(dtcat.Rows(0)("stateid"))
            bindStateChange()
            dpdCity.SelectedValue = Convert.ToString(dtcat.Rows(0)("cityId"))
            bindCityChangesData()
        Catch ex As Exception

        End Try
    End Sub


    Private Sub bindData()

        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@strSession", Convert.ToString(app.getCurrentSession()))
        Dim dtcat As DataTable = sqlHelper.getDataTable("[ShoppingCartList]", sqlpar, CommandType.StoredProcedure)
        If dtcat.Rows.Count > 0 Then
            tblNodata.Visible = False
            tbldata.Visible = True
            grdCart.DataSource = dtcat
            grdCart.DataBind()

            TotalAmount.InnerHtml = "Rs." & Convert.ToString(dtcat.Rows(0)("Total"))
            Shipping.InnerHtml = "Rs." & Convert.ToString(dtcat.Rows(0)("ShippingCharge"))
            AmountPayble.InnerHtml = "Rs." & Convert.ToString(dtcat.Rows(0)("decNetPrice"))
            TotalQnty.InnerHtml = Convert.ToString(dtcat.Rows(0)("TotalQty"))


        Else
            tbldata.Visible = False
            tblNodata.Visible = True

        End If


    End Sub

    Protected Sub txtqty_textChanged(ByVal sender As Object, ByVal e As EventArgs)

        Dim txtTextBox As TextBox = DirectCast(sender, TextBox)
        ' code to find GridViewRow using naming container (bubble Event)
        Dim grdRow As RepeaterItem = DirectCast(txtTextBox.NamingContainer, RepeaterItem)

        ' code to find Label inside GridViewRow
        Dim lblTest As Label = TryCast(grdRow.FindControl("lblTest"), Label)
        If (Convert.ToString(txtTextBox.Text) = "") Then


            ' Page.ClientScript.RegisterStartupScript([GetType](), "msgbox", "alert('Please Enter Quantity');", True)

            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "run", "alert('Please Enter Quantity');", True)



            Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
        ElseIf (Convert.ToInt32(txtTextBox.Text) = 0) Then

            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "run", "alert('Please Enter valid Quantity');", True)
            'Page.ClientScript.RegisterStartupScript([GetType](), "msgbox", "alert('Please Enter Quantity');", True)


            Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
        ElseIf (Convert.ToInt32(txtTextBox.Text) > 25) Then

            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "run", "alert('You can add maximum 25 Qauntity');", True)
        Else
            Dim item As Int32 = Convert.ToInt32(txtTextBox.Text.Trim())
            Dim productId As Int32 = Convert.ToInt32(lblTest.Text.Trim())

            Dim Addcart(3) As SqlParameter
            Addcart(0) = New SqlParameter("@strSessionId", app.getCurrentSession())
            Addcart(1) = New SqlParameter("@bintProductId", productId)
            Addcart(2) = New SqlParameter("@intQty", item)
            Addcart(3) = New SqlParameter("@strIPAddr", app.GetIPAddress())



            sqlHelper.executeNonQuery("[dbo].[ShoppiingCartAllInfoUpdate]", Addcart, CommandType.StoredProcedure)
            bindCityChangesData()
            bindData()
        End If

    End Sub






    Protected Sub grdCart_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles grdCart.ItemCommand
        If e.CommandName = "RemoveItem" Then

            Dim shopcartdtl As String = e.CommandArgument

            Dim RemoveCart(1) As SqlParameter
            RemoveCart(0) = New SqlParameter("@bintShopCartDtlId", shopcartdtl)
            RemoveCart(1) = New SqlParameter("@strSessionId", app.getCurrentSession())
            sqlHelper.executeNonQuery("[deleteShoppingCartAndDtl]", RemoveCart, CommandType.StoredProcedure)
            bindCityChangesData()
            bindData()
        End If
    End Sub

    

    Private Sub BindShipping()
        Dim dtCat As DataTable = sqlHelper.getDataTable("[dbo].[pStateListdrpwn]", CommandType.StoredProcedure)
        dpdPState.DataSource = dtCat
        dpdPState.DataBind()

        dpdPState.Items.Insert(0, New ListItem("Select City", "0"))
        'Dim dtCat As DataTable = sqlHelper.getDataTable("[dbo].[StateListdrpwn]", CommandType.StoredProcedure)
        'dpdState.DataSource = dtCat
        'dpdState.DataBind()

        'dpdState.Items.Insert(0, New ListItem("Select City", "0"))
    End Sub

    Protected Sub dpdState_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dpdState.SelectedIndexChanged




        bindStateChange()

    End Sub

    Protected Sub dpdCity_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dpdCity.SelectedIndexChanged

        bindCityChangesData()


        bindData()
    End Sub

    Private Sub bindStateChange()
        If dpdState.SelectedValue <> "0" Then

            Dim sqlpar(0) As SqlParameter
            sqlpar(0) = New SqlParameter("@StateId", dpdState.SelectedValue)

            Dim dtc As DataTable = sqlHelper.getDataTable("[StatewiseCityList]", sqlpar, CommandType.StoredProcedure)

            dpdCity.DataSource = dtc
            dpdCity.DataBind()
            dpdCity.Items.Insert(0, New ListItem("Select Area", "0"))
        Else
            dpdCity.ClearSelection()

        End If
    End Sub

    Private Sub bindCityChangesData()
        
        If dpdCity.SelectedValue <> "0" And dpdState.SelectedValue <> "0" Then

            Dim sqlpar(2) As SqlParameter
            sqlpar(0) = New SqlParameter("@stateid", dpdState.SelectedValue)
            sqlpar(1) = New SqlParameter("@cityid", dpdCity.SelectedValue)
            sqlpar(2) = New SqlParameter("@strSessionId", app.getCurrentSession())
            sqlHelper.executeNonQuery("[DynamicShippingchargeAdd]", sqlpar, CommandType.StoredProcedure)


        End If
    End Sub



    Protected Sub btnSignUp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignUp.Click
        Response.Redirect("CheckOut.aspx")
    End Sub

    Protected Sub dpdPState_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpdPState.SelectedIndexChanged
        bindPStateChange()
    End Sub

    Private Sub bindPStateChange()
        If dpdPState.SelectedValue <> "0" Then

            Dim sqlpar(0) As SqlParameter
            sqlpar(0) = New SqlParameter("@PStateId", dpdPState.SelectedValue)

            Dim dtc As DataTable = sqlHelper.getDataTable("[pStatewiseStateList]", sqlpar, CommandType.StoredProcedure)

            dpdState.DataSource = dtc
            dpdState.DataBind()
            dpdState.Items.Insert(0, New ListItem("Select Area", "0"))
        Else
            dpdState.ClearSelection()

        End If

    End Sub

End Class
