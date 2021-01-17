#include-once
#include <..\util\Utilities.au3>
#include <FormGame.au3>
#include <Array.au3>

Local $__GAMECTRL_RANGE_MAP = 50, _ ; khoảng cách giữa 2 số
		$__GAMECTRL_ALIGN_MAP = 15 ; khoảng cách số giữa lề


Func _GameCtrl_BuildMap($__oMapGame)
	$__nWidth = $__oMapGame._nWidth ;
	$__nHeight = $__oMapGame._nHeight ;
	$__nAmount = $__oMapGame._nAmount ;
	;
	Local $__bMaps = __GameCtrl_BuildMap_Map2dInit($__nWidth, $__nHeight) ;
	Local $__nMaps[$__nAmount][2] ;
	;
	For $__i = 0 To $__nAmount - 1
		$__nTmpPosX = -1 ;
		$__nTmpPosY = -1 ;
		Do
			$__nTmpPosX = _Util_Rand($__GAMECTRL_ALIGN_MAP - 1, $__nWidth - $__GAMECTRL_ALIGN_MAP - 1) ;
			$__nTmpPosY = _Util_Rand($__GAMECTRL_ALIGN_MAP - 1, $__nHeight - $__GAMECTRL_ALIGN_MAP - 1) ;
		Until $__bMaps[$__nTmpPosX][$__nTmpPosY] ;
		;
		__GameCtrl_BuildMap_SetPosExists($__bMaps, $__nTmpPosX, $__nTmpPosY) ;
		;
		$__nMaps[$__i][0] = $__nTmpPosX ;
		$__nMaps[$__i][1] = $__nTmpPosY ;
	Next
	;
	Return $__nMaps ;
EndFunc   ;==>_GameCtrl_BuildMap



Func __GameCtrl_BuildMap_SetPosExists(ByRef $__bMaps, $__nPosX, $__nPosY)

	$__nUboundX = UBound($__bMaps, 1) ;
	$__nUboundY = UBound($__bMaps, 2) ;

	$__bMaps[$__nPosX][$__nPosY] = False ;
	For $__i = 1 To $__GAMECTRL_RANGE_MAP ;
		;
		$__nTmp = $__nPosX - $__i < 0 ? 0 : $__nPosX - $__i ;
		$__bMaps[$__nTmp][$__nPosY] = False ; Left
		;
		$__nTmp = $__nPosX + $__i > $__nUboundX - 1 ? $__nUboundX - 1 : $__nPosX + $__i ;
		$__bMaps[$__nTmp][$__nPosY] = False ; Right
		;
		$__nTmp = $__nPosY - $__i < 0 ? 0 : $__nPosY - $__i ;
		$__bMaps[$__nPosX][$__nTmp] = False ; Bottom
		;
		$__nTmp = $__nPosY + $__i > $__nUboundY - 1 ? $__nUboundY - 1 : $__nPosY + $__i ;
		$__bMaps[$__nPosX][$__nTmp] = False ; Top
	Next
EndFunc   ;==>__GameCtrl_BuildMap_SetPosExists

Func __GameCtrl_BuildMap_Map2dInit($__nX, $__nY)
	Local $__bMaps[$__nX][$__nY] ;
	For $__i = 0 To $__nX - 1
		For $__j = 0 To $__nY - 1
			$__bResult = True ;
			If _
					$__i <= $_FORMGAME_ALIGNLEFT + $__GAMECTRL_ALIGN_MAP - 1 Or _
					$__j <= $_FORMGAME_ALIGNTOP + $__GAMECTRL_ALIGN_MAP - 1 Or _
					$__i >= $__nX - $__GAMECTRL_ALIGN_MAP - $_FORMGAME_ALIGNRIGHT Or _
					$__j >= $__nY - $__GAMECTRL_ALIGN_MAP - $_FORMGAME_ALIGNBOTTOM Then
				$__bResult = False ;
			EndIf
			$__bMaps[$__i][$__j] = $__bResult ;
		Next
	Next
	Return $__bMaps ;
EndFunc   ;==>__GameCtrl_BuildMap_Map2dInit
