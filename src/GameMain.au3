#include-once

#include <Array.au3>

#include <model\GameInfo.au3>

#include <game\FormMain.au3>
#include <game\FormGame.au3>
#include <game\GameControl.au3>


HotKeySet("{ESC}", "_Util_Exit");




Local Const $__ARRAY_NUMBER_ARGSGAMEINFO = [ _
		"Consecutive Numbers Game", _ ;Tên game
		"1.0.0", _ ; Version
		"ThienDz", _ ;Tác giả
		"ThomXg", _ ;Người iu tác giả
		"https://facebook.com/ThienDz.SystemError" _; Link Facebook liên hệ
	];
;model
Global $_oGameInfo = Null, _
		$_oMapGame = Null;
;game
Global $_oFormMain = Null, _
		$_oFormGame = Null;


__ThienYeuThom__Main();

Func __ThienYeuThom__Main()
	$_oGameInfo = _New_GameInfo($__ARRAY_NUMBER_ARGSGAMEINFO);
	;
	$_oFormMain = _New_FormMain();
	$_oFormMain._oGameInfo = $_oGameInfo;
	$_oFormMain._init();
	$_oFormMain._show();
	$_oFormMain._waitResult();
	;
	_Util_Tooltip("Mapping...", "wait a second...", $_oFormMain._getPosition());
	$_oMapGame = $_oFormMain._oMapGame;
	$_oMapGame._nMaps = _GameCtrl_BuildMap($_oMapGame);
	;
	_Util_TooltipReset();
	$_oFormMain._hide();
	;
	$_oFormGame = _New_FormGame();
	$_oFormGame._oGameInfo = $_oGameInfo;
	$_oFormGame._oMapGame = $_oMapGame;
	$_oFormGame._init();
	$_oFormGame._show();
	$_oFormGame._playGame();
EndFunc

