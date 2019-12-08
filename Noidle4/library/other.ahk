
Any_Window:
#IfWinActive, 
Insert & home::
IfWinExist, ahk_exe NAPS2.exe
	winactivate, ahk_exe NAPS2.exe
sleep 100
sendinput {f6}{200}!{tab}
return
;_______________Options
#IfWinActive,
Numpadadd::Sendinput, {shift down}={shift Up}
NumpadSub::Sendinput -
Numpadadd & numpadsub::Sendinput, %Lotnumber%
Numpadadd & numpadmult::Sendinput, %batchNumber%
Numlock & Numpaddiv::login(PDIUser, PDIPassword)
Home::Msgbox, , Things to do, %HelpBox%
Insert & Numpad0::
InputBox, FillerZeros, Lot Code, enter redundent digits in Lot code that follow %year%   , , 240, 180,, 0000
Lotnumber = %Year%%FillerZeros%


Vim_Controls:
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

F11 & F12::
sendinput ^s
Reload
return

F11::SENDINPUT {f11}





ScannerApp:
#IfWinActive, ahk_exe NAPS2.exe

	numpadadd::
	Mbutton::Sendinput {Click, 447, 29}{100}s  	;:save selected jpeg
	Numpadsub::Sendinput {delete}
	Mbutton & Rbutton::sendinput, {click}{delete}{200}{enter}
	#IfWinActive, Save As ahk_exe NAPS2.exe
	Numlock::sendinput {escape}

BPCS:
#IfWinActive, ahk_exe pcsws.exe
	insert::send, {AltDown}fp{AltUp}  ;print screen
	Numpadsub::sendinput 02%lotnumber%
	Numpadmult::sendinput 02%batchNumber%
	NumpadEnter::sendinput {enter}
	numlock & insert::send, {enter}{AltDown}fp{AltUp}{f3}  ; print screen of lot number and return
	numpaddiv::
	Mbutton & Rbutton::sendinput %month%{right}%today%{right}%year%{right}{down}{left 8} ;input todays date
	Numlock & Numpadmult::Sendinput {enter}{Down 6}{right 11}a{right 52}{down 3}%month%{right}%today%{right}%year%{left 51}{down 3}%BPCSdate%%BPCSdate%%BPCSdate%{down}
	Numlock & Numpadsub::sendinput {enter}{Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}
	Numpadadd & Numpadenter::sendinput {Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}{down 3}{left 8}
	Numpadadd & Numpad0::sendinput {enter}{Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}{enter}02%lotnumber%
	;^Enter::sendinput {Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}{enter}02%lotnumber%
	Numpadadd & Left::sendinput, b83{enter 2}api{enter}10{enter}
	Numlock & Numpaddiv::sendinput, %BPCSuser%{tab}%bpcsPassword%{enter 2}b83{enter 2}api{enter}10{enter}
#IfWinActive, Signon to iSeries ahk_class #32770
	Numlock & Numpaddiv::
	sendinput, %BPCSpassword%{tab 3}%BPCSuser%{enter}
	sleep 300
	sendinput, %BPCSuser%{tab}%bpcsPassword%{enter 2}b83{enter 2}api{enter}10{enter}
	return


TotalChorms:
#IfWinActive, Audit Trail ahk_exe SeqEdit.exe
	Numlock & numpaddiv::
	sendinput, alch Std
	ControlClick, Button3, Audit Trail ahk_exe SeqEdit.exe, OK,
	login(totalChromeUser, totalChromePassword) 
	sendinput, %DailyStdDate%
	return

#ifwinactive, Electronic Signature ahk_class #32770 ahk_exe SeqEdit.exe
Numlock & numpaddiv::login(totalChromeUser, totalChromePassword)

EXEL:
#IfWinActive, ahk_exe EXCEL.EXE
	Numlock::Sendinput, {f2}
#IfWinActive, Find and Replace ahk_exe EXCEL.EXE
	numpadEnter::sendinput, {alt down}i{alt up}
	numpadsub::sendinput, {alt down}n{alt up}%lotnumber%
	numpadadd & Numpadenter::sendinput {esc}{ctrldown}{right}{ctrlup}{right}P{ctrldown}f{CtrlUp}%lotnumber%
	Numpadadd & numpad0::Return
	Numpadadd & NumpadDot::return
#ifwinactive, ahk_exe EXCEL.EXE
	Numpadadd & numpad0::sendinput {ctrldown}f{ctrlup}{AltDown}th{altup}w{enter}{altdown}n{altup}%lotnumber%
	Numpadadd & NumpadDot::sendinput {ctrldown}f{ctrlup}{AltDown}th{altup}w{enter}{altdown}n{altup}{Delete}
	Capslock::CapsLock
#Ifwinactive, Release update
	Numpadadd::
		\::Sendinput {tab}%lotnumber%
#ifwinactive, Property Grid Form
	Mbutton::sendinput, {backspace 4}
	NumpadEnter::
		SendInput, {enter}{down 2}1
		sleep 200
		sendinput, {tab 2}{enter}
		return


IR_machine:
#IfWinActive, PerkinElmer Spectrum ES
	Numlock & Numpadmult::sendinput, %lotnumber% %Date%{left 8}
	Numpadadd & NumpadEnter::
	sendinput !m{down}{right}{enter}(200)
	sleep 200
	sendinput !m{enter}
	return


FIREFOX_and_CHORME:
#IfWinActive, iCloud 
Tab::sendinput {space 4}
#IfWinActive, ahk_exe chrome.exe
!space::
WinGet MMX, MinMax, ahk_class IEFrame
IfEqual MMX,-1, WinRestore, ahk_class IEFrame
IfEqual MMX,1, WinActivate, ahk_class IEFrame
Return
#IfWinActive, ahk_exe firefox.exe
Capslock::return





Open_Close_Apps:
#IfWinActive, ahk_exe chrome.exe
Mbutton & WheelDown::WinActivate, ahk_exe xv.exe

#IfWinActive, ahk_exe AcroRd32.exe
Numlock & pgup::
WinClose, ahk_exe AcroRd32.exe
sleep 200
Winclose, Attachments
Return
#IfWinActive, ahk_exe EXCEL.EXE
Numlock & pgup::
WinClose, ahk_exe EXCEL.EXE
sleep 200
Winclose, Attachments
Return
#IfWinActive, ahk_exe WINWORD.EXE
Numlock & pgup::
WinClose, ahk_exe WINWORD.EXE
sleep 200
Winclose, Attachments
Return
;}

calculator:
NumpadAdd & Numpad0::WinActivate, ahk_exe calc.exe


AHK_studio:
#IfWinActive, ahk_class AutoHotkeyGUI
Mbutton::sendinput !r
F12::
sendinput, {ctrldown}s{ctrlup}
sleep 200
;sendinput {ctrldown}{f7}{ctrlup}
ExitApp
return
Mbutton & WheelDown::winactivate, STARLIMS10.Live

Microsoft_SQL: 
#IfWinActive, ahk_exe Ssms.exe
NumpadEnter::Sendinput {F5}
+enter::Sendinput {F5}
enter::sendinput {enter}

/*
	;Screen locations
	ClickLink(ScreenLocation) {
		mouseGetPos, Xpos, Ypos
		click, %screenLocation%, 
		MouseMove, Xpos, Ypos
		
		
		
		old select folder thing
		WinwaitActive, Open ahk_class #32770
		sendinput, {shiftdown}{tab 3}{shiftup}%pick%
		sleep 100
		send {space}{TAB}{space}
		sendinput, {tab}
		sleep 300
		winwaitclose, Open ahk_class #32770 ahk_exe xv.exe
		sleep 300
		WinWaitActive ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe, , 3
		if ErrorLevel {
			sleep 00
			Winactivate, ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
			sleep 100
			ControlClick, Done, ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
			return
		}
		else
			Cont