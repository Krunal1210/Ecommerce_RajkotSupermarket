Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail
Partial Class MyAccount
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Page.Title = " My Account Information| Oil Bazzar"
            If loginclass.isClientLogin() Then
                bindData()
            Else
                Response.Redirect("~/Registration.aspx")
            End If




        End If


    End Sub
   

    Protected Sub btnSignUp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignUp.Click
        Dim reg(12) As SqlParameter
        reg(0) = New SqlParameter("@bintUserId", loginclass.getClientID())
        reg(1) = New SqlParameter("@strFirstName", txtFirst.Text.Trim())
        reg(2) = New SqlParameter("@strLastName", txtLast.Text.Trim())
        reg(3) = New SqlParameter("@strCompanyName", txtCompany.Text.Trim())
        reg(4) = New SqlParameter("@strAddress", txtAdd.Text.Trim())
        reg(5) = New SqlParameter("@strCity", txtCity.Text.Trim())
        reg(6) = New SqlParameter("@strState", dpdstate.SelectedItem.ToString())
        reg(7) = New SqlParameter("@strPhone", txtPhone.Text.Trim())
        reg(8) = New SqlParameter("@bintCountryId", 0)
        reg(9) = New SqlParameter("@strContry", txtContry.Text.Trim())
        reg(10) = New SqlParameter("@strFax", txtZip.Text.Trim())
        reg(11) = New SqlParameter("@strEmailAddress", txtEmail.Text.Trim())
        reg(12) = New SqlParameter("@strPassword", txtPassword.Text.Trim())

        sqlHelper.executeNonQuery("[UserRegistration]", reg, CommandType.StoredProcedure)


        Page.ClientScript.RegisterStartupScript([GetType](), "msgbox", "alert('Account Information Updated');", True)
        


    End Sub

    Private Sub bindData()

        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@UserId", loginclass.getClientID())

        Dim dt As DataTable = sqlHelper.getDataTable("[NewUserList]", sqlpar, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
            txtFirst.Text = Convert.ToString(dt.Rows(0)("strFirstName"))
            txtLast.Text = Convert.ToString(dt.Rows(0)("strLastName"))
            txtCompany.Text = Convert.ToString(dt.Rows(0)("strCompanyName"))
            txtAdd.Text = Convert.ToString(dt.Rows(0)("strAddress"))
            txtCity.Text = Convert.ToString(dt.Rows(0)("strCity"))
            txtPhone.Text = Convert.ToString(dt.Rows(0)("strPhone"))
            txtContry.Text = Convert.ToString(dt.Rows(0)("strContry"))
            txtZip.Text = Convert.ToString(dt.Rows(0)("strFax"))
            txtEmail.Text = Convert.ToString(dt.Rows(0)("strEmailAddress"))
            txtPassword.Text = Convert.ToString(dt.Rows(0)("strPassword"))
            dpdstate.SelectedItem.Text = Convert.ToString(dt.Rows(0)("strState"))
        End If

    End Sub

End Class
