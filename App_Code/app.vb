Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Reflection
Imports System.Data.SqlClient
Imports System.Net.Mail
Imports System.IO
Imports System.Net


Public Class app



    Public Shared Sub setCurrent()

        Dim ck As HttpCookie = HttpContext.Current.Request.Cookies("NirbhayCk")
        If ck Is Nothing Then
            ck = New HttpCookie("NirbhayCk")
            ck.Expires = DateTime.Now.AddDays(60)
        End If


        ck.Values("sesid") = GetRandomNumber()
        HttpContext.Current.Response.Cookies.Add(ck)

    End Sub

    Public Shared Sub setNewSession()
        Dim ck As HttpCookie = HttpContext.Current.Request.Cookies("NirbhayCk")
        If ck Is Nothing Then
            ck = New HttpCookie("NirbhayCk")

            ck.Expires = DateTime.Now.AddDays(60)
        End If
        ck.Values("sesid") = GetRandomNumber()

        HttpContext.Current.Response.Cookies.Add(ck)

    End Sub
   
    Public Shared Function getCurrentSession() As String


        Dim ck As HttpCookie = HttpContext.Current.Request.Cookies("NirbhayCk")

        If ck Is Nothing Then

            setNewSession()
        Else
            Return Convert.ToString(ck.Values("sesid"))
        End If
        Return ""
    End Function


    Public Shared Function GetRandomNumber() As String
        Dim rand As New Random()
        Dim newpassword As New StringBuilder("")

        For index As Integer = 1 To 2
            newpassword.Append(CChar(CChar(CStr(rand.[Next](65, 90)))))
        Next

        For index As Integer = 0 To 2
            newpassword.Insert(rand.[Next](0, 3 + index), Convert.ToString(rand.[Next](0, 9)))
        Next

        Return ("OD" + newpassword.ToString() + DateTime.Now.Day.ToString())
    End Function



    Public Shared Function GetIPAddress() As String
        Try
            Return HttpContext.Current.Request.ServerVariables("REMOTE_ADDR")
        Catch generatedExceptionName As Exception

            Return ""
        End Try


    End Function




    Public Shared Function getRandomPassword() As String
        Dim rand As New Random()
        Dim newpassword As New StringBuilder("")

        For index As Integer = 1 To 4
            newpassword.Append(CChar(CChar(CStr(rand.[Next](65, 90)))))
        Next

        For index As Integer = 0 To 2
            newpassword.Insert(rand.[Next](0, 3 + index), Convert.ToString(rand.[Next](0, 9)))
        Next

        Return newpassword.ToString()
    End Function


    Shared Function Value(ByVal strKey As String) As String
        Try
            Return System.Configuration.ConfigurationManager.AppSettings(strKey)
        Catch ex As Exception
            Return ""
        End Try
    End Function

    Shared Sub WebsiteVisited()

        Try

            If String.IsNullOrEmpty(HttpContext.Current.Session("sesUserVisit")) Then
                HttpContext.Current.Session("sesUserVisit") = "UserVisited"

                sqlHelper.executeNonQueryFront("[dbo].[WebSettingAddVisitor]", CommandType.StoredProcedure)

            End If
        Catch ex As Exception
        End Try

    End Sub

    Shared Function getChatDate(ByVal strDate As Object) As String
        Try

            Return Convert.ToDateTime(strDate).ToShortTimeString + " , " + Convert.ToDateTime(strDate).ToShortDateString

        Catch ex As Exception
            Return ""
        End Try

    End Function






    Shared Function isPdf(ByVal strImgExt As String) As Boolean
        strImgExt = strImgExt.ToLower()
        If strImgExt = ".pdf" Then
            Return True
        Else
            Return False
        End If
    End Function


    Shared Function getShortDate(ByVal strDate As Object) As String
        Try

            Return Convert.ToDateTime(strDate).ToShortDateString

        Catch ex As Exception
            Return ""
        End Try

    End Function

    Shared Function getPaginationHtml(ByVal intCurPage As Integer, ByVal intTotalRecord As Integer) As String
        Dim intPageSize As Integer = 10
        Dim intTotalPage As Integer = intTotalRecord / intPageSize
        Dim intMod As Integer = intTotalRecord Mod intPageSize

        If intMod > 0 Then
            intTotalPage += 1
        End If

        Dim strPagingHtml As New StringBuilder(String.Empty)

        If intTotalPage <= 6 Then
            strPagingHtml.Append("<div class=""pagination right"">")
            strPagingHtml.Append("<a href=""javascript:"" " + IIf(intCurPage = 1, "", "page=" + Convert.ToString(intCurPage - 1) + "") + " >&laquo;</a>")
            For i As Int16 = 1 To intTotalPage
                strPagingHtml.Append("<a href=""javascript:"" " + IIf(intCurPage = i, "class=""active"" ", "") + " page=""" + i.ToString() + """ >" + i.ToString() + "</a>")
            Next
            strPagingHtml.Append("<a href=""javascript:"" " + IIf(intCurPage = intTotalPage, "", "page=""" + Convert.ToString(intCurPage + 1) + """") + " >&raquo;</a>")
            strPagingHtml.Append("</div>")
            Return strPagingHtml.ToString()
        End If

        strPagingHtml.Append("<div class=""pagination right"">")

        If intCurPage <= 6 Then
            strPagingHtml.Append("<a href=""javascript:"" " + IIf(intCurPage = 1, "", "page=" + Convert.ToString(intCurPage - 1) + "") + " >&laquo;</a>")
            For i As Int16 = 1 To 6
                strPagingHtml.Append("<a href=""javascript:"" " + IIf(intCurPage = i, "class=""active"" ", "") + " page=""" + i.ToString() + """ >" + i.ToString() + "</a>")
            Next
            strPagingHtml.Append("<a href=""javascript:"" page=""" + Convert.ToString(intCurPage + 1) + """ >&raquo;</a>")
        Else
            Dim iNextRemPages As Int16 = intTotalPage - intCurPage
            Dim intStartPage As Integer
            Dim intEndPage As Integer

            If iNextRemPages >= 2 Then
                intStartPage = intCurPage - 3
                intEndPage = intCurPage + 2
            Else
                intStartPage = intTotalPage - 5
                intEndPage = intTotalPage
            End If

            strPagingHtml.Append("<a href=""javascript:"" page=""" + Convert.ToString(intCurPage - 1) + """ >&laquo;</a>")
            For i As Integer = intStartPage To intEndPage
                strPagingHtml.Append("<a href=""javascript:"" " + IIf(intCurPage = i, "class=""active"" ", "") + " page=""" + i.ToString() + """ >" + i.ToString() + "</a>")
            Next
            strPagingHtml.Append("<a href=""javascript:"" " + IIf(intCurPage = intEndPage, "", "page=""" + Convert.ToString(intCurPage + 1) + """") + " >&raquo;</a>")

        End If

        strPagingHtml.Append("</div>")
        Return strPagingHtml.ToString()
    End Function

    Shared Function ObtainDataTableFromIEnumerable(ByVal ien As IEnumerable) As DataTable
        Dim dt As New DataTable()
        Try

            For Each obj As Object In ien
                Dim t As Type = obj.[GetType]()
                Dim pis As PropertyInfo() = t.GetProperties()
                If dt.Columns.Count = 0 Then
                    For Each pi As PropertyInfo In pis
                        Try
                            dt.Columns.Add(pi.Name, pi.PropertyType)
                        Catch ex As Exception
                            Try
                                If pi.Name.Contains("date") Then
                                    dt.Columns.Add(pi.Name, GetType(DateTime))
                                ElseIf pi.Name.StartsWith("dec") Then
                                    dt.Columns.Add(pi.Name, GetType(Decimal))
                                ElseIf pi.Name.StartsWith("bint") Then
                                    dt.Columns.Add(pi.Name, GetType(Int64))
                                ElseIf pi.Name.StartsWith("int") Then
                                    dt.Columns.Add(pi.Name, GetType(Int32))
                                Else
                                    dt.Columns.Add(pi.Name, GetType(String))
                                End If
                            Catch ex1 As Exception
                                dt.Columns.Add(pi.Name, GetType(String))
                            End Try
                        End Try
                    Next
                End If
                Dim dr As DataRow = dt.NewRow()
                For Each pi As PropertyInfo In pis
                    Try
                        Dim value As Object = pi.GetValue(obj, Nothing)
                        dr(pi.Name) = value
                    Catch ex As Exception
                        dr(pi.Name) = DBNull.Value
                    End Try
                Next
                dt.Rows.Add(dr)
            Next
        Catch ex As Exception

        End Try

        Return dt
    End Function

    Shared Sub msgError(ByVal divMsg As HtmlContainerControl, ByVal strMsg As String)
        divMsg.Attributes.Add("class", "message errormsg")
        divMsg.InnerHtml = "<p>" + strMsg + "</p>"
    End Sub

    Shared Sub msgSuccess(ByVal divMsg As HtmlContainerControl, ByVal strMsg As String)
        divMsg.Attributes.Add("class", "message success")
        divMsg.InnerHtml = "<p>" + strMsg + "</p>"
    End Sub

    Shared Sub msgInformation(ByVal divMsg As HtmlContainerControl, ByVal strMsg As String)
        divMsg.Attributes.Add("class", "message info")
        divMsg.InnerHtml = "<p>" + strMsg + "</p>"
    End Sub

    Shared Sub msgWarning(ByVal divMsg As HtmlContainerControl, ByVal strMsg As String)
        divMsg.Attributes.Add("class", "message warning")
        divMsg.InnerHtml = "<p>" + strMsg + "</p>"
    End Sub

    Shared Sub msgClear(ByVal divMsg As HtmlContainerControl)
        divMsg.InnerHtml = ""
        divMsg.Attributes("class") = ""
    End Sub


    Shared Sub GeneralOpration(ByVal strTblName As String, ByVal strPKName As String, ByVal strIDName As String, ByVal strOprType As String)
        'execute query starts
        Dim sqlParColl(3) As SqlParameter
        sqlParColl(0) = New SqlParameter("@strTblName", strTblName)
        sqlParColl(1) = New SqlParameter("@strPKName", strPKName)
        sqlParColl(2) = New SqlParameter("@strIDName", strIDName)
        sqlParColl(3) = New SqlParameter("@strOprType", strOprType)

        sqlHelper.executeNonQuery("[dbo].[GeneralOperations]", sqlParColl, CommandType.StoredProcedure)
        'execute query ends


    End Sub

    Shared Function isImage(ByVal strImgExt As String) As Boolean
        strImgExt = strImgExt.ToLower()
        If strImgExt = ".bmp" Or strImgExt = ".dib" Or strImgExt = ".jpg" Or strImgExt = ".jpeg" Or strImgExt = ".jpe" Or strImgExt = ".jfif" Or strImgExt = ".gif" Or strImgExt = ".tif" Or strImgExt = ".tiff" Or strImgExt = ".png" Then
            Return True
        Else
            Return False
        End If
    End Function
    Shared Function isFile(ByVal strFileExt As String) As Boolean
        strFileExt = strFileExt.ToLower()
        If strFileExt = ".pdf" Or strFileExt = ".doc" Or strFileExt = ".docx" Or strFileExt = ".txt" Then
            Return True
        Else
            Return False
        End If
    End Function

    'Shared Sub sendMail(ByVal strTo As String, ByVal strSubject As String, ByVal strMes As String)
    '    Try

    '        Dim client As New SmtpClient()

    '        client.DeliveryMethod = SmtpDeliveryMethod.Network
    '        client.EnableSsl = True
    '        client.Host = "smtp.gmail.com"
    '        client.Port = 587

    '        ' setup Smtp authentication
    '        Dim credentials As New System.Net.NetworkCredential("noreplay.wpcrm@gmail.com", "wpcrm4191")
    '        client.UseDefaultCredentials = False
    '        client.Credentials = credentials

    '        Dim msg As New MailMessage()

    '        msg.From = New MailAddress("info@NirbhayProducts.com", "Nirbhay Products")
    '        msg.To.Add(strTo)


    '        'If Not String.IsNullOrEmpty(strCC) Then
    '        '    msg.CC.Add(strCC)
    '        'End If

    '        'If Not String.IsNullOrEmpty(strBCC) Then
    '        '    msg.Bcc.Add(strBCC)
    '        'End If


    '        msg.Subject = strSubject
    '        msg.IsBodyHtml = True
    '        msg.Body = strMes

    '        client.Send(msg)

    '    Catch ex As Exception
    '    End Try

    'End Sub
    Public Shared Function SendMail(strTo As String, strSubject As String, strMsg As String) As Boolean
        Dim isSucess As Boolean = True
        Dim strErrorMsg As String = ""
        Try
            Dim client As New SmtpClient("localhost")

            client.DeliveryMethod = SmtpDeliveryMethod.Network

            client.Host = "smtpout.secureserver.net"
            client.Port = 25

            Dim credentials As New System.Net.NetworkCredential("test@toralestate.com", "test123")
            client.UseDefaultCredentials = False
            client.Credentials = credentials

            Dim msg As New MailMessage()

            msg.From = New MailAddress("info@rajkotsupermarket.com", "rajkotsupermarket.com")
            msg.[To].Add(strTo)
            'If Not String.IsNullOrEmpty(BCCEmailID) Then
            '    msg.Bcc.Add(BCCEmailID)
            'End If

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
    Shared Sub WebsiteUpdated()

        Try
            sqlHelper.executeNonQueryFront("[dbo].[WebSettingLastUpdate]", CommandType.StoredProcedure)
        Catch ex As Exception
        End Try

    End Sub



    Shared Function WebSettingList() As DataTable

        Dim dt As New DataTable

        Try

            dt = sqlHelper.getDataTable("[dbo].[WebSettingFrontList]", CommandType.StoredProcedure)

        Catch ex As Exception
        End Try

        Return dt

    End Function

    Public Shared Function getEmailTemplate(ByVal strTemplateName As String, ByRef strSubject As String) As String

        Dim strEmailTemplate As String = ""

        Dim spar As SqlParameter() = New SqlParameter(0) {}
        spar(0) = New SqlParameter("@strName", strTemplateName)

        Dim dt As DataTable = sqlHelper.getDataTable("NotificationEmailTemplateUserSide", spar, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
            strEmailTemplate = Convert.ToString(dt.Rows(0)("strContent"))
            strSubject = Convert.ToString(dt.Rows(0)("strSubject"))
        End If

        Return strEmailTemplate

    End Function

    Public Shared Sub sendMailBcc(ByVal strBcc As String, ByVal strSubject As String, ByVal strMessage As String)
        'try
        '{
        Dim msg As New MailMessage()
        Dim client As New SmtpClient()

        msg.From = New MailAddress("no-replay@bonglob.com", "Mycomrader.co.uk")

        msg.Bcc.Add(strBcc)
        msg.Subject = strSubject
        msg.IsBodyHtml = True
        msg.Body = strMessage

        client.Send(msg)

        '}
        'catch (Exception)
        '{

        '}
    End Sub
    Shared Function sendSMS(ByVal strTo As String, ByVal strMsg As String) As String

        'Dim sUserID As String = "toralestate"
        'Dim sPwd As String = "212162"

        Dim sURL As String
        Dim objReader As StreamReader

        '        sURL = "http://smslane.com/vendorsms/pushsms.aspx?user=toralestate&password=212162&msisdn=91" + strTo + "&sid=SMSLane&msg=" + strMsg + "&fl=0"
        sURL = "http://smslane.com/vendorsms/pushsms.aspx?user=toralestate&password=212162&msisdn=91" + strTo + "&sid=918980933185&msg=" + strMsg + "&fl=0"


        Dim sResponse As WebRequest
        sResponse = WebRequest.Create(sURL)

        Try

            Dim objStream As Stream
            objStream = sResponse.GetResponse.GetResponseStream()
            objReader = New StreamReader(objStream)
            ' Response.Write(objReader.ReadToEnd())
            objReader.Close()

            Return "<br/>Message send sucessfully"

        Catch ex As Exception
            Return ex.Message
        End Try

    End Function

End Class
