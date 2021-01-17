#include-once
#include <..\lib\AutoItObject.au3>
#include <..\util\ConstructArgs.au3>

Func _New_Map($__aArgs = Null)
	;
	$__object = IDispatch() ;
	$__object.__name = "Map" ;
	$__object.__des = "" ;
	$__object.__status = 1 ;
	;
	$__oArgs = _New_ConstructArgs($__aArgs) ;
	$__object._nX = $__oArgs.arg() ;
	$__object._nY = $__oArgs.arg() ;
	;
	$__object.__defineGetter("_toString", __Map_toString) ;
	$__object.__defineGetter("_getError", __Map_getError) ;
	;
	$__object.__lock() ;
	;
	Return $__object ;
EndFunc   ;==>_New_Map


Func __Map_getError($_oSelf)
	$__oParent = $_oSelf.parent ;
	Switch $__oParent.__status
		Case 1
			Return "Success" ;
	EndSwitch
EndFunc   ;==>_Map_errToString


Func __Map_toString($_oSelf)
	$__oParent = $_oSelf.parent ;
	Dim $__a = [$__oParent._nX, $__oParent._nY] ; list object here...
	Return _AutoItObject_ArrayToString($__oParent.__name, $__a) ;
EndFunc   ;==>_Map_toString





