
Partial Class admin_AdminMaster
    Inherits System.Web.UI.MasterPage



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not IsPostBack Then
        If Not loginclass.isAdmin() Then
            Response.Redirect("~/login.aspx")
        Else
            aUserName.InnerText = loginclass.getUserName()
        End If
        'End If
    End Sub


    Protected Sub lnkLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkLogout.Click
        loginclass.getlogout()
        Response.Redirect("~/login.aspx")
    End Sub

End Class

