Imports System.Data
Imports System.Data.SqlClient

Partial Public Class Admin_LotList
    Inherits System.Web.UI.Page

#Region "Page Events"

    

    

    


    Protected Sub changePageSize(ByVal sender As Object, ByVal e As EventArgs)
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
    Protected Sub btnAction_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim drpAct As DropDownList = CType(ListView1.FindControl("drpActions"), DropDownList)
        Dim hdnVal As HiddenField = CType(ListView1.FindControl("hdnChk"), HiddenField)
        app.GeneralOpration("tblBanner", "intBannerId", hdnVal.Value.Trim(","), drpAct.SelectedValue)
        hdnVal.Value = ""
        ListView1.DataBind()
    End Sub


    



#End Region



    
    
End Class
 
