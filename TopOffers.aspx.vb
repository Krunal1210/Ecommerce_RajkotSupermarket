﻿Imports System.Data
Imports System.Data.SqlClient
Partial Class Category
    Inherits System.Web.UI.Page


    Protected Sub ListView1_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim currentPage As Integer = (DataPager1.StartRowIndex / DataPager1.PageSize) + 1
        Dim totalPages As Integer = (DataPager1.TotalRowCount / DataPager1.PageSize) + 1
        'spnCurent.InnerHtml = Convert.ToString(currentPage)
        'spnLast.InnerHtml = Convert.ToString(totalPages)
        'spnFirst1.InnerHtml = Convert.ToString(currentPage)
        'spnLast1.InnerHtml = Convert.ToString(totalPages)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Not String.IsNullOrEmpty(Convert.ToString(Request("oid"))) Then
                bindData1()
            Else
                'bindData()
            End If


        End If
    End Sub

    
    Private Sub bindData1()

        Dim sqlpar(0) As SqlParameter
        sqlpar(0) = New SqlParameter("@oid", Convert.ToString(Request("oid")))
        Dim dt As DataTable = sqlHelper.getDataTable("[ProductListByTopXSectionIdfront]", sqlpar, CommandType.StoredProcedure)

        If dt.Rows.Count > 0 Then
            'ListView1.DataSource = dt
            'ListView1.DataBind()


            h2Header.InnerHtml = Convert.ToString(Request("offer")) & " (" & dt.Rows.Count & ")"
            liMain.InnerHtml = "<a href=""http://rajkotsupermarket.com/Categories/" & dt.Rows(0)("DivURL") & """>" & dt.Rows(0)("DivNm") & "</a>"
            liSub.InnerHtml = "<a href=""http://rajkotsupermarket.com/Category/" & dt.Rows(0)("SecUrl") & """>" & dt.Rows(0)("SecNm") & "</a>"
            lisubSub.InnerHtml = dt.Rows(0)("DepNm")
            Page.Title = Convert.ToString(Request("offer")) & ", " & " - Rajkot Supermarket"
            ltrlMeta.Text = " <meta name=""keywords"" content="" online Rajkot Supermarket, online grocery shopping Rajkot,buy food online, online grocery, grocery online, online grocery shopping, online grocery store,, online grocery shopping india, buy groceries online, online vegetable store, food shopping online""/><meta name=""description"" content=""Buy " & Convert.ToString(Request("offer")) & "  Online in Rajkot, Gujarat, India. All types of " & Convert.ToString(Request("offer")) & " are available here at the best prices. Buy " & Convert.ToString(Request("offer")) & " online at our online Rajkot Supermarket."" />"
        End If
        Dim sqlpar2(0) As SqlParameter
        sqlpar2(0) = New SqlParameter("@oid", Convert.ToString(Request("oid")))
        Dim dt2 As DataTable = sqlHelper.getDataTable("[BrandListByTopXSectionId]", sqlpar2, CommandType.StoredProcedure)
        If dt2.Rows.Count > 0 Then
            CheckBoxList1.DataSource = dt2
            CheckBoxList1.DataBind()
        End If
    End Sub
    Protected Sub ChkboxCat_CLick(sender As Object, e As EventArgs)



        Dim strcat As String = "("







        
        If strcat = "(" Then
            strcat = strcat.TrimEnd("("c)




            For Each item As ListItem In CheckBoxList1.Items
                If item.Selected Then
                    strcat = (strcat & Convert.ToString(" brandid= ")) + item.Value + " or"
                End If
            Next


            ' strcat = strcat.TrimEnd('"');
            strcat = strcat.TrimEnd("r"c)
            strcat = strcat.TrimEnd("o"c)
        Else
            strcat = strcat.TrimEnd("r"c)
            strcat = strcat.TrimEnd("o"c)


            strcat = strcat & Convert.ToString(" ) And (")

            Dim strnew As String = ""
            For Each item As ListItem In CheckBoxList1.Items
                If item.Selected Then
                    strnew = (strnew & Convert.ToString(" brandid= ")) + item.Value + " or"
                End If
            Next

            If strnew = "" Then
                strcat = strcat.TrimEnd("("c)
                strcat = strcat.TrimEnd(" "c)
                strcat = strcat.TrimEnd("d"c)
                strcat = strcat.TrimEnd("n"c)
                strcat = strcat.TrimEnd("A"c)
            Else
                strnew = strnew.TrimEnd("r"c)
                strnew = strnew.TrimEnd("o"c)
                strnew = strnew & Convert.ToString(" ) ")
                strcat = strcat & strnew






            End If




        End If




        '  Page.Title = "Categories | Books For You"
        SqlDataSource2.FilterExpression = strcat
        ListView1.DataBind()

    End Sub
End Class
