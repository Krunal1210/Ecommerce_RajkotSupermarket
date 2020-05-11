Imports System.Data
Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            ' bindData()

            ltrlMeta.Text = " <meta name=""keywords"" content="" online Rajkot Supermarket, online grocery shopping Rajkot,buy food online, online grocery, grocery online, online grocery shopping, online grocery store,, online grocery shopping india, buy groceries online, online vegetable store, food shopping online""/><meta name=""description"" content=""Buy  Online in Rajkot, Gujarat, India. All types of grocery are available here at the best prices. Buy online at our online Rajkot Supermarket."" />"

            bindBanner()
            Try
                '    bindBasket()
            Catch ex As Exception

            End Try
            Try
                If String.IsNullOrEmpty(app.getCurrentSession()) Then
                    app.setNewSession()
                End If
            Catch ex As Exception

            End Try
        End If
    End Sub

    Public Shared Function GetCurrentDate() As DateTime
        Dim timeUtc As DateTime = System.DateTime.UtcNow
        Dim cstZone As TimeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")
        Dim cstTime As DateTime = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, cstZone)
        Return cstTime
    End Function


    Sub Addtocart(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim btnAdd As Button = DirectCast(sender, Button)
        Dim strid As String = btnAdd.CommandArgument



        Dim Addcart(3) As SqlParameter
        Addcart(0) = New SqlParameter("@strSessionId", app.getCurrentSession())
        Addcart(1) = New SqlParameter("@bintProductId", strid)
        Addcart(2) = New SqlParameter("@intQty", 1)
        Addcart(3) = New SqlParameter("@strIPAddr", app.GetIPAddress())



        sqlHelper.executeNonQuery("[dbo].[ShoppiingCartAllInfoAdd]", Addcart, CommandType.StoredProcedure)
        Response.Redirect("~/Cart.aspx")
    End Sub
    'Private Sub bindBasket()

    '    Dim spar As SqlParameter() = New SqlParameter(0) {}
    '    spar(0) = New SqlParameter("@strSessionId", app.getCurrentSession())

    '    Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[TempShopCartQuickDtl]", spar, CommandType.StoredProcedure)

    '    If dt.Rows.Count > 0 Then
    '        tdItemInCart.InnerHtml = " CART: " + Convert.ToString(dt.Rows(0)("intTotalItem")) + " Item(s)"
    '        tdPriceInCart.InnerHtml = "Rs. " + Convert.ToString(dt.Rows(0)("decprice")) + ""
    '        If Convert.ToString(dt.Rows(0)("intTotalItem")) = "" Then
    '            tdItemInCart.InnerHtml = "CART: " + 0 + "Item(s)"
    '            tdPriceInCart.InnerHtml = "Rs. 0.0"
    '        End If
    '    Else
    '        tdItemInCart.InnerHtml = "CART: " + 0 + "Item(s)"
    '        tdPriceInCart.InnerHtml = "Rs. 0.0"
    '    End If



    'End Sub
    Private Sub bindBanner()

        ' banner
        ' Dim dtf As DataTable = sqlHelper.getDataTable("[BannerListFront]", CommandType.StoredProcedure)

        'rptrHomBaner.DataSource = dtf
        'rptrHomBaner.DataBind()

        Dim dtnn As DataTable = sqlHelper.getDataTable("[AdverstigeListFront]", CommandType.StoredProcedure)

        rptrbox.DataSource = dtnn
        rptrbox.DataBind()


       

        ' Home Product
        'Dim dthom As DataTable = sqlHelper.getDataTable("[ProductListHome]", CommandType.StoredProcedure)

        'rptrProductHome.DataSource = dthom
        'rptrProductHome.DataBind()

    End Sub
    'Protected Sub ListView1_DataBound(ByVal sender As Object, ByVal e As EventArgs)
    '    Dim currentPage As Integer = (DataPager2.StartRowIndex / DataPager2.PageSize) + 1
    '    Dim totalPages As Integer = (DataPager2.TotalRowCount / DataPager2.PageSize) + 1
    '    spnCurent.InnerHtml = Convert.ToString(currentPage)
    '    spnLast.InnerHtml = Convert.ToString(totalPages)

    'End Sub
     

    'Private Sub bindData()
    '    Dim dtf As DataTable = sqlHelper.getDataTable("HomeBannerList", CommandType.StoredProcedure)

    '    rptrHomeBanner.DataSource = dtf
    '    rptrHomeBanner.DataBind()
    'End Sub

End Class
