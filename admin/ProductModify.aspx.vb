Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_ProductModify
    Inherits System.Web.UI.Page
    Shared Productid As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            bindCatgory()
            BindBrand()
            If Convert.ToInt32(Request("id")) > 0 Then
                binddata()

            End If


        End If


    End Sub

    Private Sub binddata()

        Dim sql(0) As SqlParameter
        sql(0) = New SqlParameter("@ProductMstId", Convert.ToInt32(Request("id")))
        Dim dt As DataTable = sqlHelper.getDataTable("[ProductMstAdminList]", sql, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
            Try


                txtName.Text = Convert.ToString(dt.Rows(0)("StrName"))
                txtDesc.Text = Convert.ToString(dt.Rows(0)("strDesc"))

                dpdCat.SelectedValue = Convert.ToInt32(dt.Rows(0)("bintCategoryId"))
                dpdBrand.SelectedValue = Convert.ToInt32(dt.Rows(0)("brandId"))

            Catch ex As Exception

            End Try

        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim sql(4) As SqlParameter
        sql(0) = New SqlParameter("@ProductMstId", Convert.ToInt32(Request("id")))
        sql(1) = New SqlParameter("@StrName", txtName.Text.Trim())
        sql(2) = New SqlParameter("@strDesc", txtDesc.Text.Trim())
        sql(3) = New SqlParameter("@brandId", dpdBrand.SelectedValue)
        sql(4) = New SqlParameter("@bintCategoryId", dpdCat.SelectedValue)



        Try
            sqlHelper.executeNonQuery("ProductMstModify", sql, CommandType.StoredProcedure)

            If Convert.ToInt32(Request("id")) > 0 Then
                app.msgSuccess(divMsg, "Product Master Updated Successfully")
            Else
                app.msgSuccess(divMsg, "Product Master Inserted Successfully")
                txtDesc.Text = ""
                txtName.Text = ""
                dpdBrand.ClearSelection()
                dpdCat.ClearSelection()
            End If

        Catch ex As Exception
            app.msgInformation(divMsg, "Please Provide valid Information.")
        End Try


    End Sub

    Private Sub bindCatgory()
        Dim dt As DataTable = sqlHelper.getDataTable("[CategoryList]", CommandType.StoredProcedure)
        dpdCat.DataSource = dt
        dpdCat.DataBind()
        dpdCat.Items.Insert(0, New ListItem("-Select Category-", "0"))
    End Sub

    Private Sub BindBrand()
        Dim dt As DataTable = sqlHelper.getDataTable("[BrandMasterListAdmin]", CommandType.StoredProcedure)
        dpdBrand.DataSource = dt
        dpdBrand.DataBind()
        dpdBrand.Items.Insert(0, New ListItem("-Select Brand-", "0"))
    End Sub




End Class
