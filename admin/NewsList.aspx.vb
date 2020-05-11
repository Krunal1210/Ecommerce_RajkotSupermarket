Imports System.Xml
Imports System.Linq
Imports System.Xml.Linq
Imports System.Data
Imports System.Data.SqlClient


Partial Class admin_SchoolList
    Inherits System.Web.UI.Page

#Region "Page events"

    Protected Sub btnAction_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim drpAct As DropDownList = CType(ListView1.FindControl("drpActions"), DropDownList)
        Dim hdnVal As HiddenField = CType(ListView1.FindControl("hdnChk"), HiddenField)
        app.GeneralOpration("tblNews", "bintNewsId", hdnVal.Value.Trim(","), drpAct.SelectedValue)
        hdnVal.Value = ""
        ListView1.DataBind()
    End Sub

#End Region


    'Protected Sub btnGetLatNews_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGetLatNews.Click
    '    GetNewsFromGoogle()


    'End Sub


    'Sub GetNewsFromGoogle()

    '    Dim xmlNws = XDocument.Load("http://news.google.co.in/news?hl=en&gl=in&as_occt=any&as_qdr=a&as_nloc=south+africa&authuser=0&q=location:south_africa&um=1&ie=UTF-8&output=rss")


    '    Dim news = From p In xmlNws.Descendants("item") _
    '    Select New With _
    '    { _
    '    .title = p.Element("title").Value, .link = p.Element("link").Value, .pubDate = p.Element("pubDate").Value, .description = p.Element("description").Value _
    '    }

    '    For Each n In news

    '        Dim spar(4) As SqlParameter
    '        spar(0) = New SqlParameter("@strNewsTitle", n.title)
    '        spar(1) = New SqlParameter("@strContent", n.description)
    '        spar(2) = New SqlParameter("@dateNews", Convert.ToDateTime(n.pubDate))
    '        spar(3) = New SqlParameter("@bitIsOnHome", True)
    '        spar(4) = New SqlParameter("@strLink", n.link)

    '        sqlHelper.executeNonQuery("[NewsAddGoogle]", spar, CommandType.StoredProcedure)

    '     Next




    'End Sub



     
End Class
