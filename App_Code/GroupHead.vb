Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Data.SqlClient

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class GroupHead
     Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GroupheadSearch(ByVal prefixText As String, ByVal count As Int32) As String()
        Dim spar As SqlParameter() = New SqlParameter(0) {}
        spar(0) = New SqlParameter("@strPref", prefixText)

        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[GroupheadSearchByName]", spar, CommandType.StoredProcedure)

        Dim strArr As String() = New String(dt.Rows.Count - 1) {}

        For i As Integer = 0 To dt.Rows.Count - 1
            strArr(i) = Convert.ToString(dt.Rows(i)("GroupName"))
        Next

        Return strArr

    End Function

End Class