#Persistent
#SingleInstance force

sleep 300
#ifwinactive, ahk_exe Ssms.exe
		Sendinput ^s
		winactivate, Ahk2Exe for AutoHotkey ahk_class AutoHotkeyGUI
		sleep 200
		sendinput {c}c
		sleep 200
		winwait, Ahk2Exe ahk_class #32770 ahk_exe Ahk2Exe.exe, , 4
		if ErrorLevel
			{
				sleep 800
				sendinput {enter}
				Winminimize, Ahk2Exe for AutoHotkey ahk_class AutoHotkeyGUI
				run, H:\QC LAB\MH\beta4.exe
				return
			}
		else
			Send {enter}
			Winminimize, Ahk2Exe for AutoHotkey ahk_class AutoHotkeyGUI
			run, H:\QC LAB\MH\beta4.exe
			Return
	Mbutton::
		BlockInput, on
		sendinput, {esc}^{F2}
		sleep 200
		Blockinput, Off
		;sendinput, {esc}
		return
	Rbutton & WheelDown::
		BlockInput, on
		Sendinput, {F2}
		sleep 300
		BlockInput, off
		return
	Rbutton & WheelUp::
		BlockInput, on
		Sendinput, +{F2}
		sleep 300
		BlockInput, off
		return
	Rbutton & LButton::WinActivate, ahk_class IEFrame
Rbutton::Click, Right
	#ifwinactive,
