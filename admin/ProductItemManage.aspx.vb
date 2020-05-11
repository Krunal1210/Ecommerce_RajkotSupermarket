Imports System.Data
Imports System.Data.SqlClient

Partial Class admin_ProductItemManage
    Inherits System.Web.UI.Page
    Protected Sub btnAction_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim drpAct As DropDownList = CType(ListView1.FindControl("drpActions"), DropDownList)
        Dim hdnVal As HiddenField = CType(ListView1.FindControl("hdnChk"), HiddenField)
        app.GeneralOpration("tblProduct", "bintProductId", hdnVal.Value.Trim(","), drpAct.SelectedValue)
        hdnVal.Value = ""
        ListView1.DataBind()
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim filename As String = hdnedit.Value

        If imgupload.HasFile Then

            filename = DateTime.Now.Ticks.ToString() + System.IO.Path.GetExtension(imgupload.PostedFile.FileName)

            imgupload.PostedFile.SaveAs(Server.MapPath("~/userFiles/ProductImage/" + filename))



        End If

        Dim ProductId As Int32 = dpdSec.SelectedValue

        Dim ItemId As Int32 = 0

        If Convert.ToInt32(Request("id")) > 0 Then
            ItemId = Convert.ToInt32(Request("id"))
        End If



        Dim sqlpar(18) As SqlParameter

        sqlpar(0) = New SqlParameter("@bintProductId", ItemId)
        sqlpar(1) = New SqlParameter("@strProName", txtName.Text.Trim())
        sqlpar(2) = New SqlParameter("@bintcategoryId", dpdSec.SelectedValue)
        sqlpar(3) = New SqlParameter("@strDesc", txtDesc.Text.Trim())
        sqlpar(4) = New SqlParameter("@intOrder", txtOrder.Text.Trim)
        sqlpar(5) = New SqlParameter("@price", txtPrice.Text.Trim)
        sqlpar(6) = New SqlParameter("@strSpecification", txtSpec.Text.Trim)
        sqlpar(7) = New SqlParameter("@weight", txtweight.Text.Trim)
        sqlpar(8) = New SqlParameter("@bitIsOnHome", chkDisHom.Checked)
        sqlpar(9) = New SqlParameter("@bitIsInStock", chkOut.Checked)
        sqlpar(10) = New SqlParameter("@bitIsSpecial", chkSpecial.Checked)
        sqlpar(11) = New SqlParameter("@deptId", dpdDept.SelectedValue)
        sqlpar(12) = New SqlParameter("@strImage", filename)
        sqlpar(13) = New SqlParameter("@brandid", dpdBrand.SelectedValue)
        sqlpar(14) = New SqlParameter("@barcode", txtbarcode.Text.Trim)
        sqlpar(15) = New SqlParameter("@s_barcode", txtsbar.Text.Trim)
        sqlpar(16) = New SqlParameter("@lprice", txtlPrice.Text.Trim)
        sqlpar(17) = New SqlParameter("@stock", txtStock.Text.Trim)
        sqlpar(18) = New SqlParameter("@DivisionId", dpddivisin.SelectedValue)
        sqlHelper.executeNonQuery("[ProductItemModify]", sqlpar, CommandType.StoredProcedure)

        If ItemId = 0 Then

            app.msgSuccess(divMsg, "Product Item Inserted successfully.")
            Clear()
        Else
            app.msgSuccess(divMsg, "Product Item updated successfully.")


        End If

        ListView1.DataBind()

    End Sub

    Private Sub Clear()
        txtDesc.Text = ""

        txtName.Text = ""
        txtOrder.Text = ""
        txtPrice.Text = ""
        txtSpec.Text = ""
        txtweight.Text = ""
        chkDisHom.Checked = False
        chkOut.Checked = False
        chkSpecial.Checked = False

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsPostBack Then
            BindMaster()
            If Not String.IsNullOrEmpty(Convert.ToString(Request("id"))) Then
                dvlist.Visible = False
                dvAded.Visible = True
                bindData()
            Else

                dvlist.Visible = True
                dvAded.Visible = False
            End If

        End If
    End Sub

    Private Sub bindData()

        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@bintProductId", Convert.ToString(Request("id")))

        Dim dt As DataTable = sqlHelper.getDataTable("[productItemListadmin1]", sqlpar, CommandType.StoredProcedure)

        If dt.Rows.Count > 0 Then

            txtDesc.Text = Convert.ToString(dt.Rows(0)("strDesc"))
            txtName.Text = Convert.ToString(dt.Rows(0)("strProName"))
            txtOrder.Text = Convert.ToString(dt.Rows(0)("intOrder"))

            txtSpec.Text = Convert.ToString(dt.Rows(0)("strSpecification"))
            txtweight.Text = Convert.ToString(dt.Rows(0)("weight"))
            Try
                txtPrice.Text = Convert.ToString(dt.Rows(0)("price"))
                txtlPrice.Text = Convert.ToString(dt.Rows(0)("lprice"))
            Catch ex As Exception

            End Try


            chkDisHom.Checked = Convert.ToBoolean(dt.Rows(0)("bitIsOnHome"))
            chkOut.Checked = Convert.ToBoolean(dt.Rows(0)("bitIsInStock"))
            chkSpecial.Checked = Convert.ToBoolean(dt.Rows(0)("bitIsSpecial"))

            hdnedit.Value = Convert.ToString(dt.Rows(0)("strImage"))

            imgedit.Src = "../userFiles/ProductImage/" & Convert.ToString(dt.Rows(0)("strImage"))

            Try
                dpdBrand.SelectedValue = Convert.ToString(dt.Rows(0)("brandid"))
                dpddivisin.SelectedValue = Convert.ToString(dt.Rows(0)("DivisionId"))
                bindSection()
                dpdSec.SelectedValue = Convert.ToString(dt.Rows(0)("bintcategoryId"))
                bindDept()


                dpdDept.SelectedValue = Convert.ToString(dt.Rows(0)("deptId"))
            Catch ex As Exception

            End Try
            Try
                txtbarcode.Text = Convert.ToString(dt.Rows(0)("barcode"))
                txtsbar.Text = Convert.ToString(dt.Rows(0)("s_barcode"))
                txtStock.Text = Convert.ToString(dt.Rows(0)("stock"))

            Catch ex As Exception

            End Try
        End If


    End Sub

    Private Sub BindMaster()
        Dim dt As DataTable = sqlHelper.getDataTable("[DivisionCategoryList]", CommandType.StoredProcedure)
        dpddivisin.DataSource = dt
        dpddivisin.DataBind()
        dpddivisin.Items.Insert(0, New ListItem("-Select Division-", "0"))

        Dim dt1 As DataTable = sqlHelper.getDataTable("[BrandDrpdwnlist]", CommandType.StoredProcedure)
        dpdBrand.DataSource = dt1
        dpdBrand.DataBind()
        dpdBrand.Items.Insert(0, New ListItem("-Select Brand-", "0"))

        Dim dt11 As DataTable = sqlHelper.getDataTable("[DivisionCategoryList]", CommandType.StoredProcedure)
        dpddivision1.DataSource = dt11
        dpddivision1.DataBind()
        dpddivision1.Items.Insert(0, New ListItem("-Select Division-", "0"))

        Dim dt111 As DataTable = sqlHelper.getDataTable("[BrandDrpdwnlist]", CommandType.StoredProcedure)
        dpdbrand1.DataSource = dt111
        dpdbrand1.DataBind()
        dpdbrand1.Items.Insert(0, New ListItem("-Select Brand-", "0"))

        dpdDept1.Items.Insert(0, New ListItem("-Select Department-", "0"))
        dpdSec1.Items.Insert(0, New ListItem("-Select Section-", "0"))
    End Sub


    Protected Sub dpddivisin_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpddivisin.SelectedIndexChanged
        bindSection()
    End Sub

    Private Sub bindSection()

        If dpddivisin.SelectedValue <> "0" Then
            Dim sqlpar(0) As SqlParameter
            sqlpar(0) = New SqlParameter("@Catid", dpddivisin.SelectedValue)
            Dim dt As DataTable = sqlHelper.getDataTable("[SubCategoryList]", sqlpar, CommandType.StoredProcedure)
            dpdSec.DataSource = dt
            dpdSec.DataBind()
            dpdSec.Items.Insert(0, New ListItem("-Select Section-", "0"))
        Else
            dpdSec.DataSource = ""
            dpdSec.DataBind()
            dpdSec.Items.Insert(0, New ListItem("-Select Section-", "0"))

            dpdDept.DataSource = ""
            dpdDept.DataBind()
            dpdDept.Items.Insert(0, New ListItem("-Select Department-", "0"))
        End If

    End Sub

    Protected Sub dpdSec_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpdSec.SelectedIndexChanged
        bindDept()
    End Sub

    Private Sub bindDept()
        If dpdSec.SelectedValue <> "0" Then

            Dim sqlpar(0) As SqlParameter
            sqlpar(0) = New SqlParameter("@Catid", dpdSec.SelectedValue)
            Dim dt As DataTable = sqlHelper.getDataTable("[SubCategoryList]", sqlpar, CommandType.StoredProcedure)
            dpdDept.DataSource = dt
            dpdDept.DataBind()
            dpdDept.Items.Insert(0, New ListItem("-Select Section-", "0"))
        Else


            dpdDept.DataSource = ""
            dpdDept.DataBind()
            dpdDept.Items.Insert(0, New ListItem("-Select Department-", "0"))
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

        Dim strQry As String = "1=1 "

        If dpdbrand1.SelectedValue <> "0" Then
            strQry += " And brandid='" & dpdbrand1.SelectedValue & "'"
        End If
        If dpddivision1.SelectedValue <> "0" Then
            strQry += " And DivisionId='" & dpddivision1.SelectedValue & "'"
        End If

        If dpdDept1.SelectedValue <> "0" Then
            strQry += " And deptId='" & dpdDept1.SelectedValue & "'"
        End If

        If dpdSec1.SelectedValue <> "0" Then
            strQry += " And bintCategoryId='" & dpdSec1.SelectedValue & "'"
        End If

        If txtprod.Text <> "" Then
            strQry += " And strProName like '%" & txtprod.Text.Trim() & "%'"
        End If
        If txtbcode.Text <> "" Then
            strQry += " And barcode like '%" & txtbcode.Text.Trim() & "%'"
        End If

        SqlDataSource1.FilterExpression = strQry
        ListView1.DataBind()
    End Sub

    Protected Sub btnreset_Click(sender As Object, e As EventArgs) Handles btnreset.Click
        SqlDataSource1.FilterExpression = ""
        ListView1.DataBind()
        txtprod.Text = ""
        
        dpdDept1.ClearSelection()
        dpdSec1.ClearSelection()
        dpddivision1.ClearSelection()

        dpdbrand1.ClearSelection()
    End Sub

    Protected Sub dpddivision1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpddivision1.SelectedIndexChanged
        bindSection1()
    End Sub

    Private Sub bindSection1()
        If dpddivision1.SelectedValue <> "0" Then
            Dim sqlpar(0) As SqlParameter
            sqlpar(0) = New SqlParameter("@Catid", dpddivision1.SelectedValue)
            Dim dt As DataTable = sqlHelper.getDataTable("[SubCategoryList]", sqlpar, CommandType.StoredProcedure)
            dpdSec1.DataSource = dt
            dpdSec1.DataBind()
            dpdSec1.Items.Insert(0, New ListItem("-Select Section-", "0"))
        Else
            dpdSec1.DataSource = ""
            dpdSec1.DataBind()
            dpdSec1.Items.Insert(0, New ListItem("-Select Section-", "0"))

            dpdDept1.DataSource = ""
            dpdDept1.DataBind()
            dpdDept1.Items.Insert(0, New ListItem("-Select Department-", "0"))
        End If
    End Sub
    Protected Sub dpdSec1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpdSec1.SelectedIndexChanged
        bindDept1()
    End Sub

    Private Sub bindDept1()
        If dpdSec1.SelectedValue <> "0" Then

            Dim sqlpar(0) As SqlParameter
            sqlpar(0) = New SqlParameter("@Catid", dpdSec1.SelectedValue)
            Dim dt As DataTable = sqlHelper.getDataTable("[SubCategoryList]", sqlpar, CommandType.StoredProcedure)
            dpdDept1.DataSource = dt
            dpdDept1.DataBind()
            dpdDept1.Items.Insert(0, New ListItem("-Select Section-", "0"))
        Else


            dpdDept1.DataSource = ""
            dpdDept1.DataBind()
            dpdDept1.Items.Insert(0, New ListItem("-Select Department-", "0"))
        End If
    End Sub
End Class
