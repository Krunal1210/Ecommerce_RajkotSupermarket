Imports System.Data

Partial Class userControls_ucPaging
    Inherits System.Web.UI.UserControl

#Region "Page Variables"
    Public strFirstUrl As String = String.Empty
    Public strLastUrl As String = String.Empty
    Public strPrevUrl As String = String.Empty
    Public strNextUrl As String = String.Empty
    Public boolHasFirst As Boolean = True
    Public boolHasLast As Boolean = True
#End Region

#Region "Page Events"

#End Region

#Region "Page Functions"
    Public Sub bindPaging(ByVal curPage As Int32, ByVal totPage As Int32)
        Dim dtPaging As New DataTable()
        dtPaging.Columns.Add("firstUrl", GetType(String))
        dtPaging.Columns.Add("prevUrl", GetType(String))
        dtPaging.Columns.Add("nextUrl", GetType(String))
        dtPaging.Columns.Add("lastUrl", GetType(String))
        dtPaging.Columns.Add("pageNo", GetType(String))
        dtPaging.Columns.Add("pageUrl", GetType(String))
        dtPaging.Columns.Add("pageClass", GetType(String))

        If totPage <= 4 Or curPage <= 4 Then

            For i As Integer = 1 To IIf(totPage > 4, 4, totPage)
                Dim drPaging = dtPaging.NewRow()

                If String.IsNullOrEmpty(Convert.ToString(Request("page"))) Then
                    If Request.QueryString.Count > 0 Then
                        strFirstUrl = Request.Url.AbsoluteUri & "&page=1"
                        strLastUrl = Request.Url.AbsoluteUri & "&page=" & totPage
                        strPrevUrl = Request.Url.AbsoluteUri & "&page=" & IIf(curPage = 1, 1, curPage - 1)
                        strNextUrl = Request.Url.AbsoluteUri & "&page=" & IIf(curPage = totPage, totPage, curPage + 1)
                    Else
                        strFirstUrl = Request.Url.AbsolutePath & "?page=1"
                        strLastUrl = Request.Url.AbsolutePath & "?page=" & totPage
                        strPrevUrl = Request.Url.AbsolutePath & "?page=" & IIf(curPage = 1, 1, curPage - 1)
                        strNextUrl = Request.Url.AbsolutePath & "?page=" & IIf(curPage = totPage, totPage, curPage + 1)
                    End If
                Else
                    Dim strPageNo As String = Convert.ToString(Request("page"))
                    strFirstUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=1")
                    strLastUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & totPage)
                    strPrevUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & IIf(curPage = 1, 1, curPage - 1))
                    strNextUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & IIf(curPage = totPage, totPage, curPage + 1))
                End If


                boolHasFirst = IIf(curPage = 1, False, True)
                boolHasLast = IIf(curPage = totPage, False, True)

                drPaging("pageNo") = i
                If String.IsNullOrEmpty(Convert.ToString(Request("page"))) Then
                    If Request.QueryString.Count > 0 Then
                        drPaging("pageUrl") = Request.Url.AbsoluteUri & "&page=" & i
                    Else
                        drPaging("pageUrl") = Request.Url.AbsolutePath & "?page=" & i
                    End If
                Else
                    Dim strPageNo As String = Convert.ToString(Request("page"))
                    drPaging("pageUrl") = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & i)
                End If

                drPaging("pageClass") = IIf(i = curPage, "number current", "number")
                dtPaging.Rows.Add(drPaging)
            Next

        Else
            Dim intCurFactor As Int32 = 1

            For index As Integer = 1 To (totPage / 4) + 1
                If curPage > index * 4 And curPage <= (index + 1) * 4 Then
                    intCurFactor = index
                    Exit For
                End If
            Next

            If totPage < (intCurFactor + 1) * 4 Then

                For i As Integer = totPage - 3 To totPage
                    Dim drPaging = dtPaging.NewRow()


                    If String.IsNullOrEmpty(Convert.ToString(Request("page"))) Then
                        If Request.QueryString.Count > 0 Then
                            strFirstUrl = Request.Url.AbsoluteUri & "&page=1"
                            strLastUrl = Request.Url.AbsoluteUri & "&page=" & totPage
                            strPrevUrl = Request.Url.AbsoluteUri & "&page=" & IIf(curPage = 1, 1, curPage - 1)
                            strNextUrl = Request.Url.AbsoluteUri & "&page=" & IIf(curPage = totPage, totPage, curPage + 1)
                        Else
                            strFirstUrl = Request.Url.AbsolutePath & "?page=1"
                            strLastUrl = Request.Url.AbsolutePath & "?page=" & totPage
                            strPrevUrl = Request.Url.AbsolutePath & "?page=" & IIf(curPage = 1, 1, curPage - 1)
                            strNextUrl = Request.Url.AbsolutePath & "?page=" & IIf(curPage = totPage, totPage, curPage + 1)
                        End If
                    Else
                        Dim strPageNo As String = Convert.ToString(Request("page"))
                        strFirstUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=1")
                        strLastUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & totPage)
                        strPrevUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & IIf(curPage = 1, 1, curPage - 1))
                        strNextUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & IIf(curPage = totPage, totPage, curPage + 1))
                    End If

                    boolHasFirst = IIf(curPage = 1, False, True)
                    boolHasLast = IIf(curPage = totPage, False, True)

                    drPaging("pageNo") = i

                    If String.IsNullOrEmpty(Convert.ToString(Request("page"))) Then
                        If Request.QueryString.Count > 0 Then
                            drPaging("pageUrl") = Request.Url.AbsoluteUri & "&page=" & i
                        Else
                            drPaging("pageUrl") = Request.Url.AbsolutePath & "?page=" & i
                        End If
                    Else
                        Dim strPageNo As String = Convert.ToString(Request("page"))
                        drPaging("pageUrl") = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & i)
                    End If

                    drPaging("pageClass") = IIf(i = curPage, "number current", "number")

                    dtPaging.Rows.Add(drPaging)
                Next

            Else

                For i As Integer = (intCurFactor * 4) + 1 To (intCurFactor + 1) * 4
                    Dim drPaging = dtPaging.NewRow()

                    If String.IsNullOrEmpty(Convert.ToString(Request("page"))) Then
                        If Request.QueryString.Count > 0 Then
                            strFirstUrl = Request.Url.AbsoluteUri & "&page=1"
                            strLastUrl = Request.Url.AbsoluteUri & "&page=" & totPage
                            strPrevUrl = Request.Url.AbsoluteUri & "&page=" & curPage - 1
                            strNextUrl = Request.Url.AbsoluteUri & "&page=" & IIf(curPage = totPage, totPage, curPage + 1)
                        Else
                            strFirstUrl = Request.Url.AbsolutePath & "?page=1"
                            strLastUrl = Request.Url.AbsolutePath & "?page=" & totPage
                            strPrevUrl = Request.Url.AbsolutePath & "?page=" & curPage - 1
                            strNextUrl = Request.Url.AbsolutePath & "?page=" & IIf(curPage = totPage, totPage, curPage + 1)
                        End If
                    Else
                        Dim strPageNo As String = Convert.ToString(Request("page"))
                        strFirstUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=1")
                        strLastUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & totPage)
                        strPrevUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & curPage - 1)
                        strNextUrl = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & IIf(curPage = totPage, totPage, curPage + 1))
                    End If


                    boolHasFirst = IIf(curPage = 1, False, True)
                    boolHasLast = IIf(curPage = totPage, False, True)

                    drPaging("pageNo") = i

                    If String.IsNullOrEmpty(Convert.ToString(Request("page"))) Then
                        If Request.QueryString.Count > 0 Then
                            drPaging("pageUrl") = Request.Url.AbsoluteUri & "&page=" & i
                        Else
                            drPaging("pageUrl") = Request.Url.AbsolutePath & "?page=" & i
                        End If
                    Else
                        Dim strPageNo As String = Convert.ToString(Request("page"))
                        drPaging("pageUrl") = Request.Url.AbsoluteUri.Replace("page=" & strPageNo, "page=" & i)
                    End If

                    drPaging("pageClass") = IIf(i = curPage, "number current", "number")

                    dtPaging.Rows.Add(drPaging)
                Next

            End If

        End If

        rptPaging.DataSource = dtPaging
        rptPaging.DataBind()

    End Sub
#End Region

End Class
