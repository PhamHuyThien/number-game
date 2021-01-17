#include-once
#include <Array.au3>


Func _Util_CreateArray($__sValue, $__nSpace1, $__nSpace2 = 0, $__nSpace3 = 0, $__nSpace4 = 0, $__nSpace5 = 0)
	If $__nSpace2 > 0 And $__nSpace1 < 1 Then
		Return False ;
	EndIf
	If $__nSpace3 > 0 And $__nSpace2 < 1 Then
		Return False ;
	EndIf
	If $__nSpace4 > 0 And $__nSpace3 < 1 Then
		Return False;
	EndIf
	If $__nSpace5 > 0 And $__nSpace4 < 1 Then
		Return False;
	EndIf
	$__nSpace = 1 ;
	$__nSpace = $__nSpace + ($__nSpace2 > 0 ? 1 : 0) ;
	$__nSpace = $__nSpace + ($__nSpace3 > 0 ? 1 : 0) ;
	$__nSpace = $__nSpace + ($__nSpace4 > 0 ? 1 : 0) ;
	$__nSpace = $__nSpace + ($__nSpace5 > 0 ? 1 : 0) ;
	Switch $__nSpace
		Case 1
			Local $__sArrays[$__nSpace1] ;
		Case 2
			Local $__sArrays[$__nSpace1][$__nSpace2] ;
		Case 3
			Local $__sArrays[$__nSpace1][$__nSpace2][$__nSpace3] ;
		Case 4
			Local $__sArrays[$__nSpace1][$__nSpace2][$__nSpace3][$__nSpace4] ;
		Case 5
			Local $__sArrays[$__nSpace1][$__nSpace2][$__nSpace3][$__nSpace4][$__nSpace5] ;
	EndSwitch
	If $__sValue <> "" Then
		For $__i = 0 To $__nSpace1 - 1
			If $__nSpace > 1 Then
				For $__j = 0 To $__nSpace2 - 1
					If $__nSpace > 2 Then
						For $__k = 0 To $__nSpace3 - 1
							If $__nSpace > 3 Then
								For $__n = 0 to $__nSpace4 - 1
									If $__nSpace > 4 Then
										For $__m=0 to $__nSpace5 -1
											$__sArrays[$__i][$__j][$__k][$__n][$__m] = $__sValue ;
										Next
									Else
										$__sArrays[$__i][$__j][$__k][$__n] = $__sValue ;
									EndIf
								Next
							Else
								$__sArrays[$__i][$__j][$__k] = $__sValue ;
							EndIf
						Next
					Else
						$__sArrays[$__i][$__j] = $__sValue ;
					EndIf
				Next
			Else
				$__sArrays[$__i] = $__sValue ;
			EndIf
		Next
	EndIf
	Return $__sArrays ;
EndFunc   ;==>_Util_CreateArray

Func _Util_ReadFile($__sPath)
	$__oFile = FileOpen($__sPath, 0) ;
	$__sData = FileRead($__oFile) ;
	FileClose($__oFile) ;
	Return $__sData ;
EndFunc   ;==>_Util_ReadFile

Func _Util_StrSplit($__sString, $__sDemilter = "")
	Return StringSplit($__sString, $__sDemilter, 2) ;
EndFunc   ;==>_Util_StrSplit

Func _Util_Rand($__nMin, $__nMax)
	$__nMax = $__nMax < $__nMin ? $__nMin : $__nMax ;
	Return Random($__nMin, $__nMax, 1) ;
EndFunc   ;==>_Util_Rand

Func _Util_ElmArrIsEmpty($__Value)
	Return $__Value == "" ;
EndFunc   ;==>_Util_ElmArrIsEmpty

Func _Util_IsNumber($__sNumber)
	$__sNumber = _Util_Trim($__sNumber) ;
	If $__sNumber == "" Then
		Return False ;
	EndIf
	$__sNumbers = StringSplit($__sNumber, "") ;
	For $__i = 0 To UBound($__sNumbers) - 1
		$__nAscNum = Asc($__sNumbers[$__i]) ;
		If $__nAscNum < 48 Or $__nAscNum > 57 Then
			Return False ;
		EndIf
	Next
	Return Number($__sNumber) ;
EndFunc   ;==>_Util_IsNumber

Func _Util_GetText($__hGuiCtrl)
	Return _Util_Trim(GUICtrlRead($__hGuiCtrl)) ;
EndFunc   ;==>_Util_GetText

Func _Util_Trim($__sString)
	Return StringStripWS($__sString, 3) ;
EndFunc   ;==>_Util_Trim

Func _Util_MsgWarning($__sMsg)
	MsgBox(48, "Cảnh báo", $__sMsg) ;
EndFunc

Func _Util_MsgError($__sMsg)
	MsgBox(16, "Lỗi", $__sMsg) ;
EndFunc   ;==>_Util_MsgError



Func _Util_MsgSuccess($__sMsg) ;
	MsgBox(64, "Thành công", $__sMsg) ;
EndFunc   ;==>_Util_MsgSuccess



Func _Util_TooltipReset()
	ToolTip("")    ;
EndFunc   ;==>_Util_ResetTooltip



Func _Util_Tooltip($__sTitle, $__sContent, $__aPosition)
;~ 	$__aPosition = WinGetPos($guiMain) ;
	ToolTip($__sContent, $__aPosition[0], $__aPosition[1], $__sTitle, 1, 1) ;
EndFunc   ;==>_Util_Tooltip



Func _Util_Debug($__sText)
	ConsoleWrite($__sText & @CRLF) ;
EndFunc   ;==>_Util_Debug



Func _Util_OpenTabBrowswer($__sUrlContact = "https://facebook.com/ThienDz.SystemError")
	;
	Dim $__aPathBrowser = [ _
			"C:\Users\" & @UserName & "\AppData\Local\CocCoc\Browser\Application\browser.exe", _ ;CocCoc
			"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe", _
			"C:\Program Files\Internet Explorer\iexplore.exe" _
			] ;
	$__sCommandSell = $__sUrlContact & " --new-tab --full-screen" ;
	;
	For $i = 0 To UBound($__aPathBrowser) - 1
		$__nResult = ShellExecuteWait($__aPathBrowser[$i], $__sCommandSell) ;
		If $__nResult <> 0 Then
			Return True ;
		EndIf
	Next
	;
	Return False ;
EndFunc   ;==>_Util_OpenTabBrowswer


Func _Util_Exit()
	Exit
EndFunc   ;==>_Util_Exit
