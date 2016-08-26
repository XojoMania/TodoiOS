#tag Class
Protected Class App
Inherits IOSApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Property, Flags = &h0
		taskId As Integer = 0
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="taskId"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
