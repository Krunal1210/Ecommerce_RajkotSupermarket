Imports System.Data
Imports System.Data.SqlClient


Partial Class User_home
    Inherits System.Web.UI.Page

#Region "Page Declarations"

#End Region

#Region "Page Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Try



            'add/edit starts
            Dim sqlParColl(3) As SqlParameter
            sqlParColl(0) = New SqlParameter("@bintUserId", loginclass.getUserId())
            sqlParColl(1) = New SqlParameter("@oldPassword", Encrypt.UTF8Encrypt(txtCurPassword.Text.Trim))
            sqlParColl(2) = New SqlParameter("@newPassword", Encrypt.UTF8Encrypt(txtNewPassword.Text.Trim))
            sqlParColl(3) = New SqlParameter("@intRetVal", 0)
            sqlParColl(3).Direction = ParameterDirection.Output

            sqlHelper.executeNonQuery("[dbo].[ChangePassword]", sqlParColl, CommandType.StoredProcedure)
            'add/edit ends

            If Convert.ToInt32(sqlParColl(3).Value) > 0 Then
                app.msgError(divMsg, "Current password is invalid")
            Else
                app.msgSuccess(divMsg, "Password changed successfully")
                clear()
            End If


        Catch ex As Exception
            app.msgError(divMsg, ex.Message)
        End Try




    End Sub

#End Region

#Region "Page Functions"
    Private Sub clear()

    End Sub

#End Region



End Class
