
;#include Variables.ahk


if (A_ComputerName = "NYC-QCLAB1-PC" or "NYC-QCLAB2-PC") {
	SetTimer, MalwareClose
}
IfWinactive, Ahk2Exe ahk_class #32770
{
	WinActivate, Ahk2Exe ahk_class #32770
	Send {enter}
	Winminimize, Ahk2Exe for AutoHotkey ahk_class AutoHotkeyGUI
}
IfWinExist, Ahk2Exe for AutoHotkey ahk_class AutoHotkeyGUI
	Winminimize, Ahk2Exe for AutoHotkeyahk_class AutoHotkeyGUI
sleep 200
WinActivate, STARLIMS10.Live

traytip, , Hit [ Home ] key for more info, 2
;}

;gosub, Experiment




MalwareClose:
	IfWinExist, OfficeScan
	WinClose, OfficeScan
	return
