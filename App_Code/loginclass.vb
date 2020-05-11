Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class loginclass

#Region "Variables"
    Shared strLoginCookieName As String = app.Value("LoginCookieName")
    Shared strUserNameCookieName As String = app.Value("UserNameCookieName")
    Shared strUserRollCookieName As String = app.Value("UserRollCookieName")
    Shared strUserIdCookieName As String = app.Value("UserIdCookieName")
#End Region

#Region "Functions"

    Shared Function getLogin(ByVal strUserName As String, ByVal strPassword As String, ByVal blRememberMe As Boolean) As String
        ' return "" if invalid username or password
        ' return user roll if user is logged in successfully

        'Try
        'get data starts
        Dim strpass As String = Convert.ToString(Encrypt.UTF8Encrypt(strPassword))

        Dim sqlParColl(1) As SqlParameter
        sqlParColl(0) = New SqlParameter("@UserName", strUserName)
        sqlParColl(1) = New SqlParameter("@Password", strpass)

        Dim dtLogin As DataTable = sqlHelper.getDataTable("[dbo].[GetLogin]", sqlParColl, CommandType.StoredProcedure)
        'get data ends

        If dtLogin.Rows.Count() > 0 Then

            'User logged in successfully 
            'now create cookie
            Dim loginCookie As HttpCookie = New HttpCookie(strLoginCookieName)
            loginCookie.Values.Add(strUserNameCookieName, Encrypt.UTF8Encrypt(strUserName))
            loginCookie.Values.Add(strUserRollCookieName, Encrypt.UTF8Encrypt(Convert.ToString(dtLogin.Rows(0)("UserRoll"))))

            If blRememberMe Then
                loginCookie.Expires = DateTime.Now.AddDays(7)
            Else
                loginCookie.Expires = DateTime.Now.AddDays(1)
            End If
            HttpContext.Current.Response.Cookies.Add(loginCookie)

            Return Convert.ToString(dtLogin.Rows(0)("UserRoll"))

        Else
            Return ""
        End If
        'Catch ex As Exception
        '    Return ""
        'End Try
    End Function
    Shared Function getCustomerLogin(ByVal strUserName As String, ByVal strPassword As String, ByVal blRememberMe As Boolean) As String
        ' return "" if invalid username or password
        ' return user roll if user is logged in successfully

        'Try
        'get data starts
        Dim strpass As String = Convert.ToString(strPassword)

        Dim sqlParColl(1) As SqlParameter
        sqlParColl(0) = New SqlParameter("@UserEmail", strUserName)
        sqlParColl(1) = New SqlParameter("@Password", strpass)

        Dim dtLogin As DataTable = sqlHelper.getDataTable("[dbo].[UserLogin]", sqlParColl, CommandType.StoredProcedure)
        'get data ends

        If dtLogin.Rows.Count() > 0 Then

            'User logged in successfully 
            'now create cookie
            Dim loginCookie As HttpCookie = New HttpCookie(strLoginCookieName)
            loginCookie.Values.Add(strUserIdCookieName, dtLogin.Rows(0)("bintUserId"))
            'loginCookie.Values.Add(strUserRollCookieName, Encrypt.UTF8Encrypt(Convert.ToString(dtLogin.Rows(0)("UserRoll"))))

            If blRememberMe Then
                loginCookie.Expires = DateTime.Now.AddDays(7)
            Else
                loginCookie.Expires = DateTime.Now.AddDays(1)
            End If
            HttpContext.Current.Response.Cookies.Add(loginCookie)

            Return "Valid"

        Else
            Return "InValid"
        End If
        'Catch ex As Exception
        '    Return ""
        'End Try
    End Function
    Shared Sub getlogout()

        'delete previous login cookie
        Try
            If Not HttpContext.Current.Request.Cookies(strLoginCookieName) Is Nothing Then
                'Clear login cookie
                Dim aCookoe = HttpContext.Current.Request.Cookies(strLoginCookieName)
                aCookoe(strUserNameCookieName) = ""
                aCookoe(strUserRollCookieName) = ""
                aCookoe.Expires = DateTime.Now.AddDays(-1)
                HttpContext.Current.Response.Cookies.Add(aCookoe)
                'Clear login Session
            End If
        Catch ex As Exception

        End Try

    End Sub
    Shared Sub getlogoutCLient()

        'delete previous login cookie
        Try
            If Not HttpContext.Current.Request.Cookies(strLoginCookieName) Is Nothing Then
                'Clear login cookie
                Dim aCookoe = HttpContext.Current.Request.Cookies(strLoginCookieName)
                aCookoe(strUserIdCookieName) = ""

                aCookoe.Expires = DateTime.Now.AddDays(-1)
                HttpContext.Current.Response.Cookies.Add(aCookoe)
                'Clear login Session
            End If
        Catch ex As Exception

        End Try

    End Sub
    Shared Function isLogin() As Boolean
        Try
            'Check whether cookie exists or not
            If Not HttpContext.Current.Request.Cookies(strLoginCookieName) Is Nothing Then

                If String.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserNameCookieName))) Then
                    Return False
                Else
                    Return True
                End If

            Else
                Return False
            End If

        Catch ex As Exception
            Return False
        End Try

    End Function
    Shared Function isClientLogin() As Boolean
        Try
            'Check whether cookie exists or not
            If Not HttpContext.Current.Request.Cookies(strLoginCookieName) Is Nothing Then

                If String.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserIdCookieName))) Then
                    Return False
                Else
                    Return True
                End If

            Else
                Return False
            End If

        Catch ex As Exception
            Return False
        End Try

    End Function
    Shared Function isAdmin() As Boolean
        If isLogin() Then
            Try
                'Check whether cookie exists or not

                If String.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserRollCookieName))) Then
                    Return False
                Else
                    Dim strRoll As String = Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserRollCookieName))
                    If Encrypt.UTF8Decrypt(strRoll).ToLower() = "admin" Then
                        Return True
                    Else
                        Return False
                    End If
                End If

            Catch ex As Exception
                Return False
            End Try
        Else
            Return False
        End If
    End Function

    Shared Function isEmployee() As Boolean
        If isLogin() Then
            Try
                'Check whether cookie exists or not

                If String.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserRollCookieName))) Then
                    Return False
                Else
                    Dim strRoll As String = Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserRollCookieName))
                    If Encrypt.UTF8Decrypt(strRoll).ToLower() = "employee" Then
                        Return True
                    Else
                        Return False
                    End If
                End If

            Catch ex As Exception
                Return False
            End Try
        Else
            Return False
        End If
    End Function
    Shared Function isCutomer() As Boolean
        If isLogin() Then
            Try
                'Check whether cookie exists or not

                If String.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserRollCookieName))) Then
                    Return False
                Else
                    Dim strRoll As String = Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserRollCookieName))
                    If Encrypt.UTF8Decrypt(strRoll).ToLower() = "customer" Then
                        Return True
                    Else
                        Return False
                    End If
                End If

            Catch ex As Exception
                Return False
            End Try
        Else
            Return False
        End If
    End Function
    Shared Function isCustomer() As Boolean
        If isLogin() Then
            Try
                'Check whether cookie exists or not

                If String.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserRollCookieName))) Then
                    Return False
                Else
                    Dim strRoll As String = Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserRollCookieName))
                    If Encrypt.UTF8Decrypt(strRoll).ToLower() = "grouphead" Then
                        Return True
                    Else
                        Return False
                    End If
                End If

            Catch ex As Exception
                Return False
            End Try
        Else
            Return False
        End If
    End Function

    'Shared Function isGuestUser() As Boolean
    '    If isLogin() Then
    '        Try
    '            'Check whether cookie exists or not

    '            If String.IsNullOrEmpty(Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserRollCookieName))) Then
    '                Return False
    '            Else
    '                Dim strRoll As String = Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserRollCookieName))
    '                If Encrypt.UTF8Decrypt(strRoll).ToLower() = "guestuser" Then
    '                    Return True
    '                Else
    '                    Return False
    '                End If
    '            End If

    '        Catch ex As Exception
    '            Return False
    '        End Try
    '    Else
    '        Return False
    '    End If
    'End Function



    Shared Function getUserName() As String

        Return Encrypt.UTF8Decrypt(Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserNameCookieName)))

    End Function
    Shared Function getClientID() As String

        Return Convert.ToString(HttpContext.Current.Request.Cookies(strLoginCookieName)(strUserIdCookieName))

    End Function

    Shared Function getCleintName() As String
        Dim strUserId As String = getClientID()

        'get data starts
        Dim sqlParColl(0) As SqlParameter
        sqlParColl(0) = New SqlParameter("@UserId", strUserId)

        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[getUserNameByUserId]", sqlParColl, CommandType.StoredProcedure)
        'get data ends

        If dt.Rows.Count > 0 Then
            Return Convert.ToString(dt.Rows(0)("strFirstname"))
        Else
            getlogoutCLient()
            HttpContext.Current.Response.Redirect("~/SignIn.aspx")
        End If

        Return ""

    End Function

    Shared Function getUserId() As Int32
        Dim strUserName As String = getUserName()

        'get data starts
        Dim sqlParColl(0) As SqlParameter
        sqlParColl(0) = New SqlParameter("@UserName", strUserName)

        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[UserIdByUsername]", sqlParColl, CommandType.StoredProcedure)
        'get data ends

        If dt.Rows.Count > 0 Then
            Return Convert.ToInt32(dt.Rows(0)("bintUserId"))
        Else
            getlogout()
            HttpContext.Current.Response.Redirect("~/login.aspx")
        End If

        Return 0

    End Function
    Shared Function getCustomerId() As Int32
        Dim strUserName As String = getUserName()

        'get data starts
        Dim sqlParColl(0) As SqlParameter
        sqlParColl(0) = New SqlParameter("@UserName", strUserName)

        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[CustomerIdByusername]", sqlParColl, CommandType.StoredProcedure)
        'get data ends

        If dt.Rows.Count > 0 Then
            Return Convert.ToInt32(dt.Rows(0)("groupid"))
        Else
            getlogout()
            HttpContext.Current.Response.Redirect("~/Customerlogin.aspx")
        End If

        Return 0

    End Function

#End Region


End Class
