Imports System.Net.Mail

Partial Class userControls_Feedback
    Inherits System.Web.UI.UserControl




#Region "Declarations"

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim strMailTemplate As New StringBuilder(System.IO.File.ReadAllText(Server.MapPath("~/mailTemplate/Inquiry.htm")))

        strMailTemplate.Replace("<%FirstName%>", txtFirstName.Text.Trim)
        strMailTemplate.Replace("<%LastName%>", txtLaseName.Text.Trim)
        strMailTemplate.Replace("<%EmailId%>", txtEmail.Text.Trim)
        strMailTemplate.Replace("<%PhoneNo%>", txtPhone.Text.Trim)
        strMailTemplate.Replace("<%Purpose%>", dpdPurpose.SelectedItem.Text)
        strMailTemplate.Replace("<%Description%>", txtDescription.Text.Trim())

        Dim strsub As String = ""
        If dpdPurpose.SelectedValue = "6" Then
            strsub = txtOtherPurpose.Text + "-" + txtFirstName.Text.Trim + " " + txtLaseName.Text.Trim
        Else
            strsub = dpdPurpose.SelectedItem.Text + "-" + txtFirstName.Text.Trim + " " + txtLaseName.Text.Trim
        End If
        Try
            'app.sendMail("shrikant@whitepearl.biz", strsub, strMailTemplate.ToString())
            SendMailNewcs("nirbhay@nirbhayproducts.com", " ", strsub, strMailTemplate.ToString())
            Page.ClientScript.RegisterStartupScript(Me.[GetType](), "run", "alert('Thank you for contacting us! Someone from our team will get in touch with you shortly. Please visit our FAQs.');", True)
            clear()
            txtOtherPurpose.Text = ""
            txtOtherPurpose.Visible = False
            dpdPurpose.ClearSelection()
        Catch ex As Exception
        Finally
            'Page.ClientScript.RegisterStartupScript(Me.[GetType](), "run", "alert('Thank you for contacting us! Someone from our team will get in touch with you shortly. Please visit our FAQs.');", True)
            '  lblMsg.InnerText = "Your Feedback is sucessfully received."
            clear()
        End Try


    End Sub

    Public Shared Function SendMailNewcs(ByVal strTo As String, ByVal BCCEmailID As String, ByVal strSubject As String, ByVal strMsg As String) As Boolean
        Dim isSucess As Boolean = True
        Dim strErrorMsg As String = ""

        Try
            Dim client As New SmtpClient()

            Dim msg As New MailMessage()

            msg.From = New MailAddress("nirbhay@nirbhayproducts.com", "NirbhayProducts.com")
            msg.[To].Add(strTo)
            ' if (!string.IsNullOrEmpty(BCCEmailID)) msg.Bcc.Add(BCCEmailID);
            msg.Subject = strSubject
            msg.IsBodyHtml = True
            msg.Body = strMsg

            client.Send(msg)
            Return True
        Catch ex As Exception
            isSucess = False
            strErrorMsg = ex.Message
            Return False
        End Try


    End Function


#End Region


#Region "Functions"


    Private Sub clear()

        ClearData.clearAllTextBox(pnlData)
        ClearData.clearAllDropdownSelection(pnlData)

    End Sub

#End Region


    Protected Sub dpdPurpose_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dpdPurpose.SelectedIndexChanged

        If dpdPurpose.SelectedValue = "6" Then
            txtOtherPurpose.Visible = True
        Else
            RequiredFieldValidator1.Enabled = False
            txtOtherPurpose.Visible = False
        End If

    End Sub
End Class
