Imports System.Data
Imports System.Data.SqlClient

Partial Class userControls_Grievances
    Inherits System.Web.UI.UserControl




#Region "Declarations"

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub btnPostGrievance_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPostGrievance.Click


        Dim strTickNo As String = ""

        'add to database starts

        Try

            Dim sqlPar(12) As SqlParameter
            sqlPar(0) = New SqlParameter("@strName", txtName.Text.Trim())
            sqlPar(1) = New SqlParameter("@strEmail", txtEmail.Text.Trim())
            sqlPar(2) = New SqlParameter("@strMobile", txtMobileNo.Text.Trim())
            sqlPar(3) = New SqlParameter("@strPhoneNo", txtPhoneNo.Text.Trim())
            sqlPar(4) = New SqlParameter("@strStatus", drpStatus.SelectedValue)
            sqlPar(5) = New SqlParameter("@strNature", drpNature.SelectedValue)
            sqlPar(6) = New SqlParameter("@strPFNo", txtPFAccNo.Text.Trim())
            sqlPar(7) = New SqlParameter("@strPpoNo", txtPPONo.Text.Trim())
            sqlPar(8) = New SqlParameter("@strDateSubmission", txtDOS.Text.Trim())
            sqlPar(9) = New SqlParameter("@strOfficeSubmitted", txtOfficeSub.Text.Trim())
            sqlPar(10) = New SqlParameter("@strRefNo", txtRefNo.Text.Trim())
            sqlPar(11) = New SqlParameter("@strDetails", txtDetails.Text.Trim())
            sqlPar(12) = New SqlParameter("@intRetNo", 0)
            sqlPar(12).Direction = ParameterDirection.InputOutput

            sqlHelper.executeNonQuery("[GrievianceAdd]", sqlPar, CommandType.StoredProcedure)

            strTickNo = Convert.ToString(sqlPar(12).Value)

        Catch ex As Exception

        End Try


        'add to database ends


        Dim strMailTemplate As New StringBuilder(System.IO.File.ReadAllText(Server.MapPath("~/mailTemplate/grievance.htm")))

        strMailTemplate.Replace("<%Name%>", txtName.Text.Trim)
        strMailTemplate.Replace("<%EmailId%>", txtEmail.Text.Trim)

        strMailTemplate.Replace("<%MobileNo%>", txtMobileNo.Text.Trim)
        strMailTemplate.Replace("<%PhoneNo%>", txtPhoneNo.Text.Trim)

        If drpStatus.SelectedValue = "Others" Then
            strMailTemplate.Replace("<%Status%>", txtOther.Text.Trim())
        Else
            strMailTemplate.Replace("<%Status%>", drpStatus.SelectedValue)
        End If

        strMailTemplate.Replace("<%Nature%>", drpNature.SelectedValue)

        strMailTemplate.Replace("<%PFAccountNo%>", txtPFAccNo.Text.Trim)
        strMailTemplate.Replace("<%PPONo%>", txtPPONo.Text.Trim)

        strMailTemplate.Replace("<%DateOfSubmission%>", txtDOS.Text.Trim)
        strMailTemplate.Replace("<%OfficeWhereSubmitted%>", txtOfficeSub.Text.Trim)
        strMailTemplate.Replace("<%ReferenceNo%>", txtRefNo.Text.Trim)
        strMailTemplate.Replace("<%DetailsIfAny%>", txtDetails.Text.Trim)


        Try
            app.sendMail("info@albertsolution.org", "New Grievance Generated", strMailTemplate.ToString())
        Catch ex As Exception
        Finally
            lblMsg.InnerText = "Your Grievance is sucessfully received. Your Ticket No for Grievance is " + strTickNo + ". Thanks."
            clear()
        End Try

    End Sub

    Protected Sub drpStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpStatus.SelectedIndexChanged
        If drpStatus.SelectedValue = "Others" Then
            txtOther.Visible = True
        Else
            txtOther.Visible = False
        End If
    End Sub

#End Region


#Region "Functions"


    Private Sub clear()

        ClearData.clearAllTextBox(pnlData)
        ClearData.clearAllDropdownSelection(pnlData)
        txtOther.Visible = False

    End Sub

#End Region






   
End Class
