
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Public Partial Class Admin_LotList
	Inherits System.Web.UI.Page

	#Region "Page Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If Not IsPostBack Then

            bindData()


        End If

    End Sub


	Protected Sub changePageSize(sender As Object, e As EventArgs)
		Try
			Dim dp As DataPager = DirectCast(ListView1.FindControl("DataPager1"), DataPager)

			If dp IsNot Nothing Then

				Try
					Dim drpPageSize As DropDownList = DirectCast(ListView1.FindControl("drpPageSize"), DropDownList)

					If drpPageSize IsNot Nothing Then
						dp.PageSize = Convert.ToInt32(drpPageSize.SelectedValue)

					End If
				Catch generatedExceptionName As Exception
					dp.PageSize = 10

				End Try
			End If
		Catch generatedExceptionName As Exception
		End Try

	End Sub

    'Protected Sub btnSearch_Click(sender As Object, e As EventArgs)

    '	divSearch.Style("display") = "block"
    '	Try
    '		Dim dp As DataPager = DirectCast(ListView1.FindControl("DataPager1"), DataPager)

    '		If dp IsNot Nothing Then
    '			dp.PageSize = 9999999

    '		End If
    '	Catch generatedExceptionName As Exception
    '	End Try

    '       Dim strQry As String = "1=1 "

    '       If txtCust.Text <> "" Then
    '           strQry += " And strUserName like '%" & txtCust.Text.Trim() & "%'"
    '       End If

    '       If txtCity.Text <> "" Then
    '           strQry += " And City like '%" & txtCity.Text.Trim() & "%'"
    '       End If
    '       If txtOrderNo.Text <> "" Then
    '           strQry += " And strSessionId like '%" & txtOrderNo.Text.Trim() & "%'"
    '       End If
    '       If dpdPayment.SelectedValue <> "0" Then
    '           strQry += " And PaymentOption like '%" & dpdPayment.SelectedValue & "%'"
    '       End If
    '       SqlDataSource1.FilterExpression = strQry
    '       ListView1.DataBind()

    'End Sub


    Protected Sub btnAction_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim drpAct As DropDownList = DirectCast(ListView1.FindControl("drpActions"), DropDownList)
        Dim hdnVal As HiddenField = DirectCast(ListView1.FindControl("hdnChk"), HiddenField)

        If drpAct.SelectedValue = "Delete" Then
            app.GeneralOpration("dbo.tblOrderDtl", "bintOrderId", hdnVal.Value.Trim(","c), drpAct.SelectedValue)
        End If
        app.GeneralOpration("dbo.tblOrder", "bintOrderId", hdnVal.Value.Trim(","c), drpAct.SelectedValue)

        hdnVal.Value = ""
        ListView1.DataBind()
    End Sub

    'Protected Sub btnReset_Click(sender As Object, e As EventArgs)

    '	Try
    '		Dim dp As DataPager = DirectCast(ListView1.FindControl("DataPager1"), DataPager)

    '		If dp IsNot Nothing Then
    '			Try
    '				Dim drpPageSize As DropDownList = DirectCast(ListView1.FindControl("drpPageSize"), DropDownList)

    '				If drpPageSize IsNot Nothing Then
    '					dp.PageSize = Convert.ToInt32(drpPageSize.SelectedValue)
    '				Else
    '					dp.PageSize = 10
    '				End If
    '			Catch generatedExceptionName As Exception
    '				dp.PageSize = 10
    '			End Try
    '		End If
    '	Catch generatedExceptionName As Exception
    '	End Try

    '	SqlDataSource1.FilterExpression = ""
    '	ListView1.DataBind()
    '       txtCity.Text = ""
    '       txtCust.Text = ""
    '       txtOrderNo.Text = ""
    '       dpdPayment.ClearSelection()

    'End Sub

	#End Region



    Protected Sub btnSearch_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        divSearch.Style("display") = "block"
        Try
            Dim dp As DataPager = DirectCast(ListView1.FindControl("DataPager1"), DataPager)

            If dp IsNot Nothing Then
                dp.PageSize = 9999999

            End If
        Catch generatedExceptionName As Exception
        End Try

        Dim strQry As String = "1=1 "

        If txtCust.Text <> "" Then
            strQry += " And strUserName like '%" & txtCust.Text.Trim() & "%'"
        End If

        If txtCity.Text <> "" Then
            strQry += " And City like '%" & txtCity.Text.Trim() & "%'"
        End If
        If txtOrderNo.Text <> "" Then
            strQry += " And strSessionId like '%" & txtOrderNo.Text.Trim() & "%'"
        End If
        If dpdPayment.SelectedValue <> "0" Then
            strQry += " And PaymentOption like '%" & dpdPayment.SelectedValue & "%'"
        End If
        SqlDataSource1.FilterExpression = strQry
        ListView1.DataBind()
    End Sub

    Protected Sub btnReset_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReset.Click
        Try
            Dim dp As DataPager = DirectCast(ListView1.FindControl("DataPager1"), DataPager)

            If dp IsNot Nothing Then
                Try
                    Dim drpPageSize As DropDownList = DirectCast(ListView1.FindControl("drpPageSize"), DropDownList)

                    If drpPageSize IsNot Nothing Then
                        dp.PageSize = Convert.ToInt32(drpPageSize.SelectedValue)
                    Else
                        dp.PageSize = 10
                    End If
                Catch generatedExceptionName As Exception
                    dp.PageSize = 10
                End Try
            End If
        Catch generatedExceptionName As Exception
        End Try

        SqlDataSource1.FilterExpression = ""
        ListView1.DataBind()
        txtCity.Text = ""
        txtCust.Text = ""
        txtOrderNo.Text = ""
        dpdPayment.ClearSelection()

    End Sub

    Private Sub bindData()
        divSearch.Style("display") = "block"
        Try
            Dim dp As DataPager = DirectCast(ListView1.FindControl("DataPager1"), DataPager)

            If dp IsNot Nothing Then
                dp.PageSize = 9999999

            End If
        Catch generatedExceptionName As Exception
        End Try

        Dim strQry As String = "1=1 "

        If txtCust.Text <> "" Then
            strQry += " And strUserName like '%" & txtCust.Text.Trim() & "%'"
        End If

        If txtCity.Text <> "" Then
            strQry += " And City like '%" & txtCity.Text.Trim() & "%'"
        End If
        If txtOrderNo.Text <> "" Then
            strQry += " And strSessionId like '%" & txtOrderNo.Text.Trim() & "%'"
        End If
        If dpdPayment.SelectedValue <> "0" Then
            strQry += " And PaymentOption like '%" & dpdPayment.SelectedValue & "%'"
        End If

        If Convert.ToString(Request.QueryString("Mode")) = "S" Then
            SqlDataSource1.FilterExpression = strQry
            ListView1.DataSourceID = "SqlDataSource1"
            ListView1.DataBind()
           
            lblTile.InnerHtml = "View / Delete Success Orders"
        Else
            SqlDataSource2.FilterExpression = strQry
            ListView1.DataSourceID = "SqlDataSource2"
            ListView1.DataBind()
           
            lblTile.InnerHtml = "View / Delete Fail Orders"
        End If
    End Sub

End Class

'=======================================================
'Service provided by Telerik (www.telerik.com)
'Conversion powered by NRefactory.
'Twitter: @telerik, @toddanglin
'Facebook: facebook.com/telerik
'=======================================================
