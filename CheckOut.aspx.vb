Imports System.Data.SqlClient
Imports System.Data
Imports System.Net.Mail

Partial Class CheckOut
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            BindShipping()
            BindStateCityDrpData()

            ViewState("Email") = ""
            Session("OrderNo") = ""
            'rdbtnPayment.Items(1).Attributes.Add("class", "hidden")

            bindLogin()
            bindPaymentQuickDetails()
            Try
                bindBasket()
            Catch ex As Exception

            End Try

        End If

    End Sub
    Private Sub bindStateChange()
        If dpdState.SelectedValue <> "0" Then

            Dim sqlpar(0) As SqlParameter
            sqlpar(0) = New SqlParameter("@StateId", dpdState.SelectedValue)

            Dim dtc As DataTable = sqlHelper.getDataTable("[StatewiseCityList]", sqlpar, CommandType.StoredProcedure)

            dpdCity.DataSource = dtc
            dpdCity.DataBind()
            dpdCity.Items.Insert(0, New ListItem("Select City", "0"))
        Else
            dpdCity.ClearSelection()

        End If
    End Sub
    Private Sub BindShipping()
        Dim dtCat As DataTable = sqlHelper.getDataTable("[dbo].[StateListdrpwn]", CommandType.StoredProcedure)
        dpdState.DataSource = dtCat
        dpdState.DataBind()

        dpdState.Items.Insert(0, New ListItem("Select State", "0"))

        Dim dtCat1 As DataTable = sqlHelper.getDataTable("[dbo].[pStateListdrpwn]", CommandType.StoredProcedure)
        dpdPstate.DataSource = dtCat1
        dpdPstate.DataBind()

        dpdPstate.Items.Insert(0, New ListItem("Select State", "0"))
    End Sub
    Private Sub BindStateCityDrpData()
        Try
            Dim strqry As String = "select stateid,cityid from tblShoppingCart where strSessionId='" & app.getCurrentSession() & "'"
            Dim dtcat As DataTable = sqlHelper.getDataTable(strqry, CommandType.Text)

            If dtcat.Rows(0)("stateid") > 0 Then
                dpdState.SelectedValue = Convert.ToString(dtcat.Rows(0)("stateid"))

                Try
                    Dim strCIty As String = "select pstateid from tblState where stateid='" & Convert.ToString(dtcat.Rows(0)("stateid")) & "'"
                    Dim dtcity As DataTable = sqlHelper.getDataTable(strCIty, CommandType.Text)
                    If dtcity.Rows(0)("pstateid") > 0 Then
                        dpdPstate.SelectedValue = Convert.ToString(dtcity.Rows(0)("pstateid"))
                    End If
                Catch ex As Exception

                End Try
                bindStateChange()
                dpdCity.SelectedValue = Convert.ToString(dtcat.Rows(0)("cityId"))
            Else
                Response.Redirect("Cart.aspx")
            End If
           

        Catch ex As Exception
            Response.Redirect("Cart.aspx")
        End Try
    End Sub
    Private Sub bindBasket()

        'Dim spar As SqlParameter() = New SqlParameter(0) {}
        'spar(0) = New SqlParameter("@strSessionId", app.getCurrentSession())

        'Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[TempShopCartQuickDtl]", spar, CommandType.StoredProcedure)

        'If dt.Rows.Count > 0 Then
        '    tdItemInCart.InnerHtml = " CART: " + Convert.ToString(dt.Rows(0)("intTotalItem")) + " Item(s)"
        '    tdPriceInCart.InnerHtml = "Rs. " + Convert.ToString(dt.Rows(0)("decNetPrice")) + ""
        '    If Convert.ToString(dt.Rows(0)("intTotalItem")) = "" Then
        '        tdItemInCart.InnerHtml = "CART: " + 0 + "Item(s)"
        '        tdPriceInCart.InnerHtml = "Rs. 0.0"
        '    End If
        'Else
        '    tdItemInCart.InnerHtml = "CART: " + 0 + "Item(s)"
        '    tdPriceInCart.InnerHtml = "Rs. 0.0"
        'End If



    End Sub
    Private Sub bindLogin()

        If loginclass.isClientLogin() Then


            ShippingMenuData()
            Dim sqlLogin(0) As SqlParameter
            sqlLogin(0) = New SqlParameter("@UserId", loginclass.getClientID())
            Dim dt As DataTable = sqlHelper.getDataTable("[NewUserList]", sqlLogin, CommandType.StoredProcedure)
            If dt.Rows.Count > 0 Then
                txtFirstname.Text = Convert.ToString(dt.Rows(0)("strFirstname"))
                txtLastName.Text = Convert.ToString(dt.Rows(0)("strlastname"))
                'txtTownCityShip.Text = Convert.ToString(dt.Rows(0)("strCity"))
                txtAddress.Text = Convert.ToString(dt.Rows(0)("strAddress"))
                txtPhone.Text = Convert.ToString(dt.Rows(0)("strPhone"))
                ' dpdState.SelectedItem.Text = Convert.ToString(dt.Rows(0)("strState"))
                txtPostcodeShip.Text = Convert.ToString(dt.Rows(0)("strFax"))
                ViewState("Email") = Convert.ToString(dt.Rows(0)("strEmailAddress"))
            End If
        Else
            LoginMenuData()
        End If

    End Sub
    Private Sub LoginMenuData()
        divlogin.Attributes.Add("class", "checkoutCon checkoutOpne cf")
        divPayment.Attributes.Add("class", "checkoutCon cf")
        divShipping.Attributes.Add("class", "checkoutCon cf")
        Dim strbuld As New StringBuilder(String.Empty)
        strbuld.Append("<ul class=""stepUl cf""><li   class=""active""><span>1</span>Email Login</li><li><span>2</span>Shipping Address</li><li><span>3</span>Payment Option</li><li><span>4</span>Order Confirmation</li></ul>")
        ltrlMenu.Text = strbuld.ToString()
    End Sub
    Private Sub ShippingMenuData()
        divlogin.Attributes.Add("class", "checkoutCon cf")
        divPayment.Attributes.Add("class", "checkoutCon cf")
        divShipping.Attributes.Add("class", "checkoutCon checkoutOpne cf")
        Dim strbuld As New StringBuilder(String.Empty)
        strbuld.Append("<ul class=""stepUl cf""><li><span>1</span>Email Login</li><li  class=""active""><span>2</span>Shipping Address</li><li><span>3</span>Payment Option</li><li><span>4</span>Order Confirmation</li></ul>")
        ltrlMenu.Text = strbuld.ToString()
    End Sub
    Private Sub PaymentMenuData()
        divlogin.Attributes.Add("class", "checkoutCon cf")
        divPayment.Attributes.Add("class", "checkoutCon checkoutOpne cf")
        divShipping.Attributes.Add("class", "checkoutCon cf")
        Dim strbuld As New StringBuilder(String.Empty)
        strbuld.Append("<ul class=""stepUl cf""><li><span>1</span>Email Login</li><li><span>2</span>Shipping Address</li><li   class=""active""><span>3</span>Payment Option</li><li><span>4</span>Order Confirmation</li></ul>")
        ltrlMenu.Text = strbuld.ToString()
    End Sub
    Private Sub OrderConfrmMenu()
        bindLastData()

        divlogin.Attributes.Add("class", "checkoutCon cf")
        divPayment.Attributes.Add("class", "checkoutCon cf")
        divShipping.Attributes.Add("class", "checkoutCon cf")
        dvOrderConformation.Attributes.Add("class", "checkoutCon checkoutOpne cf")
        Dim strbuld As New StringBuilder(String.Empty)
        strbuld.Append("<ul class=""stepUl cf""><li><span>1</span>Email Login</li><li><span>2</span>Shipping Address</li><li><span>3</span>Payment Option</li><li class=""active""><span>4</span>Order Confirmation</li></ul>")
        ltrlMenu.Text = strbuld.ToString()
    End Sub
    Protected Sub btnlogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlogin.Click


        Dim str As String = loginclass.getCustomerLogin(txtLogEmail.Text, txtPassword.Text, 1)

        If str = "Valid" Then

            ShippingMenuData()
            Response.Redirect(Request.Url.AbsoluteUri)

        Else

            Page.ClientScript.RegisterStartupScript(Me.[GetType](), "run", "alert('Invalid username or password');", True)

        End If



    End Sub


    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        ViewState("Email") = txtEmail.Text.Trim()
        ShippingMenuData()
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        PaymentMenuData()
    End Sub



    Protected Sub btnBackCart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBackCart.Click
        Response.Redirect("Cart.aspx")
    End Sub

    Protected Sub btnBack_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBack.Click
        ShippingMenuData()
    End Sub

    Protected Sub btnPlaceOrder_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPlaceOrder.Click

        Dim SqlPar(1) As SqlParameter
        SqlPar(0) = New SqlParameter("@strSessionId", app.getCurrentSession())
        SqlPar(1) = New SqlParameter("@intRetval", 0)
        SqlPar(1).Direction = ParameterDirection.Output

        sqlHelper.executeNonQuery("[CheckIfOrderAlreadyPlaced]", SqlPar, CommandType.StoredProcedure)
        If SqlPar(1).Value = "1" Then
            ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "run", "alert('Sorry. This Order Already Placed.');", True)
            app.setNewSession()
            Response.Redirect("Default.aspx")
        Else


            Select Case rdbtnPayment.SelectedValue
                Case "CCAVENUE"
                    PlaceOrder()
                    OrderConfrmMenu()
                    Session("OrderNo") = app.getCurrentSession()
                    app.setNewSession()
                    Response.Redirect("~/CCAvenueMid.aspx")
                    'ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "run", "alert('Payment Option Temporary Closed');", True)

                    Exit Select
                Case "CASH ON DELIVERY"
                    PlaceOrder()
                    OrderConfrmMenu()
                    OrderMail()
                    modifyOrderStatus(app.getCurrentSession())
                    bindLastData()
                    app.setNewSession()
                    Exit Select
                Case "CHEQUE/DD"
                    PlaceOrder()
                    OrderConfrmMenu()
                    OrderMail()
                    modifyOrderStatus(app.getCurrentSession())
                    app.setNewSession()
                    Exit Select

                Case Else
                    ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "run", "alert('Please Select Any Payment Option');", True)

                    Exit Select


            End Select
        End If

    End Sub
    Private Sub modifyOrderStatus(ByVal strOrderNo As String)
        Dim spar(0) As SqlParameter
        spar(0) = New SqlParameter("@strSessionId", strOrderNo)

        sqlHelper.executeNonQuery("[dbo].[ShoppingCartChangeUpdateStatus]", spar, CommandType.StoredProcedure)

    End Sub
    Private Sub bindPaymentQuickDetails()
        Dim strBld As New StringBuilder(String.Empty)

        Dim spar As SqlParameter() = New SqlParameter(0) {}
        spar(0) = New SqlParameter("@strSessionId", app.getCurrentSession())

        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[TempShopCartQuickDtl]", spar, CommandType.StoredProcedure)

        If dt.Rows.Count > 0 Then

            'spnTotalItem.InnerHtml = Convert.ToString(dt.Rows(0)("intTotalItem"))
            'spnSubTotal.InnerHtml = "Rs. " & Convert.ToString(dt.Rows(0)("decNetPrice"))
            'spnShipping.InnerHtml = "Rs. 0.00"
            'spnTotal.InnerHtml = "Rs. " & Convert.ToString(dt.Rows(0)("decNetPrice"))
            'spnAmountPay.InnerHtml = "Rs. " & Convert.ToString(dt.Rows(0)("decNetPrice"))
            '           
        End If
    End Sub



    Private Sub PlaceOrder()

        Dim sqlPlace(12) As SqlParameter
        sqlPlace(0) = New SqlParameter("@strSession", app.getCurrentSession())
        sqlPlace(1) = New SqlParameter("@Name", txtFirstname.Text.Trim() + " " + txtLastName.Text.Trim())
        sqlPlace(2) = New SqlParameter("@address", txtAddress.Text.Trim())
        sqlPlace(3) = New SqlParameter("@Landmark", dpdCity.SelectedItem.Text + "," + dpdState.SelectedItem.Text)
        sqlPlace(4) = New SqlParameter("@City", dpdPstate.SelectedItem.Text)
        sqlPlace(5) = New SqlParameter("@State", dpdMainState.SelectedItem.Text)
        sqlPlace(6) = New SqlParameter("@Zipcode", txtPostcodeShip.Text.Trim())
        sqlPlace(7) = New SqlParameter("@Contry", dpdContry.SelectedItem.Text)
        sqlPlace(8) = New SqlParameter("@phone", txtPhone.Text.Trim())
        sqlPlace(9) = New SqlParameter("@LandLinde", txtLandline.Text.Trim())
        sqlPlace(10) = New SqlParameter("@bitIsSuccess", 0)
        sqlPlace(12) = New SqlParameter("@PaymentOption", rdbtnPayment.SelectedValue)

        Dim sqlpar(1) As SqlParameter
        sqlpar(0) = New SqlParameter("@strEmailAddress", ViewState("Email"))
        sqlpar(1) = New SqlParameter("@bintUserId", 0)
        sqlpar(1).Direction = ParameterDirection.Output
        'sqlHelper.executeNonQuery("[dbo].[UserRegistrationCheck]", sqlpar, CommandType.StoredProcedure)
        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[UserRegistrationCheck]", sqlpar, CommandType.StoredProcedure)
        Dim userexist As Integer = sqlpar(1).Value

        'If userexist = "1" Then
        '    Dim str As String = loginclass.getCustomerLogin(txtEmail.Text.Trim(), Convert.ToString(dt.Rows(0)("strPassword")), 1)

        '    If str = "Valid" Then

        '    Else
        '        Page.ClientScript.RegisterStartupScript(Me.[GetType](), "run", "alert('Invalid username or password');", True)
        '    End If
        'End If

        Dim UserId As String = ""

        If userexist = "1" Then
            ' Dim str As String = loginclass.getCustomerLogin(txtEmail.Text.Trim(), Convert.ToString(dt.Rows(0)("strPassword")), 1)

            'sqlPlace(11) = New SqlParameter("@bintUserId", Convert.ToString(dt.Rows(0)("bintUserId")))
            UserId = Convert.ToString(dt.Rows(0)("bintUserId"))
        Else

            Dim Password As String = app.getRandomPassword()
            Dim reg(13) As SqlParameter
            reg(0) = New SqlParameter("@bintUserId", 0)
            reg(1) = New SqlParameter("@strFirstName", txtFirstname.Text.Trim())
            reg(2) = New SqlParameter("@strLastName", txtLastName.Text.Trim())
            reg(3) = New SqlParameter("@strCompanyName", " ")
            reg(4) = New SqlParameter("@strAddress", txtAddress.Text.Trim())
            reg(5) = New SqlParameter("@strCity", dpdCity.SelectedItem.Text)
            reg(6) = New SqlParameter("@strState", dpdState.SelectedItem.ToString())
            reg(7) = New SqlParameter("@strPhone", txtPhone.Text.Trim())
            reg(8) = New SqlParameter("@bintCountryId", 0)
            reg(9) = New SqlParameter("@strContry", dpdContry.SelectedItem.Text)
            reg(10) = New SqlParameter("@strFax", txtPostcodeShip.Text.Trim())
            reg(11) = New SqlParameter("@strEmailAddress", ViewState("Email"))
            reg(12) = New SqlParameter("@strPassword", Password)
            reg(13) = New SqlParameter("@bintid", 0)
            reg(13).Direction = ParameterDirection.Output

            sqlHelper.executeNonQuery("[UserRegistrationNew]", reg, CommandType.StoredProcedure)

            Try
                'send registration detail
                Dim strSubject As String = ""
                Dim strMsg As String = ""


                strMsg = app.getEmailTemplate("Registration", strSubject)
                strMsg = strMsg.Replace("[[Name]]", txtFirstname.Text.Trim())
                strMsg = strMsg.Replace("[[UserName]]", ViewState("Email"))
                strMsg = strMsg.Replace("[[Password]]", Password)
                Dim cc As String = "niravkasundra@gmail.com"
                app.sendMail(ViewState("Email"), "Rajkot Supermarket - Registration Confirmation", strMsg)
                app.sendMail(cc, "Rajkot Supermarket - Registration Confirmation", strMsg)
            Catch ex As Exception

            End Try

            UserId = Convert.ToString(reg(13).Value)



            'Dim str As String = loginclass.getCustomerLogin(txtEmail.Text.Trim(), Password, 1)

        End If



        sqlPlace(11) = New SqlParameter("@bintUserId", UserId)

        sqlHelper.executeNonQuery("[PlaceOrder]", sqlPlace, CommandType.StoredProcedure)


    End Sub


    Private Sub OrderMail()
        Try


            'send confirmation detail
            Dim strBldMailTmp As New StringBuilder(System.IO.File.ReadAllText(Server.MapPath("~/mailTemplate/ConfirmationMsg.htm")))
            strBldMailTmp.Replace("[[username]]", txtFirstname.Text.Trim() + " " + txtLastName.Text.Trim())
            strBldMailTmp.Replace("[[date]]", Convert.ToDateTime(DateTime.Now).ToString("dd/MM/yyyy"))
            strBldMailTmp.Replace("[[OrderNo]]", Convert.ToString(app.getCurrentSession()))
            strBldMailTmp.Replace("[[orderdata]]", senddata())

            Dim sqlpar(0) As SqlParameter
            sqlpar(0) = New SqlParameter("@OrderNo", Convert.ToString(app.getCurrentSession()))
            Dim dtcat As DataSet = sqlHelper.getDataset("[OrderDetailsByOrderNo]", sqlpar, CommandType.StoredProcedure)
            If dtcat.Tables(0).Rows.Count > 0 Then

                strBldMailTmp.Replace("[[total]]", "Rs." & Convert.ToString(dtcat.Tables(0).Rows(0)("decprice")))
                strBldMailTmp.Replace("[[shipping]]", "Rs." & Convert.ToString(dtcat.Tables(0).Rows(0)("decshipping")))
                strBldMailTmp.Replace("[[payable]]", "Rs." & Convert.ToString(dtcat.Tables(0).Rows(0)("decNetPrice")))
                strBldMailTmp.Replace("[[paymentoption]]", Convert.ToString(dtcat.Tables(0).Rows(0)("paymentoption")))
                strBldMailTmp.Replace("[[city]]", Convert.ToString(dtcat.Tables(0).Rows(0)("city")))
                strBldMailTmp.Replace("[[pincode]]", Convert.ToString(dtcat.Tables(0).Rows(0)("Zipcode")))
                strBldMailTmp.Replace("[[state]]", Convert.ToString(dtcat.Tables(0).Rows(0)("state")))
                strBldMailTmp.Replace("[[address]]", Convert.ToString(dtcat.Tables(0).Rows(0)("address")))
                strBldMailTmp.Replace("[[mobile]]", Convert.ToString(dtcat.Tables(0).Rows(0)("Phone")))
                strBldMailTmp.Replace("[[landmark]]", Convert.ToString(dtcat.Tables(0).Rows(0)("Landmark")))

            End If
            Dim cc1 As String = "niravkasundra@gmail.com"
            Dim strmail As String = Convert.ToString(dtcat.Tables(0).Rows(0)("email"))
            app.sendMail(strmail, "Your rajkotsupermarket.com Order : " & app.getCurrentSession() & "", strBldMailTmp.ToString())
            app.sendMail(cc1, "Your rajkotsupermarket.com Order :" & app.getCurrentSession() & "", strBldMailTmp.ToString())

        Catch ex As Exception

        End Try

    End Sub

    Public Shared Function senddata() As String
        Dim sessionid As String = app.getCurrentSession()
        Dim sp As SqlParameter() = New SqlParameter(0) {}
        sp(0) = New SqlParameter("@OrderNo", Convert.ToString(sessionid))
        Dim ds As DataSet = sqlHelper.getDataset("[dbo].[OrderDetailsByOrderNo]", sp, CommandType.StoredProcedure)

        Dim sBld As New StringBuilder(String.Empty)
        sBld.Append("<table cellspacing=""0"" cellpadding=""8"" border=""0"" style=""border: 1px solid #e6e6e6;border-collapse: collapse"">")
        sBld.Append("<tbody><tr style=""font-size: 12px; font-family: Segoe UI,arial; font-weight: bold""> ")
        sBld.Append(" <td width=""43"" valign=""top"" style=""border: 1px solid #e6e6e6""><center> Sr.No</center></td>")
        sBld.Append(" <td width=""300"" valign=""top"" style=""border: 1px solid #e6e6e6""> Item Name </td>")
        sBld.Append(" <td width=""60"" valign=""top"" style=""border: 1px solid #e6e6e6""> Picture </td>")
        sBld.Append("  <td width=""113"" valign=""top"" style=""border: 1px solid #e6e6e6""> Unit Price </td>")
        sBld.Append(" <td width=""70"" valign=""top"" style=""border: 1px solid #e6e6e6""> Qauntity</td>")
        sBld.Append("<td width=""120"" valign=""top"" style=""border: 1px solid #e6e6e6""> Total Price</td>")
        sBld.Append("</tr>")
        Dim count As Integer = 1
        For i As Integer = 0 To ds.Tables(1).Rows.Count - 1
            sBld.Append(" <tr style=""font-size: 12px; font-family: Segoe UI,arial; font-weight: normal"">")
            sBld.Append("<td width=""43"" valign=""top"" style=""border: 1px solid #e6e6e6""><center>" + Convert.ToString(count) + "</td>")
            sBld.Append("<td width=""300"" valign=""top"" style=""border: 1px solid #e6e6e6"">" + Convert.ToString(ds.Tables(1).Rows(i)("strproductname")) + "</td>")
            sBld.Append(" <td width=""60"" valign=""top"" style=""border: 1px solid #e6e6e6; padding: 0px"">")
            sBld.Append("<img style=""width:50px; max-height:60px;"" src='http://rajkotsupermarket.com/userFiles/ProductImage/" + Convert.ToString(ds.Tables(1).Rows(i)("MainImage")) + "'")
            sBld.Append("</td>")
            sBld.Append("<td width=""113"" valign=""top"" style=""border: 1px solid #e6e6e6; font-family: Segoe UI,arial"">" + " Rs. " + Convert.ToString(ds.Tables(1).Rows(i)("decPrice")) + "</td>")
            sBld.Append(" <td width=""70"" valign=""top"" style=""border: 1px solid #e6e6e6"">" + Convert.ToString(ds.Tables(1).Rows(i)("intQty")) + "</td>")
            sBld.Append(" <td width=""120"" valign=""top"" style=""border: 1px solid #e6e6e6"">" + " Rs. " + Convert.ToString(ds.Tables(1).Rows(i)("decTotalPrice")) + "</td>")
            sBld.Append("</tr>")
            count = count + 1
        Next

        sBld.Append(" </tbody></table>")
        Return sBld.ToString()
    End Function



    Private Sub bindLastData()

        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@OrderNo", app.getCurrentSession())
        Dim ds As DataSet = sqlHelper.getDataset("[OrderDetailsByOrderNo]", sqlpar, CommandType.StoredProcedure)
        spnOrderNo.InnerHtml = app.getCurrentSession()
        spnOrderDate.InnerHtml = Convert.ToDateTime(Date.Now).ToString("dd/MM/yyyy")
        h2payment.InnerHtml = ds.Tables(0).Rows(0)("PaymentOption")
        grdCart.DataSource = ds.Tables(1)
        grdCart.DataBind()
        Dim spar As SqlParameter() = New SqlParameter(0) {}
        spar(0) = New SqlParameter("@strSession", app.getCurrentSession())

        'Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[ShoppingCartList]", spar, CommandType.StoredProcedure)

        'TotalAmount.InnerHtml = "Rs." & Convert.ToString(dt.Rows(0)("Total"))
        'Shipping.InnerHtml = "Rs." & Convert.ToString(dt.Rows(0)("ShippingCharge"))
        'AmountPayble.InnerHtml = "Rs." & Convert.ToString(dt.Rows(0)("decNetPrice"))
        'TotalQnty.InnerHtml = Convert.ToString(dt.Rows(0)("TotalQty"))
        

        'Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[ShoppingCartList1]", spar, CommandType.StoredProcedure)
        TotalAmount.InnerHtml = "Rs." & Convert.ToString(ds.Tables(0).Rows(0)("decprice"))
        Shipping.InnerHtml = "Rs." & Convert.ToString(ds.Tables(0).Rows(0)("decshipping"))
        AmountPayble.InnerHtml = "Rs." & Convert.ToString(ds.Tables(0).Rows(0)("decnetprice"))
        TotalQnty.InnerHtml = Convert.ToString(ds.Tables(0).Rows(0)("TotalQty"))

    End Sub

    Protected Sub rdbtnPayment_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbtnPayment.SelectedIndexChanged
        Select Case rdbtnPayment.SelectedValue
            Case "CCAVENUE"
                divCCavenue.Visible = True
                dvCashondiv.Visible = False
                spCheck.Visible = False
                Exit Select



            Case "CASH ON DELIVERY"
                divCCavenue.Visible = False
                dvCashondiv.Visible = True
                spCheck.Visible = False
                Exit Select

            Case "CHEQUE/DD"
                divCCavenue.Visible = False
                dvCashondiv.Visible = False
                spCheck.Visible = True
                Exit Select
            Case Else


                Exit Select

        End Select
    End Sub
End Class
