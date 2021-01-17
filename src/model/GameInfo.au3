#include-once
#include <..\lib\AutoItObject.au3>
#include <..\util\ConstructArgs.au3>

Func _New_GameInfo($__aArgs = Null)
	;
	$__object = IDispatch() ;
	$__object.__name = "GameInfo" ;
	$__object.__des = "" ;
	$__object.__status = 1 ;
	;
	$__oArgs = _New_ConstructArgs($__aArgs) ;
	$__object._sName = $__oArgs.arg()
	$__object._sVersion = $__oArgs.arg()
	$__object._sAuthor = $__oArgs.arg()
	$__object._sGirlFriendAuthor = $__oArgs.arg()
	$__object._sUrlFacebook = $__oArgs.arg()
	;
	$__object.__defineGetter("_toString", __GameInfo_toString) ;
	$__object.__defineGetter("_getError", __GameInfo_getError) ;
	;
	$__object.__lock() ;
	;
	Return $__object ;
EndFunc   ;==>_New_GameInfo


Func __GameInfo_getError($_oSelf)
	$__oParent = $_oSelf.parent ;
	Switch $__oParent.__status
		Case 1
			Return "Success" ;
	EndSwitch
EndFunc   ;==>_GameInfo_errToString


Func __GameInfo_toString($_oSelf)
	$__oParent = $_oSelf.parent ;
	Dim $__a = [$__oParent._sName, $__oParent._sVersion, $__oParent._sAuthor, $__oParent._sGirlFriendAuthor, $__oParent._sUrlFacebook] ; list object here...
	Return _AutoItObject_ArrayToString($__oParent.__name, $__a) ;
EndFunc   ;==>_GameInfo_toString





