Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class sqlHelper


    Shared Function getDataset(ByVal cmdName As String, ByVal cmpPar As SqlParameter(), ByVal cmdType As CommandType) As DataSet
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

        Dim ds As New DataSet

        Dim da As New SqlDataAdapter(sqlCmd)
        sqlConn.Open()
        da.Fill(ds)
        sqlConn.Close()

        Return ds

    End Function

    Shared Sub executeNonQueryFront(ByVal cmdName As String, ByVal cmpPar As SqlParameter(), ByVal cmdType As CommandType)

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

    Shared Sub executeNonQueryfront(ByVal cmdName As String, ByVal cmdType As CommandType)

        Dim sqlConnstr As String = ConfigurationManager.ConnectionStrings("OnlineGroceryConnectionString").ConnectionString
        Dim sqlConn As New SqlConnection(sqlConnstr)

        Dim sqlCmd = sqlConn.CreateCommand()
        sqlCmd.CommandText = cmdName
        sqlCmd.CommandType = cmdType

        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

    End Sub
    Shared Function getDataset(ByVal cmdName As String, ByVal cmdType As CommandType) As DataSet
        Dim sqlConnstr As String = ConfigurationManager.ConnectionStrings("OnlineGroceryConnectionString").ConnectionString
        Dim sqlConn As New SqlConnection(sqlConnstr)

        Dim sqlCmd = sqlConn.CreateCommand()
        sqlCmd.CommandText = cmdName
        sqlCmd.CommandType = cmdType

        Dim ds As New DataSet

        Dim da As New SqlDataAdapter(sqlCmd)
        sqlConn.Open()
        da.Fill(ds)
        sqlConn.Close()

        Return ds

    End Function

    Shared Function getDataTable(ByVal cmdName As String, ByVal cmpPar As SqlParameter(), ByVal cmdType As CommandType) As DataTable
        Dim sqlConnstr As String = ConfigurationManager.ConnectionStrings("OnlineGroceryConnectionString").ConnectionString
        Dim sqlConn As New SqlConnection(sqlConnstr)

        Dim sqlCmd = sqlConn.CreateCommand()
        sqlCmd.CommandText = cmdName
        sqlCmd.CommandType = cmdType

        'Try
        For Each par As SqlParameter In cmpPar
            sqlCmd.Parameters.Add(par)
        Next
        'Catch ex As Exception
        'End Try

        Dim dt As New DataTable

        Dim da As New SqlDataAdapter(sqlCmd)
        sqlConn.Open()
        da.Fill(dt)
        sqlConn.Close()

        Return dt

    End Function

    Shared Function getDatatable(ByVal cmdName As String, ByVal cmdType As CommandType) As DataTable
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

    Shared Sub executeNonQuery(ByVal cmdName As String, ByVal cmpPar As SqlParameter(), ByVal cmdType As CommandType)

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

    Shared Sub executeNonQuery(ByVal cmdName As String, ByVal cmdType As CommandType)

        Dim sqlConnstr As String = ConfigurationManager.ConnectionStrings("OnlineGroceryConnectionString").ConnectionString
        Dim sqlConn As New SqlConnection(sqlConnstr)

        Dim sqlCmd = sqlConn.CreateCommand()
        sqlCmd.CommandText = cmdName
        sqlCmd.CommandType = cmdType

        sqlConn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlConn.Close()

        app.WebsiteUpdated()

    End Sub





    Shared Sub executeNonQueryRef(ByVal cmdName As String, ByRef cmpPar As SqlParameter(), ByVal cmdType As CommandType)

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


End Class
