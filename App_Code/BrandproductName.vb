Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Services

Imports System.Data
Imports System.Data.SqlClient

 

<WebService([Namespace]:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<System.Web.Script.Services.ScriptService> _
Public Class BookListAutoComp
    Inherits System.Web.Services.WebService


    <WebMethod> _
    Public Function productSearch(prefixText As String, count As Int32) As String()
        Dim spar As SqlParameter() = New SqlParameter(0) {}
        spar(0) = New SqlParameter("@strPref", prefixText)

        Dim dt As DataTable = sqlHelper.getDataTable("[dbo].[productMstrSearchByName]", spar, CommandType.StoredProcedure)

        Dim strArr As String() = New String(dt.Rows.Count - 1) {}

        For i As Integer = 0 To dt.Rows.Count - 1
            strArr(i) = Convert.ToString(dt.Rows(i)("strproname"))
        Next

        Return strArr

    End Function



End Class