;|||||||||||||||||||||EXCEL
SetTimer, CheckBecameActive, 500

Return



CheckBecameActive:
IfWinActive,  Release update  2019 - Excel ahk_exe EXCEL.EXE
    SetCapsLockState, On
else,
  SetCapsLockState, OfF
return




#IfWinActive, Find and Replace ahk_exe EXCEL.EXE
	numpadEnter::sendinput, {alt down}i{alt up}
	numpadsub::sendinput, {alt down}n{alt up}%lotnumber%
	numpadadd & Numpadenter::sendinput {esc}{ctrldown}{right}{ctrlup}{right}P{ctrldown}f{CtrlUp}%lotnumber%

#ifwinactive, ahk_exe EXCEL.EXE
	Numpadadd & numpad0::sendinput {ctrldown}f{ctrlup}{AltDown}th{altup}w{enter}{altdown}n{altup}%lotnumber%
	Numpadadd & NumpadDot::sendinput {ctrldown}f{ctrlup}{AltDown}th{altup}w{enter}{altdown}n{altup}{Delete}
	Capslock::CapsLock

Numlock & Numpadadd::
	IfWinExist, Mat Worksheets - Excel ahk_exe EXCEL.EXE
		winactivate, Mat Worksheets - Excel ahk_exe EXCEL.EXE

	else
		run, H:\QC LAB\MH\Mat Worksheets.xlsx
	return

;}

#Ifwinactive, Release update  2019 - Excel ahk_exe EXCEL.EXE
Capslock::SetCapsLockState, Off

#ifwinactive,
Numlock & Numpad0::
	IfWinExist, Release update  2019 - Excel ahk_exe EXCEL.EXE
	{
		winactivate,Release update  2019 - Excel ahk_exe EXCEL.EXE
		SetCapsLockState, On
	}
	return




#IfWinActive,
up & /::Sendinput ?
up::Sendinput {up}
+Capslock::
SetTimer, CheckBecameActive, Off
SetCapsLockState, on
return
Capslock::SetTimer, CheckBecameActive, 600




Capslock & j::sendinput {down}
Capslock & k::sendinput {up}
Capslock & h::sendinput {left}
Capslock & l::sendinput {right}
Capslock & x::sendinput {Delete}
Capslock & 4::sendinput {end}
Capslock & 6::sendinput {Home}
Capslock & w::sendinput {CtrlDown}{right}{CtrlUp}
Capslock & d::sendinput {home}{SHIFTDown}{end}{shiftUp}{delete}
Capslock & o::sendinput {end}{return}{down}
Capslock & b::sendinput {CtrlDown}{left}{CtrlUp}



;||||||||||||||||Microsoft SQL

#IfWinActive, ahk_exe ahk_exe Ssms.exe
F11::
		sendinput, {ctrldown}s{ctrlup}
		run, H:\QC LAB\MH\Stuff\AHK\EditCode.exe
		ExitApp
		Return

numpadenter::
+enter::Sendinput {F5}
enter::sendinput {enter}





;||||||||||||||||||||Chrome

#IfWinActive, ahk_exe chrome.exe
Mbutton & WheelDown::WinActivate, ahk_exe xv.exe
#IfWinActive, iCloud Notes - Google Chrome
	Tab::sendinput {space 4}

#IfWinActive, ahk_exe chrome.exe
	!space::
		WinGet MMX, MinMax, ahk_class IEFrame
		IfEqual MMX,-1, WinRestore, ahk_class IEFrame
		IfEqual MMX,1, WinActivate, ahk_class IEFrame
		Return





;||||||||||||||||Firefox

#IfWinActive, ahk_exe firefox.exe
;rbutton::mouseclick, R
;rbutton & Wheeldown:: sendinput {ctrldown}w{ctrlup}
;rbutton & Wheelup:: WinActivate, STARLIMS10.Live (Master) ahk_exe xv.exe
Capslock::return
Capslock & j::sendinput {down}
Capslock & k::sendinput {up}
Capslock & h::sendinput {left}
Capslock & l::sendinput {right}
Capslock & x::sendinput {Delete}
Capslock & 4::sendinput {end}
Capslock & 6::sendinput {Home}
Capslock & w::sendinput {CtrlDown}{right}{CtrlUp}
Capslock & d::sendinput {home}{SHIFTDown}{end}{shiftUp}{delete}
Capslock & o::sendinput {end}{return}{down}
Capslock & b::sendinput {CtrlDown}{left}{CtrlUp}



#IfWinActive, iCloud Notes - Mozilla Firefox
	Tab::sendinput {space 4}

;{:::::::::::::::::::::::::::::::::::::other programs



#ifwinactive, Property Grid Form
	Mbutton::sendinput, {backspace 4}
	NumpadEnter::
	SendInput, {enter}{down 2}1
	sleep 200
	sendinput, {tab 2}{enter}
	return




;|||||||||||||||||BPCS
#IfWinActive, ahk_exe pcsws.exe
	NumpadEnter::sendinput {enter}
	Mbutton & Rbutton::sendinput %month%{right}%today%{right}%year%{right}{down}{left 8}
	F6::
	Numpadsub::sendinput 02%lotnumber%
	F5::
	numpadmult::sendinput 02%bulkliquid%
	Numlock & Numpadmult::
	Sendinput {enter}{Down 6}{right 11}a{right 52}{down 3}%month%{right}%today%{right}%year%
	sendinput {left 51}{down 3}%BPCSdate%%BPCSdate%%BPCSdate%{down}
	return
Numlock & Numpadsub::sendinput {enter}{Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}
F7::
Numpadadd & Numpadenter::sendinput {Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}{down 3}{left 8}
Numpadadd & Numpad0::sendinput {enter}{Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}{enter}02%lotnumber%
^Enter::sendinput {Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}{enter}02%lotnumber%
Numpadadd & Left::sendinput, b83{enter 2}api{enter}10{enter}
F11 & F12::
Numlock & Numpaddiv::sendinput, houghm{tab}%bpcsPassword%{enter 2}b83{enter 2}api{enter}10{enter}
#ifwinactive,

#IfWinActive, Signon to iSeries ahk_class #32770
	F11 & F12::
	Numlock & Numpaddiv::
		sendinput, %BPCSpassword%{tab 3}houghm{enter}
		sleep 300
		sendinput, houghm{tab}%bpcsPassword%{enter 2}b83{enter 2}api{enter}10{enter}
		return
	#ifwinactive



;||||||||||||||||||||||TotalChrome

#IfWinActive, PerkinElmer Spectrum ES
	Numlock & Numpadadd::sendinput, %lotnumber% %Date% MH{left 10}
	Numpadadd & NumpadEnter::
		sendinput !m{down}{right}{enter}
		sleep 200
		sendinput !m{enter}
		return
		#IfWinActive
		#Ifwinactive, Release update
		\::
		Numpadadd::Sendinput {tab}%lotnumber%
	#ifwinactive

#IfWinActive, Audit Trail ahk_exe SeqEdit.exe
Numlock & numpaddiv::
  sendinput, daily Std
  ControlClick, Button3, Audit Trail ahk_exe SeqEdit.exe, OK,
  sleep 200
  sendinput mat{tab}kilgore7744{enter}
  sleep 200
  sendinput, %DailyStdDate%{enter}
return

#ifwinactive, Electronic Signature ahk_class #32770 ahk_exe SeqEdit.exe
Numlock & numpaddiv::sendinput mat{tab}kilgore7744{enter}








;||||||||||||||||scanner

#ifwinactive, EPSON Scan
	Numpadsub::Winactivate, STARLIMS10.Live (Master)
	NumpadMult::Winactivate, STARLIMS10.Live (Master)
	#IfWinActive

;||||||||||||||||||Calculator

#ifwinnotexist, ahk_exe calc.exe
	F10::
	NumpadAdd & Numpad0::
		Run, Calc.exe
		calctype = 1
		return
		#ifwinnotexist
	NumpadAdd & Numpad0::
		{
		If (calctype  = 1) {
		sendinput ^e
		Sendinput a
		calctype = 0
		}
		else if (Calctype = 0) {
		Sendinput ^{F4}
		Calctype = 1
		}
		}
		return
	Numlock::Delete

#IfWinExist, ahk_exe calc.exe
	NumpadAdd & Numpad0::
		WinActivate, ahk_exe calc.exe
		return
		#ifwinactive

;|||||||||||||||||Notepad
#IfWinActive, ahk_exe notepad.exe

	Tab::sendinput {space 4}
	Mbutton & WheelDown::
		WinGet MMX, MinMax, ahk_class IEFrame
		IfEqual MMX,-1, WinRestore, ahk_class IEFrame
		IfEqual MMX,1, WinActivate, ahk_class IEFrame
		Return
	#IfWinActive





#ifwinactive, ahk_class SciTEWindow
F11::
		run, H:\QC LAB\MH\Stuff\AHK\EditCode.exe
		ExitApp
		Return






;{:::::::::::::::::::::::::::::::::::::::open close close apps :::::::::::::::::
#ifwinactive, Mat Worksheets - Excel ahk_exe EXCEL.EXE
Launch_App2::WinMinimize,
#ifwinactive, Mail ahk_exe iexplore.exe
Launch_Mail::WinMinimize,
#ifwinactive, STARLIMS10.Live (Master) ahk_exe xv.exe
Mbutton & Rbutton::^LButton
Browser_Home::WinMinimize,
#ifwinactive, ahk_exe pcsws.exe
Launch_App2::WinMinimize,

#ifwinactive,
Launch_App2::WinActivate, ahk_exe pcsws.exe
Browser_Home::
Mbutton & Rbutton::^LButton
Launch_Mail::winactivate, Mail ahk_exe iexplore.exe










