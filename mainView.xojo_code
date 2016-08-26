#tag IOSView
Begin iosView mainView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   False
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSTable tblTasks
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   tblTasks, 2, btnAdd, 2, False, +1.00, 1, 1, 0, 
      AutoLayout      =   tblTasks, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   tblTasks, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   tblTasks, 4, btnAdd, 3, False, +1.00, 1, 1, -*kStdControlGapV, 
      EditingEnabled  =   False
      EditingEnabled  =   False
      EstimatedRowHeight=   -1
      Format          =   "0"
      Height          =   405.5
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   28
      Visible         =   True
      Width           =   311.0
   End
   Begin iOSTextField txtTask
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   txtTask, 2, btnAdd, 1, False, +1.00, 1, 1, -*kStdControlGapH, 
      AutoLayout      =   txtTask, 8, , 0, True, +1.00, 1, 1, 31, 
      AutoLayout      =   txtTask, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   txtTask, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, -*kStdControlGapV, 
      Enabled         =   True
      Height          =   31.0
      KeyboardType    =   "0"
      Left            =   20
      LockedInPosition=   False
      Password        =   False
      PlaceHolder     =   "タスク名"
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   441
      Visible         =   True
      Width           =   229.0
   End
   Begin iOSButton btnAdd
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   btnAdd, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   btnAdd, 7, , 0, False, +1.00, 1, 1, 54, 
      AutoLayout      =   btnAdd, 11, txtTask, 11, False, +1.00, 1, 1, 0, 
      AutoLayout      =   btnAdd, 2, <Parent>, 2, False, +1.00, 1, 1, -9, 
      Caption         =   "追加"
      Enabled         =   True
      Height          =   30.0
      Left            =   257
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   ""
      TextSize        =   0
      Top             =   441
      Visible         =   True
      Width           =   54.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  // tblTasks.AddSection("タスク")
		  MyData = New TableData
		  tblTasks.DataSource = MyData
		  // tblTasks.EditingEnabled = true
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		MyData As TableData
	#tag EndProperty


#tag EndWindowCode

#tag Events tblTasks
	#tag Event
		Function ActionsForRow(section As Integer, row As Integer) As iOSTableRowAction()
		  Dim Actions(0) As iOSTableRowAction
		  Const kDeleteTag As Text = "DELETE"
		  
		  // Create the Flag button
		  Actions(0) = New iOSTableRowAction(iOSTableRowAction.Styles.Normal, "削除", kDeleteTag)
		  
		  Return Actions
		End Function
	#tag EndEvent
	#tag Event
		Sub RowAction(section As Integer, row As Integer, actionTag As Auto)
		  select case actionTag
		  case "DELETE"
		    Self.MyData.Data.Remove(row)
		    Me.ReloadData
		  end select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnAdd
	#tag Event
		Sub Action()
		  if txtTask.Text <> "" then
		    // タスク一覧に追加
		    System.DebugLog("Here")
		    Self.MyData.Data.Append(txtTask.Text)
		    tblTasks.ReloadData
		    // タスクIDをインクリメント
		    App.taskId = App.taskId + 1
		    // 入力欄を空にする
		    txtTask.Text = ""
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
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
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Group="Behavior"
		Type="iOSImage"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
