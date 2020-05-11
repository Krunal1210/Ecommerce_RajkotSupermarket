Imports Microsoft.VisualBasic

Public Class ClearData

    Public Shared Sub clearAllTextBox(ByVal tblContain As Panel)
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

    Public Shared Sub clearAllDropdownSelection(ByVal tblContain As Panel)
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


    Public Shared Sub clearAllDropdownData(ByVal tblContain As Panel)
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

    Public Shared Sub clearAllCheckbox(ByVal tblContain As Panel)
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

    Shared Sub clearAllTextBox()
        Throw New NotImplementedException
    End Sub

    Shared Sub clearAllDropdownData()
        Throw New NotImplementedException
    End Sub

    Shared Sub clearAllTextBox(ByVal p1 As String)
        Throw New NotImplementedException
    End Sub

    Shared Sub clearAllDropdownData(ByVal p1 As String)
        Throw New NotImplementedException
    End Sub

End Class
