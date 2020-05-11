
Partial Class userControls_ucSchoolMenu
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            setMenu(Convert.ToString(Session("strParMenu")), Convert.ToString(Session("strChildMenu")))
        End If
    End Sub

    Private Sub setMenu(ByVal strParMenu As String, ByVal strChildMenu As String)
        Try
            clearAllSelection()
            Select Case strParMenu
                Case "Home"
                    aHome.Attributes.Add("class", "nav-top-item current")
                Case "Master"
                    aMaster.Attributes.Add("class", "nav-top-item current")
                    If Not String.IsNullOrEmpty(strChildMenu) Then
                        Select Case strChildMenu
                            Case "District"
                                aCldDistrictList.Attributes.Add("class", "current")
                            Case "Taluka"
                                aCldTalukaList.Attributes.Add("class", "current")
                            Case "City"
                                aCldCityList.Attributes.Add("class", "current")
                            Case "Area"
                                aCldAreaList.Attributes.Add("class", "current")
                            Case "Category"
                                aCldCategoryList.Attributes.Add("class", "current")
                            Case "SubCategory"
                                aCldSubCategoryList.Attributes.Add("class", "current")
                          
                            Case "Amenity"
                                aAmenity.Attributes.Add("class", "current")
                            Case "AreaType"
                                aAreaType.Attributes.Add("class", "current")
                            Case "Zone"
                                aZone.Attributes.Add("class", "current")
                        End Select
                    End If
                Case "Customer"
                    aCldCustomerList.Attributes.Add("class", "nav-top-item current")
                Case "Transaction"
                    aTransaction.Attributes.Add("class", "nav-top-item current")
                    If Not String.IsNullOrEmpty(strChildMenu) Then
                        Select Case strChildMenu
                            Case "Property"
                                aProperty.Attributes.Add("class", "current")
                        End Select
                    End If
                Case "Reports"
                    aReports.Attributes.Add("class", "nav-top-item current")
                    If Not String.IsNullOrEmpty(strChildMenu) Then
                        Select Case strChildMenu
                            Case "Historical"
                                aHistorical.Attributes.Add("class", "current")
                            Case "Rental Properties"
                                aRentalProperties.Attributes.Add("class", "current")
                            Case "Report Properties"
                                aReportProperties.Attributes.Add("class", "current")
                        End Select
                    End If
                Case "Broker"
                    aBroker.Attributes.Add("class", "nav-top-item current")
                    If Not String.IsNullOrEmpty(strChildMenu) Then
                        Select Case strChildMenu
                            Case "Property"
                                abroProperty.Attributes.Add("class", "current")
                            Case "Historical"
                                abroHistorical.Attributes.Add("class", "current")
                            Case "Rental Properties"
                                abroRentalProperties.Attributes.Add("class", "current")
                            Case "Report Properties"
                                abroReportProperties.Attributes.Add("class", "current")
                        End Select
                    End If




            End Select

        Catch ex As Exception

        End Try
    End Sub

    Private Sub clearAllSelection()
        aHome.Attributes.Add("class", "nav-top-item no-submenu")

        'Master menu starts here
        aMaster.Attributes.Add("class", "nav-top-item no-submenu")

        aCldDistrictList.Attributes.Add("class", "")
        aCldTalukaList.Attributes.Add("class", "")
        aCldCityList.Attributes.Add("class", "")
        aCldAreaList.Attributes.Add("class", "")
        aCldCategoryList.Attributes.Add("class", "")
        aCldSubCategoryList.Attributes.Add("class", "")

        aAmenity.Attributes.Add("class", "")
        aAreaType.Attributes.Add("class", "")
        aZone.Attributes.Add("class", "")
        'Master menu ends here
        aCldCustomerList.Attributes.Add("class", "nav-top-item no-submenu")

        aTransaction.Attributes.Add("class", "nav-top-item  ")
        aProperty.Attributes.Add("class", "")

        aReports.Attributes.Add("class", "nav-top-item  ")
        aHistorical.Attributes.Add("class", "")
        aRentalProperties.Attributes.Add("class", "")
        aReportProperties.Attributes.Add("class", "")

        aBroker.Attributes.Add("class", "nav-top-item  ")
        abroProperty.Attributes.Add("class", "")
        abroHistorical.Attributes.Add("class", "")
        abroRentalProperties.Attributes.Add("class", "")
        abroReportProperties.Attributes.Add("class", "")
    End Sub

End Class
