Imports System.Data
Imports System.Data.SqlClient



Partial Class admin_SchoolList
    Inherits System.Web.UI.Page

#Region "Declarations"

#End Region

#Region "Page events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            'bindCategoryDrpDn()
            bindGroup()
        End If

    End Sub


    Protected Sub drpGrpSel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpGrpSel.SelectedIndexChanged

        bindSection()
        '  bindSectionBanner()

    End Sub

    Protected Sub lnkAddproduct_ShowPopup(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim lnkShowPopup As LinkButton = CType(sender, LinkButton)
        If Not lnkShowPopup Is Nothing Then

            Dim strSecName As String = lnkShowPopup.CommandName
            Dim intSecId As Int32 = lnkShowPopup.CommandArgument

            h2AddproductPopup.InnerText = "Add product for " + strSecName + " Section."
            hdnSecIdPopup.Value = intSecId
            txtAddproductOrder.Text = ""
            txtAddproductPopup.Text = ""
            mpeproductAdd.Show()

        End If

    End Sub

    Protected Sub lnkAddBanner_ShowPopup(ByVal sender As Object, ByVal e As System.EventArgs)

        mpeBannerAdd.Show()

    End Sub


    Protected Sub lnkDeleteproduct(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim lnkShowPopup As LinkButton = CType(sender, LinkButton)
        If Not lnkShowPopup Is Nothing Then

            Dim intproductSecGrpId As Int32 = lnkShowPopup.CommandArgument
            Dim sqlPar(0) As SqlParameter
            sqlPar(0) = New SqlParameter("@bintGrpSecbintproductid", intproductSecGrpId)

            executeNonQuery("[dbo].[Group_Sectio_product_Delete]", sqlPar, CommandType.StoredProcedure)

            bindSection()

        End If


    End Sub
    Protected Sub lnkEditproduct(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim lnkShowPopup As LinkButton = CType(sender, LinkButton)
        If Not lnkShowPopup Is Nothing Then

            Dim hdnSectionId As HiddenField = DirectCast(lnkShowPopup.FindControl("hdnId"), HiddenField)

            Dim intproductSecGrpId As Int32 = lnkShowPopup.CommandArgument
            hdnproductSectiD.Value = intproductSecGrpId
            mpeproductAdd.Show()
            Dim sqlPar(0) As SqlParameter
            sqlPar(0) = New SqlParameter("@bintGrpSecbintproductid", intproductSecGrpId)

            Dim dt As DataTable = sqlHelper.getDataTable("[SectionEditproductlist]", sqlPar, CommandType.StoredProcedure)

            txtAddproductPopup.Text = dt.Rows(0)("strproname")
            hdnbintproductidPopup.Value = dt.Rows(0)("bintproductid")
            txtAddproductOrder.Text = dt.Rows(0)("intOrder")
            h2AddproductPopup.InnerHtml = "Edit product"

            hdnSecIdPopup.Value = hdnSectionId.Value

            ' bindSection()

        End If


    End Sub


    Protected Sub lnkDeleteBanner(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim lnkShowPopup As LinkButton = CType(sender, LinkButton)
        If Not lnkShowPopup Is Nothing Then

            Dim intGrpBannerId As Int32 = lnkShowPopup.CommandArgument
            Dim sqlPar(0) As SqlParameter
            sqlPar(0) = New SqlParameter("@bintGroupBannerId", intGrpBannerId)

            executeNonQuery("[dbo].[Group_Banner_Delete]", sqlPar, CommandType.StoredProcedure)

            bindSectionBanner()

        End If

    End Sub



    Protected Sub btnBannerAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBannerAdd.Click

        Dim spar(8) As SqlParameter
        spar(0) = New SqlParameter("@bintGroupBannerId", hdnGroupBannerId.Value)
        spar(1) = New SqlParameter("@bintGroupId", drpGrpSel.SelectedValue)
        spar(2) = New SqlParameter("@strBannerName", txtBannerPopupName.Text.Trim())

        Dim strBannerFile As String = ""
        If fupBannerImage.HasFile And app.isImage(IO.Path.GetExtension(fupBannerImage.PostedFile.FileName)) Then

            strBannerFile = DateTime.Now.Ticks.ToString() + IO.Path.GetExtension(fupBannerImage.PostedFile.FileName)
            fupBannerImage.PostedFile.SaveAs(Server.MapPath("~/userFiles/imgBannerFiles/") + strBannerFile)

        End If

        spar(3) = New SqlParameter("@strBannerImage", strBannerFile)
        spar(4) = New SqlParameter("@strBannerDesc", txtBannerPopupDesc.Text.Trim())
        spar(6) = New SqlParameter("@intOrder", txtBannerPopupOrder.Text.Trim())

        Dim IsCat As Boolean = False
        If radCatBannerList.SelectedValue = "cat" Then
            IsCat = True
        End If

        spar(7) = New SqlParameter("@bitIsCategory", IsCat)

        If (IsCat) Then
            spar(5) = New SqlParameter("@CategoryId", drpBannerPopupCategory.SelectedValue)
            spar(8) = New SqlParameter("@strUrl", DBNull.Value)
        Else
            spar(5) = New SqlParameter("@CategoryId", DBNull.Value)
            spar(8) = New SqlParameter("@strUrl", txtBannerUrl.Text.Trim())
        End If


        sqlHelper.executeNonQuery("[dbo].[Group_Banner_Modify]", spar, CommandType.StoredProcedure)


        '        app.msgSucess(ltrlMsgGrpBanner, "Banner is added sucessfully.")

        txtBannerPopupDesc.Text = ""
        txtBannerPopupName.Text = ""
        txtBannerPopupOrder.Text = ""
        drpBannerPopupCategory.ClearSelection()

        bindSectionBanner()

    End Sub

    Protected Sub lnkCloseGroupBanner_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCloseGroupBanner.Click
        mpeBannerAdd.Hide()
        bindSectionBanner()
    End Sub

    Protected Sub rptSectionList_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rptSectionList.ItemDataBound

        Dim item As RepeaterItem = e.Item
        If (item.ItemType = ListItemType.Item Or item.ItemType = ListItemType.AlternatingItem) Then

            Dim hdnSecId As HiddenField = CType(item.FindControl("hdnFldSecId"), HiddenField)
            If Not hdnSecId Is Nothing Then
                Dim intSecId As Int32 = hdnSecId.Value

                Dim sqlPar(1) As SqlParameter
                sqlPar(0) = New SqlParameter("@bintSectionId", hdnSecId.Value)
                sqlPar(1) = New SqlParameter("@bintGroupId", drpGrpSel.SelectedValue)

                Dim dtproductBySec As DataTable = getDataTable("[dbo].[productListFromSectionId]", sqlPar, CommandType.StoredProcedure)

                Dim rptNest As Repeater = item.FindControl("rptSectionproducts")
                rptNest.DataSource = dtproductBySec
                rptNest.DataBind()

            End If

        End If

    End Sub


    Protected Sub txtAddproductPopup_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtAddproductPopup.TextChanged

        Dim sPar(0) As SqlParameter
        sPar(0) = New SqlParameter("@strproname", txtAddproductPopup.Text)

        Dim dt As DataTable = getDataTable("[dbo].[bintproductidByName]", sPar, CommandType.StoredProcedure)
        If dt.Rows.Count > 0 Then
            hdnbintproductidPopup.Value = dt.Rows(0)("bintproductid")
        Else
            txtAddproductPopup.Text = ""
        End If

        mpeproductAdd.Show()
    End Sub

    Protected Sub btnSavePopup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSavePopup.Click


        Try
            Dim sqlPar(3) As SqlParameter
            sqlPar(0) = New SqlParameter("@bintGroupId", drpGrpSel.SelectedValue)
            sqlPar(1) = New SqlParameter("@bintSectionId", hdnSecIdPopup.Value)
            sqlPar(2) = New SqlParameter("@bintproductid", hdnbintproductidPopup.Value)
            sqlPar(3) = New SqlParameter("@intOrder", Convert.ToInt32(txtAddproductOrder.Text))

            executeNonQuery("[dbo].[Group_Sectio_Book_AddBook]", sqlPar, CommandType.StoredProcedure)

            msgSuccess(ltrlMsgPopup, "product Set at front sucessfully")

        Catch ex As Exception
            msgError(ltrlMsgPopup, ex.Message)
        Finally
            txtAddproductOrder.Text = ""
            txtAddproductPopup.Text = ""
            hdnbintproductidPopup.Value = "0"
            mpeproductAdd.Show()
        End Try


    End Sub


    Protected Sub lnkClosePopup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkClosePopup.Click

        msgClear(ltrlMsgPopup)

        bindSection()
    End Sub

    Protected Sub radCatBannerList_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles radCatBannerList.TextChanged

        Dim IsCat As Boolean = False
        If radCatBannerList.SelectedValue = "cat" Then
            IsCat = True
        End If

        drpBannerPopupCategory.Visible = IsCat
        cmpValBannerPopupCategory.Visible = IsCat
        txtBannerUrl.Visible = Not IsCat
        rfvBannerUrl.Visible = Not IsCat

        mpeBannerAdd.Show()

    End Sub


    'radCatBannerList
#End Region


#Region "Functions"

    'Private Sub bindCategoryDrpDn()

    '    drpBannerPopupCategory.Items.Clear()
    '    drpBannerPopupCategory.DataSource = sqlHelper.getDataTable("CategoryListDrpdnParWise", CommandType.StoredProcedure)
    '    drpBannerPopupCategory.DataBind()

    'End Sub

    Private Sub bindGroup()

        Dim dt As DataTable = getDataTable("GroupMstrListDrpdn", CommandType.StoredProcedure)

        drpGrpSel.DataSource = dt
        drpGrpSel.DataBind()

        drpGrpSel.Items.Insert(0, New ListItem("Select Group", "0"))

    End Sub

    Private Sub bindSection()

        Dim sqlPar(0) As SqlParameter
        sqlPar(0) = New SqlParameter("@bintGroupId", drpGrpSel.SelectedValue)

        Dim dt As DataTable = getDataTable("SectionMstrFromGroupId", sqlPar, CommandType.StoredProcedure)

        rptSectionList.DataSource = dt
        rptSectionList.DataBind()

    End Sub

    Private Sub bindSectionBanner()

        If drpGrpSel.SelectedValue = "0" Then
            divListBanner.Visible = False
        Else

            divListBanner.Visible = True

            Dim sqlPar(1) As SqlParameter
            sqlPar(0) = New SqlParameter("@bintGroupBannerId", 0)
            sqlPar(1) = New SqlParameter("@bintGroupId", drpGrpSel.SelectedValue)

            Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[Group_banner_List]", sqlPar, CommandType.StoredProcedure)

            If dt.Rows.Count > 0 Then
                rptBanner.Visible = True

                rptBanner.DataSource = dt
                rptBanner.DataBind()
            Else
                rptBanner.Visible = False
            End If

        End If

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
