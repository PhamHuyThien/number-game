#include-once

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#include <..\lib\AutoItObject.au3>
#include <..\util\ConstructArgs.au3>
#include <..\util\Utilities.au3>

Global $_FORMGAME_ALIGNTOP = 8, _
		$_FORMGAME_ALIGNLEFT = 8, _
		$_FORMGAME_ALIGNRIGHT = 8, _
		$_FORMGAME_ALIGNBOTTOM = 8 ;

Func _New_FormGame($__aArgs = Null)
	;
	$__object = IDispatch() ;
	$__object.__name = "FormGame" ;
	$__object.__des = "" ;
	$__object.__status = 1 ;
	;
	$__oArgs = _New_ConstructArgs($__aArgs) ;
	$__object._oGameInfo = $__oArgs.arg() ;
	$__object._oMapGame = $__oArgs.arg() ;
	;
	$__object._hGUI = $__oArgs.arg() ;
	$__object._hLbNumbers = $__oArgs.arg() ;
	$__object._nFindNext = 1 ;
	;
	$__object.__defineGetter("_toString", __FormGame_toString) ;
	$__object.__defineGetter("_getError", __FormGame_getError) ;
	;
	$__object.__defineGetter("_init", __FormGame_Init) ;
	$__object.__defineGetter("_show", __FormGame_Show) ;
	$__object.__defineGetter("_hide", __FormGame_Hide) ;
	$__object.__defineGetter("_playGame", __FormGame_PlayGame) ;
	;
	$__object.__lock() ;
	;
	Return $__object ;
EndFunc   ;==>_New_FormGame



Func __FormGame_Init($_oSelf) ;
	$__oMapGame = $_oSelf.parent._oMapGame ;
	;
	$__nWidth = $__oMapGame._nWidth ;
	$__nHeight = $__oMapGame._nHeight ;
	;
	GUICreate("GamePlayer", $__nWidth + $_FORMGAME_ALIGNLEFT + $_FORMGAME_ALIGNRIGHT, $__nHeight + 70) ;
	GUICtrlCreateGroup("Game Player", $_FORMGAME_ALIGNLEFT, $_FORMGAME_ALIGNTOP, $__nWidth, $__nHeight) ;
	;
	$__nMaps = $__oMapGame._nMaps ;
	$__nMapsSize = UBound($__nMaps) ;
	Local $__hLbNumberTmps[$__nMapsSize] ;
	For $__i = 0 To $__nMapsSize - 1
		$__hLbNumberTmps[$__i] = GUICtrlCreateLabel($__i + 1, $__nMaps[$__i][0], $__nMaps[$__i][1], 15, 15) ;
		GUICtrlSetFont(-1, $__oMapGame._nFontSize, 400, 0, $__oMapGame._sFont) ;
	Next
	$_oSelf.parent._hLbNumbers = $__hLbNumberTmps ;
	GUICtrlCreateGroup("Game Info", $_FORMGAME_ALIGNLEFT, $__nHeight + 15, $__nWidth, 41) ;
EndFunc   ;==>__FormGame_Init


Func __FormGame_Show($_oSelf)
	Return GUISetState(@SW_SHOW, $_oSelf.parent._hGUI) == 1 ;
EndFunc   ;==>__FormGame_Show



Func __FormGame_Hide($_oSelf)
	Return GUISetState(@SW_HIDE, $_oSelf.parent._hGUI) == 1 ;
EndFunc   ;==>__FormGame_Hide



Func __FormGame_PlayGame($_oSelf)
	$__hLbNumbers = $_oSelf.parent._hLbNumbers ;
	While 1
		$__nMsg = GUIGetMsg() ;
		;
		If $__nMsg == $GUI_EVENT_CLOSE Then
			_Util_Exit() ;
		EndIf
		;
		$__nCountNum = UBound($__hLbNumbers) ;
		For $__i = 0 To $__nCountNum - 1
			If $__nMsg == $__hLbNumbers[$__i] Then
				$__nValue = _Util_IsNumber(_Util_GetText($__hLbNumbers[$__i])) ;
				$__nFindNext = $_oSelf.parent._nFindNext ;
				If $__nValue == $__nFindNext Then
					$_oSelf.parent._nFindNext = $__nFindNext + 1 ;
					GUICtrlDelete($__hLbNumbers[$__i]) ;
				Else
					_Util_MsgWarning("Bạn cần tìm " & $__nFindNext & ", bạn chọn nhầm " & $__nValue) ;
				EndIf
			EndIf
		Next
		;
	WEnd
EndFunc   ;==>__FormGame_PlayGame


Func __FormGame_getError($_oSelf)
	$__oParent = $_oSelf.parent ;
	Switch $__oParent.__status
		Case 1
			Return "Success" ;
	EndSwitch
EndFunc   ;==>__FormGame_getError


Func __FormGame_toString($_oSelf)
	$__oParent = $_oSelf.parent ;
	Dim $__a = [] ; list object here...
	Return _AutoItObject_ArrayToString($__oParent.__name, $__a) ;
EndFunc   ;==>__FormGame_toString




