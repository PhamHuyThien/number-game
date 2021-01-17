#include-once

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#include <GuiComboBox.au3>
#include <Array.au3>

#include <..\lib\AutoItObject.au3>
#include <..\util\ConstructArgs.au3>

#include <..\model\MapGame.au3>

#include <..\util\Utilities.au3>


Func _New_FormMain($__aArgs = Null)
	;
	$__object = IDispatch() ;
	$__object.__name = "FormMain" ;
	$__object.__des = "" ;
	$__object.__status = 1 ;
	;
	$__oArgs = _New_ConstructArgs($__aArgs) ;
	$__object._oGameInfo = $__oArgs.arg() ;
	;
	$__object._hGUI = Null ;
	$__object._hInpMap = Null ;
	$__object._hInpAmount = Null ;
	$__object._hInpFont = Null ;
	$__object._hInpSize = Null ;
	$__object._hCbbQuickSetting = Null ;
	$__object._hBtnStartGame = Null ;
	$__object._hBtnContact = Null ;
	;
	$__object._oMapGame = Null ;
	;
	$__object.__defineGetter("_toString", __FormMain_toString) ;
	$__object.__defineGetter("_getError", __FormMain_getError) ;
	$__object.__defineGetter("_init", __FormMain_Init) ;
	$__object.__defineGetter("_show", __FormMain_Show) ;
	$__object.__defineGetter("_hide", __FormMain_Hide) ;
	$__object.__defineGetter("_waitResult", __FormMain_WaitResult) ;
	$__object.__defineGetter("_getPosition", __FormMain_GetPositon) ;
	;
	$__object.__lock() ;
	;
	Return $__object ;
EndFunc   ;==>_New_FormMain



Func __FormMain_Init($_oSelf)
	$_oSelf.parent._hGUI = GUICreate($_oSelf.parent._oGameInfo._sName & " V" & $_oSelf.parent._oGameInfo._sVersion & " - " & $_oSelf.parent._oGameInfo._sAuthor, 482, 276) ;
	GUICtrlCreateLabel($_oSelf.parent._oGameInfo._sName, 8, 8, 468, 44, $SS_CENTER) ;
	GUICtrlSetFont(-1, 22, 800, 0, "Comic Sans MS") ;
	GUICtrlCreateGroup("Game Setting", 8, 56, 465, 153)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	$_oSelf.parent._hBtnStartGame = GUICtrlCreateButton("Start Game", 336, 168, 123, 25)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	GUICtrlCreateLabel("Map: ", 16, 80, 32, 19)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	$_oSelf.parent._hInpMap = GUICtrlCreateInput(__FormMain_BuildMapDesktop(), 80, 72, 145, 23)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	GUICtrlCreateLabel("Amount:", 16, 112, 45, 19)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	$_oSelf.parent._hInpAmount = GUICtrlCreateInput("100", 80, 104, 145, 23)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	GUICtrlCreateLabel("Font:", 16, 144, 29, 19)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	$_oSelf.parent._hInpFont = GUICtrlCreateInput("Tahoma", 80, 136, 145, 23)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	GUICtrlCreateLabel("Size:", 16, 176, 31, 19)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	$_oSelf.parent._hInpSize = GUICtrlCreateInput("10", 80, 168, 145, 23)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	GUICtrlCreateLabel("Quick setting:", 256, 144, 77, 19)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	$_oSelf.parent._hCbbQuickSetting = GUICtrlCreateCombo("Handmade", 336, 136, 121, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	GUICtrlSetData(-1, "Easy|Medium|Hard|NightMate")
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	GUICtrlCreateGroup("Contact", 8, 216, 465, 49)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	GUICtrlCreateLabel($_oSelf.parent._oGameInfo._sName & " V" & $_oSelf.parent._oGameInfo._sVersion & " - Code By " & $_oSelf.parent._oGameInfo._sAuthor & " - Love " & $_oSelf.parent._oGameInfo._sGirlFriendAuthor, 16, 240, 334, 19)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	$_oSelf.parent._hBtnContact = GUICtrlCreateButton("Contact", 360, 232, 99, 25)
	GUICtrlSetFont(-1, 8, 400, 0, "Comic Sans MS")
	Return True ;
EndFunc   ;==>__FormMain_Init


Func __FormMain_Show($_oSelf)
	Return GUISetState(@SW_SHOW, $_oSelf.parent._hGUI) == 1 ;
EndFunc   ;==>__FormMain_Show

Func __FormMain_Hide($_oSelf)
	Return GUISetState(@SW_HIDE, $_oSelf.parent._hGUI) == 1 ;
EndFunc   ;==>__FormMain_Hide


Func __FormMain_WaitResult($_oSelf)
	While 1
		$__nMsg = GUIGetMsg()
		Switch $__nMsg
			Case $GUI_EVENT_CLOSE
				Exit ;
			Case $_oSelf.parent._hBtnStartGame
				$__nIndexCombobox = _GUICtrlComboBox_GetCurSel($_oSelf.parent._hCbbQuickSetting) ;
				If $__nIndexCombobox == 0 Then
					$_oSelf.parent._oMapGame = __FormMain_BuildMapGame($_oSelf.parent) ;
					If $_oSelf.parent._oMapGame <> False Then
						Return True ;
					EndIf
				Else
					$_oSelf.parent._oMapGame = __FormMain_QuickSetting($__nIndexCombobox - 1) ;
					If $_oSelf.parent._oMapGame <> False Then
						Return True ;
					EndIf
				EndIf
			Case $_oSelf.parent._hBtnContact
				_Util_OpenTabBrowswer($_oSelf.parent._oGameInfo._sUrlFacebook) ;
		EndSwitch
	WEnd
EndFunc   ;==>__FormMain_WaitResult

Func __FormMain_GetPositon($_oSelf)
	$__oGameInfo = $_oSelf.parent._oGameInfo ;
	$__sTitle = $__oGameInfo._sName & " V" & $__oGameInfo._sVersion & " - " & $__oGameInfo._sAuthor ;
	Return WinGetPos($__sTitle) ;
EndFunc   ;==>__FormMain_GetPositon

Func __FormMain_getError($_oSelf)
	$__oParent = $_oSelf.parent ;
	Switch $__oParent.__status
		Case 1
			Return "Success" ;
	EndSwitch
EndFunc   ;==>__FormMain_getError


Func __FormMain_toString($_oSelf)
	$__oParent = $_oSelf.parent ;
	Dim $__a = [] ; list object here...
	Return _AutoItObject_ArrayToString($__oParent.__name, $__a) ;
EndFunc   ;==>__FormMain_toString




Func __FormMain_BuildMapGame($__oFormMain)
	If __FormMain_CheckNull($__oFormMain) Then
		$__nInfoMaps = __FormMain_CheckStringMapSize(_Util_GetText($__oFormMain._hInpMap)) ;
		Local $__aArgsMapGame = [ _
				$__nInfoMaps[0], _
				$__nInfoMaps[1], _
				_Util_IsNumber(_Util_GetText($__oFormMain._hInpAmount)), _
				_Util_GetText($__oFormMain._hInpFont), _
				_Util_IsNumber(_Util_GetText($__oFormMain._hInpSize)), _
				 -1, _ ;timelevel.. load...
				Null _ ;map [x, y] ..load
				] ;
		Return _New_MapGame($__aArgsMapGame) ;
	EndIf
	Return False ;
EndFunc   ;==>__FormMain_BuildMapGame

Func __FormMain_CheckNull($__oFormMain)
	If Not IsArray(__FormMain_CheckStringMapSize(_Util_GetText($__oFormMain._hInpMap))) Then
		_Util_MsgError("Map format wrong? [width]x[height].") ;
		Return False ;
	EndIf
	If Not _Util_IsNumber(_Util_GetText($__oFormMain._hInpAmount)) Then
		_Util_MsgError("Amount format wrong? [number].") ;
		Return False ;
	EndIf
	If Not FileExists("C:\Windows\Fonts\" & _Util_GetText($__oFormMain._hInpFont) & ".ttf") Then
		_Util_MsgError("Font does not exists? C:\Windows\Font\[name].tff") ;
		Return False ;
	EndIf
	If Not _Util_IsNumber(_Util_GetText($__oFormMain._hInpSize)) Then
		_Util_MsgError("Font size format wrong? [number].") ;
		Return False ;
	EndIf
	Return True ;
EndFunc   ;==>__FormMain_CheckNull


Func __FormMain_CheckStringMapSize($__sMap)
	$__sMaps = _Util_StrSplit($__sMap, "x") ;
	If UBound($__sMaps) < 2 Then
		Return False ;
	EndIf
	$__nWidth = _Util_IsNumber($__sMaps[0]) ;
	$__nHeight = _Util_IsNumber($__sMaps[1]) ;
	If $__nWidth == False Or $__nHeight == False Then
		Return False ;
	EndIf
	Local $__nMaps = [$__nWidth, $__nHeight] ;
	Return $__nMaps ;
EndFunc   ;==>__FormMain_CheckStringMapSize



Func __FormMain_QuickSetting($__nLevel)
	$__nLevel = $__nLevel < 0 Or $__nLevel > 3 ? 0 : $__nLevel ;
	Local $__aArgsMapGame = Null ;
	Switch $__nLevel
		Case 0
		Case 1
		Case 2
		Case 3
	EndSwitch
	Return _New_MapGame($__aArgsMapGame) ;
EndFunc   ;==>__FormMain_QuickSetting


Func __FormMain_BuildMapDesktop()
	Return (@DesktopWidth - 100) & "x" & (@DesktopHeight - 150) ;
EndFunc   ;==>__FormMain_BuildMapDesktop
