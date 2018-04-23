Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Namespace ButtonColumnFiresClientScriptWithRowId
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
			ASPxGridView1.DataSource = GetDataTable()
		End Sub

		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			ASPxGridView1.DataBind()
		End Sub

		Private Function GetDataTable() As DataTable
			Dim table As New DataTable()
			table.Columns.Add("ID", GetType(Integer))
			For i As Integer = 1 To 5
				table.Rows.Add(New Object() { i })
			Next i
			Return table
		End Function

		Protected Sub ASPxCallbackPanel1_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
			Dim parameters() As String = e.Parameter.Split(";"c)
			If parameters.Length = 2 AndAlso parameters(0) = "RowClick" Then
				Dim rowId As Integer = Convert.ToInt32(parameters(1))
				ASPxLabel1.Text = String.Format("Row clicked: {0}", rowId)
			End If
		End Sub
	End Class
End Namespace
