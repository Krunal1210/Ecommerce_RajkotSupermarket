Imports System.Data
Imports System.Data.SqlClient
Partial Class Product
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then


            If Not String.IsNullOrEmpty(Convert.ToString(Request("url"))) Then
                bindProduct()

            Else
                Response.Redirect("Home.aspx")

            End If
        End If


    End Sub


    Private Sub bindProduct()
        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@Url", Convert.ToString(Request("id")))
        Dim dt As DataTable = sqlHelper.getDataTable("[ProductDetailById]", sqlpar, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
            rptrProductDetail.DataSource = dt
            rptrProductDetail.DataBind()
            ' h2ProductName.InnerHtml = Convert.ToString(dt.Rows(0)("strproname"))
            Page.Title = Convert.ToString(dt.Rows(0)("strproname")) & "- Rs." & Convert.ToString(dt.Rows(0)("Price")) & " , Rajkot Supermarket"
            ltrlMetaData.Text = "<meta name=""keywords"" content=""Rajkot Supermarket offers " & Convert.ToString(dt.Rows(0)("brandname")) & " Products, " & Convert.ToString(dt.Rows(0)("brandname")) & " online, buy " & Convert.ToString(dt.Rows(0)("brandname")) & ", " & Convert.ToString(dt.Rows(0)("brandname")) & " products buy online, " & Convert.ToString(dt.Rows(0)("strproname")) & " at Rs-" & Convert.ToString(dt.Rows(0)("Price")) & ", " & Convert.ToString(dt.Rows(0)("strproname")) & " online Rajkot, " & Convert.ToString(dt.Rows(0)("strproname")) & " Rajkot, gujarat, india""/><meta name=""description"" content=""Buy " & Convert.ToString(dt.Rows(0)("strproname")) & " at Rs-" & Convert.ToString(dt.Rows(0)("Price")) & " from rajkotsupermarket.com. Search a wide range of  " & Convert.ToString(dt.Rows(0)("brandname")) & " products online in India. Best " & Convert.ToString(dt.Rows(0)("brandname")) & "  price online. Buy today to avail home delivery."" />"
            h2Related.InnerHtml = Convert.ToString(dt.Rows(0)("brandname")) & " Other Product"
        End If


        Dim sqlpar1(0) As SqlParameter
        sqlpar1(0) = New SqlParameter("@Url", Convert.ToString(Request("id")))
        Dim dt1 As DataTable = sqlHelper.getDataTable("[OtherProductListByproducturl]", sqlpar1, CommandType.StoredProcedure)
        If dt1.Rows.Count > 0 Then
            dtlstRelatedProduct.DataSource = dt1
            dtlstRelatedProduct.DataBind()
        End If
    End Sub





    Sub Addtocart(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim btnAdd As Button = DirectCast(sender, Button)
        Dim strid As String = btnAdd.CommandArgument

        Dim item = DirectCast(btnAdd.NamingContainer, RepeaterItem)
        Dim txt = DirectCast(item.FindControl("txtQtl"), TextBox)

        Dim Addcart(3) As SqlParameter
        Addcart(0) = New SqlParameter("@strSessionId", app.getCurrentSession())
        Addcart(1) = New SqlParameter("@bintProductId", strid)
        Addcart(2) = New SqlParameter("@intQty", txt.Text)
        Addcart(3) = New SqlParameter("@strIPAddr", app.GetIPAddress())



        sqlHelper.executeNonQuery("[dbo].[ShoppiingCartAllInfoAdd]", Addcart, CommandType.StoredProcedure)
        Response.Redirect("~/Cart.aspx")

    End Sub


End Class
