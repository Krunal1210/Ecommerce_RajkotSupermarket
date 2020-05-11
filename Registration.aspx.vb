Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail

Partial Class Registration
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then


            Page.Title = " Customer Registration | Rajkot Supermarket"
            txtRef.Text = Convert.ToString(Request("refcode"))
        End If


    End Sub


    Protected Sub btnSignUp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignUp.Click

        If chkAgree.Checked Then


            Dim sqlpar(1) As SqlParameter
            sqlpar(0) = New SqlParameter("@strEmailAddress", txtEmail.Text.Trim())
            sqlpar(1) = New SqlParameter("@bintUserId", 0)
            sqlpar(1).Direction = ParameterDirection.Output
            sqlHelper.executeNonQuery("[dbo].[UserRegistrationCheck]", sqlpar, CommandType.StoredProcedure)
            Dim userexist As Integer = sqlpar(1).Value

            If userexist = "0" Then
                Dim reg(13) As SqlParameter
                reg(0) = New SqlParameter("@bintUserId", Convert.ToString(Request("id")))
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
                reg(13) = New SqlParameter("@bintid", 0)
                reg(13).Direction = ParameterDirection.Output
                sqlHelper.executeNonQuery("[UserRegistrationNew]", reg, CommandType.StoredProcedure)

                Dim strid As String = Convert.ToString(reg(13).Value)
                If txtRef.Text.Trim <> "" Then

                    Dim sqlR(1) As SqlParameter
                    sqlR(0) = New SqlParameter("@JoinUserId", strid)
                    sqlR(1) = New SqlParameter("@Refcode", txtRef.Text.Trim)
                    sqlHelper.executeNonQuery("[AddReferralToUserAccount]", sqlR, CommandType.StoredProcedure)

                End If
                Dim str As String = loginclass.getCustomerLogin(txtEmail.Text, txtPassword.Text, 1)

                If str = "Valid" Then

                    Dim strSubject As String = ""
                    Dim strMsg As String = ""


                    strMsg = app.getEmailTemplate("Registration", strSubject)
                    strMsg = strMsg.Replace("[[Name]]", txtFirst.Text.Trim())
                    strMsg = strMsg.Replace("[[UserName]]", txtEmail.Text.Trim())
                    strMsg = strMsg.Replace("[[Password]]", txtPassword.Text.Trim())
                    Dim cc As String = "niravkasundra@gmail.com"
                    'app.SendMailNewOil(txtEmail.Text.Trim(), cc, "Oil Bazzar -Registration Confirmation", strMsg)
                    'app.SendMailNewOil(cc, cc, "Oil Bazzar -Registration Confirmation", strMsg)
                    'SendMailNewcs(cc, cc, "NirbhayProducts -Registration Confirmation", strMsg)
                    'SendMailNewcs("kaushal.s@dozoservies.com", cc, "NirbhayProducts -Registration Confirmation", strMsg)
                    ' SendMailNewcs("tomoyoshi.kobori@dozoservices.com", cc, "NirbhayProducts -Registration Confirmation", strMsg)
                    '               SendMailNewcs("noopur@dozoservices.com", cc, "NirbhayProducts -Registration Confirmation", strMsg)
                    app.sendMail(txtEmail.Text.Trim(), "Rajkot Supermarket - Registration Confirmation", strMsg)
                    app.SendMail(cc, "Rajkot Supermarket - Registration Confirmation", strMsg)
                    Response.Redirect("Default.aspx")
                Else

                End If
            Else
                'user already registered with this e-mail id

                clear()
            End If

        Else
            Page.ClientScript.RegisterStartupScript(Me.[GetType](), "run", "alert('Please Agree to Term & Condition');", True)
        End If

    End Sub
    

    Private Sub clear()
        txtCompany.Text = ""
        txtFirst.Text = ""
        txtLast.Text = ""
        txtAdd.Text = ""
        txtCity.Text = ""
        dpdstate.SelectedIndex = 0
        txtPhone.Text = ""
        txtZip.Text = ""
        txtEmail.Text = ""
        txtPassword.Text = ""
        txtConfirm.Text = ""
    End Sub

End Class
