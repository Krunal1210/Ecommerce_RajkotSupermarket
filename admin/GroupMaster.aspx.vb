Imports System.Data
Imports System.Data.SqlClient



Partial Class admin_SchoolList
    Inherits System.Web.UI.Page

#Region "Declarations"
 
#End Region

#Region "Page events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            If String.IsNullOrEmpty(Convert.ToString(Request("id"))) Then
                divList.Visible = True
                divModify.Visible = False

            Else
                divList.Visible = False
                divModify.Visible = True

                bindEditPage()

            End If

        End If

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click


        Try

            Dim sqlPar(1) As SqlParameter
            sqlPar(0) = New SqlParameter("@bintGroupId", Convert.ToInt32(Convert.ToString(Request("id"))))
            sqlPar(1) = New SqlParameter("@strGroupName", txtName.Text.Trim())


            sqlHelper.executeNonQuery("[dbo].[GroupMstrModify]", sqlPar, CommandType.StoredProcedure)

            If Convert.ToInt32(Convert.ToString(Request("id"))) > 0 Then
                msgSuccess(ltrlMsg, "Group is updated sucessfully")
            Else
                msgSuccess(ltrlMsg, "Group is inserted sucessfully")
                clear()
            End If

        Catch ex As Exception
            msgError(ltrlMsg, "Some error occured. Error MSg: '" + ex.Message + "'")
        End Try


    End Sub

    Protected Sub btnAction_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim drpAct As DropDownList = CType(ListView1.FindControl("drpActions"), DropDownList)
        Dim hdnVal As HiddenField = CType(ListView1.FindControl("hdnChk"), HiddenField)
        GeneralOpration("tblGroupMstr", "bintGroupId", hdnVal.Value.Trim(","), drpAct.SelectedValue)
        hdnVal.Value = ""
        ListView1.DataBind()
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click

        divSearch.Style.Item("display") = "block"

        Try
            Dim dp As DataPager
            dp = ListView1.FindControl("DataPager1")
            If Not dp Is Nothing Then
                dp.PageSize = 9999999
            End If
        Catch ex As Exception

        End Try

        SqlDataSource1.FilterExpression = "strGroupName LIKE '%" & txtSearchName.Text.Trim() & "%'"

    End Sub

    Protected Sub btnReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReset.Click

        Try
            Dim dp As DataPager
            dp = ListView1.FindControl("DataPager1")
            If Not dp Is Nothing Then

                Try
                    Dim drpPageSize As DropDownList
                    drpPageSize = ListView1.FindControl("drpPageSize")

                    If Not drpPageSize Is Nothing Then
                        dp.PageSize = drpPageSize.SelectedValue
                    Else
                        dp.PageSize = 10
                    End If

                Catch ex As Exception
                    dp.PageSize = 10
                End Try

            End If
        Catch ex As Exception

        End Try


        SqlDataSource1.FilterExpression = ""
        ListView1.DataBind()
        txtSearchName.Text = ""
    End Sub



    Protected Sub changePageSize(ByVal sender As Object, ByVal e As System.EventArgs)

        Try
            Dim dp As DataPager
            dp = ListView1.FindControl("DataPager1")
            If Not dp Is Nothing Then

                Try
                    Dim drpPageSize As DropDownList
                    drpPageSize = ListView1.FindControl("drpPageSize")

                    If Not drpPageSize Is Nothing Then
                        dp.PageSize = drpPageSize.SelectedValue
                    End If

                Catch ex As Exception
                    dp.PageSize = 10
                End Try

            End If
        Catch ex As Exception

        End Try

    End Sub



#End Region


#Region "Functions"



    Private Sub bindEditPage()

        Try

            If Convert.ToInt32(Request("id")) > 0 Then

                Dim sqlPar(0) As SqlParameter
                sqlPar(0) = New SqlParameter("@bintGroupId", Convert.ToString(Request("id")))

                Dim dtCur As DataTable = getDataTable("GroupMstrList", sqlPar, CommandType.StoredProcedure)

                If dtCur.Rows.Count > 0 Then
                    txtName.Text = Convert.ToString(dtCur.Rows(0)("strGroupName"))
                End If

            End If

        Catch ex As Exception

        End Try

    End Sub

    Private Sub clear()
        clearAllTextBox(pnlData)
    End Sub

#End Region



#Region "Data & Utility Related Functions"


    Sub executeNonQuery(ByVal cmdName As String, ByVal cmpPar As SqlParameter(), ByVal cmdType As CommandType)

        Dim sqlConnstr As String = ConfigurationManager.ConnectionStrings("OnlineGroceryConnectionString").ConnectionString
        Dim sqlConn As New SqlConnection(sqlConnstr)

        Dim sqlCmd = sqlConn.CreateCommand()
        sqlCmd.CommandText = cmdName
        sqlCmd.CommandType = cmdType

        Try
            For Each par As SqlParameter In cmpPar
                sqlCmd.Parameters.Add(par)
            Next
        Catch ex As Exception
        End Try

        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

    End Sub



    Function getDataTable(ByVal cmdName As String, ByVal cmpPar As SqlParameter(), ByVal cmdType As CommandType) As DataTable
        Dim sqlConnstr As String = ConfigurationManager.ConnectionStrings("OnlineGroceryConnectionString").ConnectionString
        Dim sqlConn As New SqlConnection(sqlConnstr)

        Dim sqlCmd = sqlConn.CreateCommand()
        sqlCmd.CommandText = cmdName
        sqlCmd.CommandType = cmdType

        Try
            For Each par As SqlParameter In cmpPar
                sqlCmd.Parameters.Add(par)
            Next
        Catch ex As Exception
        End Try

        Dim dt As New DataTable

        Dim da As New SqlDataAdapter(sqlCmd)
        sqlConn.Open()
        da.Fill(dt)
        sqlConn.Close()

        Return dt

    End Function

    Function getDatatable(ByVal cmdName As String, ByVal cmdType As CommandType) As DataTable
        Dim sqlConnstr As String = ConfigurationManager.ConnectionStrings("OnlineGroceryConnectionString").ConnectionString
        Dim sqlConn As New SqlConnection(sqlConnstr)

        Dim sqlCmd = sqlConn.CreateCommand()
        sqlCmd.CommandText = cmdName
        sqlCmd.CommandType = cmdType

        Dim dt As New DataTable

        Dim da As New SqlDataAdapter(sqlCmd)
        sqlConn.Open()
        da.Fill(dt)
        sqlConn.Close()

        Return dt

    End Function


    Sub msgError(ByVal divMsg As Literal, ByVal strMsg As String)
        divMsg.Text = "<div class='message errormsg'><p> " + strMsg + " </p> </div>"
    End Sub

    Sub msgSuccess(ByVal divMsg As Literal, ByVal strMsg As String)
        divMsg.Text = "<div class='message success'><p> " + strMsg + " </p> </div>"
    End Sub

    Sub msgInformation(ByVal divMsg As Literal, ByVal strMsg As String)
        divMsg.Text = "<div class='message info'><p> " + strMsg + " </p> </div>"
    End Sub

    Sub msgWarning(ByVal divMsg As Literal, ByVal strMsg As String)
        divMsg.Text = "<div class='message warning'><p> " + strMsg + " </p> </div>"
    End Sub

    Sub msgClear(ByVal divMsg As Literal)
        divMsg.Text = ""
    End Sub

    Sub GeneralOpration(ByVal strTblName As String, ByVal strPKName As String, ByVal strIDName As String, ByVal strOprType As String)
        'execute query starts
        Dim sqlParColl(3) As SqlParameter
        sqlParColl(0) = New SqlParameter("@strTblName", strTblName)
        sqlParColl(1) = New SqlParameter("@strPKName", strPKName)
        sqlParColl(2) = New SqlParameter("@strIDName", strIDName)
        sqlParColl(3) = New SqlParameter("@strOprType", strOprType)

        executeNonQuery("[dbo].[GeneralOperations]", sqlParColl, CommandType.StoredProcedure)
        'execute query ends
    End Sub


    Sub clearAllTextBox(ByVal tblContain As Panel)
        For Each ctrl As Control In tblContain.Controls
            If ctrl.GetType Is GetType(TextBox) Then
                Try
                    Dim cntTxtBox As TextBox = CType(ctrl, TextBox)
                    cntTxtBox.Text = ""
                Catch ex As Exception

                End Try
            End If
        Next
    End Sub

    Sub clearAllDropdownSelection(ByVal tblContain As Panel)
        For Each ctrl As Control In tblContain.Controls
            If ctrl.GetType Is GetType(DropDownList) Then
                Try
                    Dim cntDropDown As DropDownList = CType(ctrl, DropDownList)
                    cntDropDown.ClearSelection()
                Catch ex As Exception

                End Try
            End If
        Next
    End Sub


    Sub clearAllDropdownData(ByVal tblContain As Panel)
        For Each ctrl As Control In tblContain.Controls
            If ctrl.GetType Is GetType(DropDownList) Then
                Try
                    Dim cntDropDown As DropDownList = CType(ctrl, DropDownList)
                    cntDropDown.Items.Clear()
                Catch ex As Exception

                End Try
            End If
        Next
    End Sub

    Sub clearAllCheckbox(ByVal tblContain As Panel)
        For Each ctrl As Control In tblContain.Controls
            If ctrl.GetType Is GetType(CheckBox) Then
                Try
                    Dim cntCheckbox As CheckBox = CType(ctrl, CheckBox)
                    cntCheckbox.Checked = False
                Catch ex As Exception

                End Try
            End If
        Next
    End Sub

#End Region




End Class
