#tag Class
Protected Class TableData
Implements iOSTableDataSource,iOSTableDataSourceEditing
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowCount(table as iOSTable, section As Integer) As Integer
		  // Part of the iOSTableDataSource interface.
		  
		  Return Data.Ubound + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowData(table as iOSTable, section As Integer, row As Integer) As iOSTableCellData
		  // Part of the iOSTableDataSource interface.
		  
		  Dim cell As iOSTableCellData = table.CreateCell(Data(row))
		  Return cell
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowEditingCompleted(table As iOSTable, section As Integer, row As Integer, action As iOSTable.RowEditingStyles)
		  // Part of the iOSTableDataSourceEditing interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowIsEditable(table As iOSTable, section As Integer, row As Integer) As Boolean
		  // Part of the iOSTableDataSourceEditing interface.
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionCount(table as iOSTable) As Integer
		  // Part of the iOSTableDataSource interface.
		  
		  Return 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionTitle(table as iOSTable, section As Integer) As Text
		  // Part of the iOSTableDataSource interface.
		  
		  Return "タスク一覧"
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Data() As Text
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
