Imports System.Data
Imports System.Data.SqlClient

Partial Class admin_SchoolModify
    Inherits System.Web.UI.Page

#Region "Declarations"

#End Region

#Region "Page Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            bindPageDropdowns()
            Try

                If (Not String.IsNullOrEmpty(Convert.ToString(Request("id")))) And Convert.ToInt32(Request("id")) > 0 Then
                    bindPage()
                End If
            Catch ex As Exception
            End Try

        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click



        Try
            'add/edit starts
            Dim sqlParColl(10) As SqlParameter
            sqlParColl(0) = New SqlParameter("@bintMenuId", Convert.ToInt64(hdnMenuId.Value))
            sqlParColl(1) = New SqlParameter("@bintPageId", Convert.ToInt64(drpPage.SelectedValue))
            sqlParColl(2) = New SqlParameter("@isOnTopMenu", chkIsOnTopMenu.Checked)

            If drpTopMenuParId.SelectedValue = "0" Then
                sqlParColl(3) = New SqlParameter("@bintTopMenuParId", DBNull.Value)
            Else
                sqlParColl(3) = New SqlParameter("@bintTopMenuParId", Convert.ToInt64(drpTopMenuParId.SelectedValue))
            End If

            sqlParColl(4) = New SqlParameter("@intTopMenuOrder", Convert.ToInt32(txtTopMenuOrder.Text.Trim))
            sqlParColl(5) = New SqlParameter("@isOnPageBottom", chkIsOnPageBottom.Checked)
            sqlParColl(6) = New SqlParameter("@intBottomMenuOrder", Convert.ToInt32(txtPageBottomOrder.Text.Trim))
            sqlParColl(7) = New SqlParameter("@isOnHomePage", chkIsOnHomePage.Checked)

            If drpHomeMenuParent.SelectedValue = "0" Then
                sqlParColl(8) = New SqlParameter("@bintHomePageParId", DBNull.Value)
            Else
                sqlParColl(8) = New SqlParameter("@bintHomePageParId", Convert.ToInt64(drpHomeMenuParent.SelectedValue))
            End If

            sqlParColl(9) = New SqlParameter("@intHomePageOrder", Convert.ToInt32(txtHomePageOrder.Text.Trim))
            sqlParColl(10) = New SqlParameter("@intRetVal", 0)
            sqlParColl(10).Direction = ParameterDirection.Output


            sqlHelper.executeNonQuery("[dbo].[MenuModify]", sqlParColl, CommandType.StoredProcedure)
            'add/edit ends

            If sqlParColl(10).Value <> "0" Then
                app.msgError(divMsg, "Same page is already in use. Please select new page.")
            Else
                If hdnMenuId.Value <> "0" Then
                    app.msgSuccess(divMsg, "Menu updated successfully.")
                Else
                    app.msgSuccess(divMsg, "Menu inserted successfully.")
                    clear()
                End If
            End If

        Catch ex As Exception
            app.msgError(divMsg, ex.Message)
        End Try

    End Sub

    Protected Sub chkIsOnTopMenu_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkIsOnTopMenu.CheckedChanged
        trTopMenuParent.Visible = chkIsOnTopMenu.Checked
        trTopMenuOrder.Visible = chkIsOnTopMenu.Checked
    End Sub

    Protected Sub chkIsOnPageBottom_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkIsOnPageBottom.CheckedChanged
        trPageBottomOrder.Visible = chkIsOnPageBottom.Checked
    End Sub

    Protected Sub chkIsOnHomePage_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkIsOnHomePage.CheckedChanged
        trHomePageMenuParent.Visible = chkIsOnHomePage.Checked
        trHomePageOrder.Visible = chkIsOnHomePage.Checked
    End Sub

#End Region

#Region "Functions"

    Private Sub bindPage()

        'get data starts
        Dim sqlParColl(0) As SqlParameter
        sqlParColl(0) = New SqlParameter("@bintMenuId", Convert.ToInt32(Request("id")))
        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[MenuListAdmin]", sqlParColl, CommandType.StoredProcedure)
        'get data ends

        If dt.Rows.Count > 0 Then

            drpPage.SelectedValue = Convert.ToString(dt.Rows(0)("bintPageId"))

            chkIsOnTopMenu.Checked = Convert.ToBoolean(dt.Rows(0)("isOnTopMenu"))
            trTopMenuParent.Visible = Convert.ToBoolean(dt.Rows(0)("isOnTopMenu"))
            trTopMenuOrder.Visible = Convert.ToBoolean(dt.Rows(0)("isOnTopMenu"))
            drpTopMenuParId.SelectedValue = Convert.ToString(dt.Rows(0)("bintTopMenuParId"))
            txtTopMenuOrder.Text = Convert.ToString(dt.Rows(0)("intTopMenuOrder"))

            chkIsOnPageBottom.Checked = Convert.ToBoolean(dt.Rows(0)("isOnPageBottom"))
            trPageBottomOrder.Visible = Convert.ToBoolean(dt.Rows(0)("isOnPageBottom"))
            txtPageBottomOrder.Text = Convert.ToString(dt.Rows(0)("intBottomMenuOrder"))

            chkIsOnHomePage.Checked = Convert.ToBoolean(dt.Rows(0)("isOnHomePage"))
            trHomePageMenuParent.Visible = Convert.ToBoolean(dt.Rows(0)("isOnHomePage"))
            trHomePageOrder.Visible = Convert.ToBoolean(dt.Rows(0)("isOnHomePage"))
            drpHomeMenuParent.SelectedValue = Convert.ToString(dt.Rows(0)("bintHomePageParId"))
            txtHomePageOrder.Text = Convert.ToString(dt.Rows(0)("intHomePageOrder"))

            hdnMenuId.Value = Convert.ToString(dt.Rows(0)("bintMenuId"))

            h2Title.InnerHtml = "Edit Menu"

        End If

    End Sub

    Private Sub bindPageDropdowns()

        Dim dtPage As DataTable = sqlHelper.getDataTable("PageListDropdown", CommandType.StoredProcedure)


        drpPage.DataSource = dtPage
        drpPage.DataBind()
        drpPage.Items.Insert(0, New ListItem("Select Page", "-1"))


        Dim dtTopMenu As DataTable = sqlHelper.getDataTable("TopMenuParentDropdown", CommandType.StoredProcedure)
        drpTopMenuParId.DataSource = dtTopMenu
        drpTopMenuParId.DataBind()
        drpTopMenuParId.Items.Insert(0, New ListItem("Root", "0"))


        Dim dtHomeMenu As DataTable = sqlHelper.getDataTable("[HomePageMenuParentDropdown]", CommandType.StoredProcedure)
        drpHomeMenuParent.DataSource = dtHomeMenu
        drpHomeMenuParent.DataBind()
        drpHomeMenuParent.Items.Insert(0, New ListItem("Root", "0"))

    End Sub



    Private Sub clear()
        ClearData.clearAllTextBox(pnlData)
        ClearData.clearAllDropdownSelection(pnlData)

        chkIsOnHomePage.Checked = False
        chkIsOnPageBottom.Checked = False
        chkIsOnTopMenu.Checked = False

        trTopMenuParent.Visible = False
        trTopMenuOrder.Visible = False

        trPageBottomOrder.Visible = False

        trHomePageMenuParent.Visible = False
        trHomePageOrder.Visible = False

        bindPageDropdowns()

    End Sub

#End Region



End Class
