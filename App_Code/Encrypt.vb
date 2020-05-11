Imports System.Configuration
Imports System.Security.Cryptography
Imports System.IO

Public Class Encrypt

#Region "Variables"
    Private Shared key As Byte() = {}
    Private Shared IV As Byte() = {&H12, &H34, &H56, &H78, &H90, &HAB, &HCD, &HEF}
    Private Shared EncryptionKey As String = App.Value("EncryKey")
#End Region

#Region "Functions"
    Public Shared Function UTF8Decrypt(ByVal Input As String) As String
        Dim inputByteArray As [Byte]() = New [Byte](Input.Length - 1) {}
        Try
            key = System.Text.Encoding.UTF8.GetBytes(EncryptionKey.Substring(0, 8))
            Dim des As New DESCryptoServiceProvider()
            inputByteArray = Convert.FromBase64String(Input)
            Dim ms As New MemoryStream()
            Dim cs As New CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write)
            cs.Write(inputByteArray, 0, inputByteArray.Length)
            cs.FlushFinalBlock()
            Dim encoding__1 As Encoding = Encoding.UTF8
            Return encoding__1.GetString(ms.ToArray())
        Catch ex As Exception
            Return ""
        End Try
    End Function

    Public Shared Function UTF8Encrypt(ByVal Input As String) As String
        Try
            key = System.Text.Encoding.UTF8.GetBytes(EncryptionKey.Substring(0, 8))
            Dim des As New DESCryptoServiceProvider()
            Dim inputByteArray As [Byte]() = Encoding.UTF8.GetBytes(Input)
            Dim ms As New MemoryStream()
            Dim cs As New CryptoStream(ms, des.CreateEncryptor(key, IV), CryptoStreamMode.Write)
            cs.Write(inputByteArray, 0, inputByteArray.Length)
            cs.FlushFinalBlock()
            Return Convert.ToBase64String(ms.ToArray())
        Catch ex As Exception
            Return ""
        End Try
    End Function
#End Region

End Class