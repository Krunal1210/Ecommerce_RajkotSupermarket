
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls


Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.Net.Mail

Public Partial Class adminpanel_Home
	Inherits System.Web.UI.Page

	#Region "Page Events"

	Protected Sub Page_Load(sender As Object, e As EventArgs)
		If Not IsPostBack Then

			If Not String.IsNullOrEmpty(Convert.ToString(Request("id"))) Then
				Try
					If Not (Convert.ToInt32(Request("id")) > 0) Then
						Response.Redirect("NotificationEmailTemplateModify.aspx")
					Else

						Dim sqlPar As SqlParameter() = New SqlParameter(0) {}
						sqlPar(0) = New SqlParameter("@bintNotificationEmailId", Convert.ToInt32(Request("id")))

                        Dim dt As DataTable = sqlHelper.getDataTable("[NotificationEmailTemplateList]", sqlPar, CommandType.StoredProcedure)

						If dt.Rows.Count > 0 Then
							'bind page for edit starts


							txtName.Text = Convert.ToString(dt.Rows(0)("strName"))
							txtSubject.Text = Convert.ToString(dt.Rows(0)("strSubject"))
							txtContent.Text = Convert.ToString(dt.Rows(0)("strContent"))
							hdnCatId.Value = Convert.ToString(Request("id"))
							txtName.Enabled = False

								'bind page for edit ends
							txtName.[ReadOnly] = True
						End If


						h2Category.InnerText = "Update Notification Email Template"
					End If
				Catch generatedExceptionName As Exception
					Response.Redirect("NotificationEmailTemplateModify.aspx")
				End Try

			End If
		End If

	End Sub


	Protected Sub btnSave_Click(sender As Object, e As EventArgs)

		Dim sqlPar As SqlParameter() = New SqlParameter(3) {}
		sqlPar(0) = New SqlParameter("@bintNotificationEmailId", Convert.ToInt32(hdnCatId.Value))
		sqlPar(1) = New SqlParameter("@strName", txtName.Text.Trim())
		sqlPar(2) = New SqlParameter("@strContent", txtContent.Text.Trim())
		sqlPar(3) = New SqlParameter("@strSubject", txtSubject.Text.Trim())

        sqlHelper.executeNonQuery("NotificationEmailTemplateModify", sqlPar, CommandType.StoredProcedure)

		If Convert.ToInt32(hdnCatId.Value) > 0 Then
			lblMsg.Text = "Notification Email Template updated successfully."
		Else
			lblMsg.Text = "Notofication Email Template inserted successfully."
			clear()
		End If
	End Sub

	Protected Sub btnCancel_Click1(sender As Object, e As EventArgs)
		clear()
		lblMsg.Text = ""

	End Sub


	#End Region

	#Region "Page Functions"

	Private Sub clear()
		hdnCatId.Value = "0"
		txtContent.Text = ""
		txtName.Text = ""
		txtSubject.Text = ""

	End Sub



	#End Region



End Class

 
