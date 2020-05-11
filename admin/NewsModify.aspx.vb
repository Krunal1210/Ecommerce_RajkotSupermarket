Imports System.Data
Imports System.Data.SqlClient

Partial Class admin_SchoolModify
    Inherits System.Web.UI.Page

#Region "Declarations"

#End Region

#Region "Page Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            Try

                If (Not String.IsNullOrEmpty(Convert.ToString(Request("id")))) And Convert.ToInt32(Request("id")) > 0 Then
                    bindNews()
                End If
            Catch ex As Exception
            End Try

        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Try
            'add/edit starts
            Dim sqlParColl(4) As SqlParameter
            sqlParColl(0) = New SqlParameter("@bintNewsId", Convert.ToInt64(hdnNewsId.Value))
            sqlParColl(1) = New SqlParameter("@strNewsTitle", txtNewsTitle.Text.Trim)
            sqlParColl(2) = New SqlParameter("@strContent", txtContent.Text.Trim)
            sqlParColl(3) = New SqlParameter("@bitIsOnHome", chkIsOnHomePage.Checked)
            sqlParColl(4) = New SqlParameter("@dateNews", Convert.ToDateTime(txtNewsDate.Text.Trim))

            sqlHelper.executeNonQuery("[dbo].[NewsModify]", sqlParColl, CommandType.StoredProcedure)
            'add/edit ends


            If hdnNewsId.Value <> "0" Then
                app.msgSuccess(divMsg, "News updated successfully.")
            Else
                app.msgSuccess(divMsg, "News inserted successfully.")
                clear()
            End If

        Catch ex As Exception
            app.msgError(divMsg, ex.Message)
        End Try

    End Sub


#End Region

#Region "Functions"

    Private Sub bindNews()

        'get data starts
        Dim sqlParColl(0) As SqlParameter
        sqlParColl(0) = New SqlParameter("@bintNewsId", Convert.ToInt32(Request("id")))
        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[NewsListAdmin]", sqlParColl, CommandType.StoredProcedure)
        'get data ends

        If dt.Rows.Count > 0 Then

            txtNewsTitle.Text = Convert.ToString(dt.Rows(0)("strNewsTitle"))
            txtContent.Text = Convert.ToString(dt.Rows(0)("strContent"))
            chkIsOnHomePage.Checked = Convert.ToBoolean(dt.Rows(0)("bitIsOnHome"))
            txtNewsDate.Text = Convert.ToDateTime(dt.Rows(0)("dateNews")).ToShortDateString()

            hdnNewsId.Value = Convert.ToString(dt.Rows(0)("bintNewsId"))


            h2Title.InnerHtml = "Edit News"
        End If

    End Sub

    Private Sub clear()
        ClearData.clearAllTextBox(pnlData)
        txtContent.Text = ""
    End Sub

#End Region


End Class
