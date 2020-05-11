
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click

        Dim strRole As String = loginclass.getLogin(txtUserName.Text.Trim, txtPassword.Text.Trim, chkRememberMe.Checked)


        If strRole = "Employee" Then
            Response.Redirect("~/Employee/Home.aspx", True)
        ElseIf strRole = "Admin" Then
            Response.Redirect("~/admin/Home.aspx", True)
        ElseIf strRole = "Customer" Then
            Response.Redirect("~/Customer/Home.aspx", True)
        Else
            app.msgError(divMsg, "Invalid username or password.")
        End If


    End Sub



End Class
