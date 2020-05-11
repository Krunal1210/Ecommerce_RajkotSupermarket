Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail
Partial Class EarnMoney
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Not IsPostBack Then


            If loginclass.isClientLogin() Then
                bindData()
            Else
                Response.Redirect("~/Registration.aspx")
            End If


        End If
    End Sub
    Private Sub bindData()

        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@UserId", loginclass.getClientID())

        Dim dt As DataTable = sqlHelper.getDataTable("[NewUserList]", sqlpar, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
           
            lblCode.Text = Convert.ToString(dt.Rows(0)("refcode"))
            lblCode2.Text = Convert.ToString(dt.Rows(0)("refcode"))
        End If

    End Sub
End Class
