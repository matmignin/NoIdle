

;::::::::::::::::::::BPCS

#IfWinActive, ahk_exe pcsws.exe
NumpadEnter::sendinput {enter}
Mbutton & Rbutton::sendinput %month%{right}%today%{right}%year%{right}{down}{left 8}
Numpadsub::sendinput 02%lotnumber%
Numpadmult::sendinput 02%batchNumber%
Numlock & Numpadmult::Sendinput {enter}{Down 6}{right 11}a{right 52}{down 3}%month%{right}%today%{right}%year%{left 51}{down 3}%BPCSdate%%BPCSdate%%BPCSdate%{down}
Numlock & Numpadsub::sendinput {enter}{Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}
Numpadadd & Numpadenter::sendinput {Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}{down 3}{left 8}
Numpadadd & Numpad0::sendinput {enter}{Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}{enter}02%lotnumber%
^Enter::sendinput {Down 6}{right 11}a{down 7}{left}%month%{right}%today%{right}%year%{right}{enter}02%lotnumber%
Numpadadd & Left::sendinput, b83{enter 2}api{enter}10{enter}
Numlock & Numpaddiv::sendinput, %BPCSuser%{tab}%bpcsPassword%{enter 2}b83{enter 2}api{enter}10{enter}
#IfWinActive, Signon to iSeries ahk_class #32770
Numlock & Numpaddiv::
sendinput, %BPCSpassword%{tab 3}%BPCSuser%{enter}
sleep 300
sendinput, %BPCSuser%{tab}%bpcsPassword%{enter 2}b83{enter 2}api{enter}10{enter}
return

;:::::::::::::::::::::::::::totalchorms

#IfWinActive, Audit Trail ahk_exe SeqEdit.exe
Numlock & numpaddiv::
sendinput, alch Std
ControlClick, Button3, Audit Trail ahk_exe SeqEdit.exe, OK,
login(totalChromeUser, totalChromePassword) 
sendinput, %DailyStdDate%
return

#ifwinactive, Electronic Signature ahk_class #32770 ahk_exe SeqEdit.exe
Numlock & numpaddiv::login(totalChromeUser, totalChromePassword)

;::::::::::EXEL


#IfWinActive, Find and Replace ahk_exe EXCEL.EXE
numpadEnter::sendinput, {alt down}i{alt up}
numpadsub::sendinput, {alt down}n{alt up}%lotnumber%
numpadadd & Numpadenter::sendinput {esc}{ctrldown}{right}{ctrlup}{right}P{ctrldown}f{CtrlUp}%lotnumber%

#ifwinactive, ahk_exe EXCEL.EXE
Numpadadd & numpad0::sendinput {ctrldown}f{ctrlup}{AltDown}th{altup}w{enter}{altdown}n{altup}%lotnumber%
Numpadadd & NumpadDot::sendinput {ctrldown}f{ctrlup}{AltDown}th{altup}w{enter}{altdown}n{altup}{Delete}
Capslock::CapsLock


/*

#ifwinactive, ahk_exe EXCEL.EXE
Numpadadd & numpadEnter::sendinput ^f{ctrlup}!t!hw{enter}!n%lotnumber%
Numpadadd & NumpadDot::sendinput {ctrldown}f{ctrlup}{AltDown}th{altup}w{enter}{altdown}n{altup}{Delete}
Capslock::CapsLock
Mbutton::sendinput ^-
Mbutton & WheelUp::send ^{up}
Mbutton & Wheeldown::send ^{down}

#IfWinActive, Find and Replace ahk_exe EXCEL.EXE
numpadEnter::send, !i{200}{esc}^{right}{right}P ;^f%lotnumber%
numpadsub::sendinput, !n%lotnumber%
*/
#Ifwinactive, Release update
\::Sendinput {tab}%lotnumber%
#ifwinactive, Property Grid Form
Mbutton::sendinput, {backspace 4}
NumpadEnter::
SendInput, {enter}{down 2}1
sleep 200
sendinput, {tab 2}{enter}
return

;:::::IR MACINE
#IfWinActive, PerkinElmer Spectrum ES
Numlock & Numpadmult::sendinput, %lotnumber% %Date%{left 8}
Numpadadd & NumpadEnter::
sendinput !m{down}{right}{enter}(200)
sleep 200
sendinput !m{enter}
return


;::::FIREFOX AND CHORME
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

;{:::::::::::::::::::::::::::::::::::::::open close close apps
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

;:::::: calculator
NumpadAdd & Numpad0::WinActivate, ahk_exe calc.exe


;:::::::::::AHK studio
#IfWinActive, ahk_class AutoHotkeyGUI
Mbutton::sendinput !r
F12::
sendinput, {ctrldown}s{ctrlup}
sleep 200
;sendinput {ctrldown}{f7}{ctrlup}
ExitApp
return
Mbutton & WheelDown::winactivate, STARLIMS10.Live

;:::::::::::::::::Microsoft SQL 
#IfWinActive, ahk_exe Ssms.exe
NumpadEnter::Sendinput {F5}
+enter::Sendinput {F5}
enter::sendinput {enter}


#IfWinActive, ahk_exe NAPS2.exe
	;:::::::save selected jpeg
Mbutton::Sendinput {Click, 447, 29}{100}s

#IfWinActive, 
Insert::
IfWinExist, ahk_exe NAPS2.exe
	winactivate, ahk_exe NAPS2.exe
sleep 100
sendinput {f6}{200}!{tab}
return