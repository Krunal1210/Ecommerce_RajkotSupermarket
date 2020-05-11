
Imports System
Namespace IntegrationKit

	Public Class libfuncs1
		Public Function getchecksum(MerchantId As String, OrderId As String, Amount As String, redirectUrl As String, WorkingKey As String) As String
			Dim str As String
			Dim adler As Long
			str = MerchantId + "|" + OrderId + "|" + Amount + "|" + redirectUrl + "|" + WorkingKey
			adler = 1
			Return adler32(adler, str)
		End Function

		Public Function verifychecksum(MerchantId As String, OrderId As String, Amount As String, AuthDesc As String, WorkingKey As String, checksum As String) As String
			Dim str As String, retval As String, adlerResult As String
			Dim adler As Long
			str = MerchantId + "|" + OrderId + "|" + Amount + "|" + AuthDesc + "|" + WorkingKey
			adler = 1
			adlerResult = adler32(adler, str)

			If String.Compare(adlerResult, checksum, True) = 0 Then
				retval = "true"
			Else
				retval = "false"
			End If
			Return retval
		End Function


		Private Function adler32(adler As Long, strPattern As String) As String
			Dim BASE As Long
			Dim s1 As Long, s2 As Long
			Dim testchar As Char()
			Dim intTest As Long = 0

			BASE = 65521
			s1 = andop(adler, 65535)
			s2 = andop([cdec](rightshift(cbin(adler), 16)), 65535)

			For n As Integer = 0 To strPattern.Length - 1

				testchar = (strPattern.Substring(n, 1)).ToCharArray()
                intTest = CLng(Val(testchar(0)))
				s1 = (s1 + intTest) Mod BASE
				s2 = (s2 + s1) Mod BASE
			Next
			Return ([cdec](leftshift(cbin(s2), 16)) + s1).ToString()
		End Function


		Private Function power(num As Long) As Long
			Dim result As Long = 1
			For i As Integer = 1 To num
				result = result * 2
			Next
			Return result
		End Function


		Private Function andop(op1 As Long, op2 As Long) As Long
			Dim op As String, op3 As String, op4 As String
			op = ""

			op3 = cbin(op1)
			op4 = cbin(op2)

			For i As Integer = 0 To 31
				op = op + "" + ((Long.Parse(op3.Substring(i, 1))) And (Long.Parse(op4.Substring(i, 1))))
			Next
			Return [cdec](op)
		End Function

		Private Function cbin(num As Long) As String
			Dim bin As String = ""
			Do
				bin = (((num Mod 2)) + bin).ToString()
				num = CLng(Math.Floor(CDbl(num) / 2))
			Loop While Not (num = 0)

			Dim tempCount As Long = 32 - bin.Length

			For i As Integer = 1 To tempCount
				bin = "0" + bin
			Next
			Return bin
		End Function


		Private Function leftshift(str As String, num As Long) As String
			Dim tempCount As Long = 32 - str.Length

			For i As Integer = 1 To tempCount

				str = "0" + str
			Next

			For i As Integer = 1 To num
				str = str + "0"
				str = str.Substring(1, str.Length - 1)
			Next
			Return str
		End Function


		Private Function rightshift(str As String, num As Long) As String

			For i As Integer = 1 To num
				str = "0" + str
				str = str.Substring(0, str.Length - 1)
			Next
			Return str
		End Function

		Private Function [cdec](strNum As String) As Long
			Dim dec As Long = 0
			For n As Integer = 0 To strNum.Length - 1
				dec = dec + CLng(Long.Parse(strNum.Substring(n, 1)) * power(strNum.Length - (n + 1)))
			Next
			Return dec
		End Function

	End Class
	'End of Class libfuncs
End Namespace
'End of class IntegrationKit

'=======================================================
'Service provided by Telerik (www.telerik.com)
'Conversion powered by NRefactory.
'Twitter: @telerik, @toddanglin
'Facebook: facebook.com/telerik
'=======================================================
