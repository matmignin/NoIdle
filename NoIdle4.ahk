Version = 4.16

#Persistent
#SingleInstance force
#noenv
SetNumlockState AlwaysOn
coordmode, mouse,Client
SetKeyDelay, 100
SetDefaultMouseSpeed, 0
DetectHiddenText, On
SetTitleMatchMode, 2
SetTimer, MoveMouse
traytip, , [ Home ] key for more info,
;Menu, Tray, Icon, library\Fish.ico,

FileReadLine, PDIuser, %A_Desktop%\loginfo.txt, 1
FileReadLine, PDIPassword, %A_Desktop%\loginfo.txt, 2
FileReadLine, BPCSuser, %A_Desktop%\loginfo.txt, 3
FileReadLine, BPCSPassword, %A_Desktop%\loginfo.txt, 4
FileReadLine, totalChromUser, %A_Desktop%\loginfo.txt, 5
FileReadLine, totalChromPassword, %A_Desktop%\loginfo.txt, 6

;Screen locations
ClickLink(ScreenLocation) {
click, %screenLocation%


}

samplegroup = 268, 83
Search = 70, 60
select = 45, 73
Add = 55, 55
PVAttachment = 650, 334
SGAttachment = 350, 316
pickScanner = sc
pickComponent = com
ChangeRep = 673, 316
ReleaseRun = 771, 142
AdjustA = L, 97, 120, 115, 122, 2
AdjustB = L, 96, 342, 2


BatchTemplateLink = WindowsForms10.STATIC.app.0.33c0d9d4, ahk_class WindowsForms10.Window.8.app.0.33c0d9d, Select Login Method, Batch Template, left, 1 
AutoSelectCombobox = WindowsForms10.COMBOBOX.app.0.33c0d9d1
AutoSelectWindow = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
AttachmentWindow = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
Window_LotTemplateLogin = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
Control_SampleGroupTemplateBox = WindowsForms10.COMBOBOX.app.0.33c0d9d2
Control_SampleGroupBox = WindowsForms10.COMBOBOX.app.0.33c0d9d1 
Click_SampleGroupTemplate = 700, 80
Click_SampleGroupBox = 220, 80




Adobe = AcroRd32.exe
Excel = EXCEL.EXE
Window = WINWORD.EXE

FormatTime, Year,,yy
FormatTime, Today,, dd
FormatTime, Month,, MM
Formattime, Date,, MMddyy
JulianMonth := ["A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M"]
LetterMonth := JulianMonth[month]
SingleYear = %year%{left}{backspace}{right}
dailyStdDate = alch{space}std{space}%month%%today%%year%{space}MH
BPCSdate = %month%{right}%today%{right}%year%{right}{down}{left 8}
batchNumber = %singleYear%%lettermonth%
Lotnumber = %Year%000

HelpBox = 
( 	
____________ View Process Sample Tab  `n
-Press [ NumPad( / ) ]  to search for an Item Number `n 
-Press [ NumPad( * )  ]  to  search for Bulk Liquid `n 
-Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n 
____________ Create Batch Tab`n`n (wont) always work the 1st time)`n 
-Press [ NumPad( * ) ]  to create Bulk Liquid batch `n 
-Press [ NumPad( - ) ] to create a Raw Material  `n`n 
____________ My Service Group Pending Test Tab  `n 
-Press [ End ] to make the Run# column fit `n 
-Press [ NumPad( - ) ]  to search for a Raw Material `n 
-Press [ Middle Click ] or [ Numpad( + ) & Numpad( Enter ) ] to auto-select result`n 
-Press ""and"" Roll [ Mouse Wheel Down ] to attatch a file `n`n 
____________ Miscellaneous  `n
-The [ Numpad( Enter ) ] is usable in more places `n 
-Press [ Numpad( + ) & Numpad( 0 ) ] at the same time to open the calculator`n 
-Press [ Insert ] to set the digits in the middle of the lot# 
         (currently: `"%lotnumber%___`") `n`n`n`n`n 
ver. %version%
)




Adjust_Columns() {
	MouseClickDrag, L, 97, 120, 115, 122, 2
	sleep 250
	Mouseclick, L, 96, 342, 2
	Mouseclick, L, 96, 342, 2
	sleep 200
	loop, 300
		sendinput {WheelUp}
	return
}


Attatch(SGattachment, PVattachment, pick) {  ;|||||||||||||||||middle mouse & wheeldown / numpad add + dot
	global
	click, %SGattachment% Left, 1
	WinWait, Attachments, , 0.5
	if ErrorLevel
	{
		click, %PVattachment% Left, 1
		WinWait, Attachments, , 2
		if ErrorLevel
		{
			exit
		}
		Else
			Click, %add% left, 1
		WinWait, Open, , 3
		if ErrorLevel
		{
			return
		}
		Else
			sleep 200
		Blockinput, On
		send, {shiftdown}{tab 3}{shiftup}
		sleep 100
		SEND, %pick%
		send {space}{tab}{space}
		Blockinput, off
		return
	}
	Else
		Click, %add% left, 1
	WinWait, Open, , 2
	if ErrorLevel
	{
		return
	}
	Else
		sleep 200
	sendinput, {shiftdown}{tab 3}{shiftup}%pick%
	sleep 100
	send {space}{TAB}{space}
	sendinput, {tab}
	sleep 300
	winwaitclose, Open ahk_class #32770 ahk_exe xv.exe
	sleep 300
	winwait, ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe, , 3
	if ErrorLevel {
		sleep 00
		Winactivate, ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
		sleep 100
		ControlClick, Done, ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
		return
	}
	else
		ControlClick, Done, ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
	return
	
}
AttatchCOA(PVattachment) {   ;||||||||||||||||Attatch COA loops
	global
	click, %PVattachment% Left, 1
	sleep 400
	WinWait, Attachments, , 5
	if ErrorLevel
	{
		sleep 300
		Click, %add% left, 1
		sleep 200
		return
	}
	Else
		SLEEP 200
		Click, %add% left, 1
		sleep 200
		WinWait, Open, , 4
	if ErrorLevel
	{
		sleep 300
		Click, %add% left, 1
		return
	}
	Else
		sleep 300
		Blockinput, On
			send {shiftdown}{tab 3}{shiftup}
			sleep 100
			send sc{sPACE}
			send {tab}{space}
			sleep 300
			sendinput %GoDown%
			COAcount-=1
			GoDown = {down %COAcount%}
		Blockinput, off
	return
}
SubmitAttatchment() {
	Sendinput {enter}
	sleep 300
	winwait, Attachments, , 4
	if ErrorLevel {
		sleep 400
		Winclose, Attachments
		return
	}
	else
	sleep 200
	Winclose, Attachments
	return
}

Raw_MaterialCOA(select, x) {   ;||||||||||||||||numpad subtract
	global
	Click, %select% Left, 1
	winwait, Select batches, , 3
	if ErrorLevel
			return
	Else
	;IfWinActive, Select batches,
	;	{
			sleep 200
			sendinput {tab 3}%lotnumber%
			sendinput % COAnumber[x]
			sleep 800
			sendinput {altdown}o{altup}
			return
}





Auto_Select(AutoSelectWindow, AutoSelectCombobox) {
	global 								;|||||||||||||||| Numpadmult + # change reps
	WinWaitActive, Resent List, , 3
	if ErrorLevel {
		Send {down}
		sleep 200
		exit
	}
	else
	{
		ControlGet, ItemList, List,, % AutoSelectCombobox, % AutoSelectWindow
		Selection := StrSplit(ItemList, "`)`n")
		Done := "Done"
		Void := "voids"
		if InStr(Selection[1], Done)
		{
			Pick := Selection[1]
		}
		else if InStr(Selection[2], Done)
		{
			Pick := Selection[2]
		}
		else if InStr(Selection[3], Done)
		{
			Pick := Selection[3]
		}
		else if InStr(Selection[4], Done)
		{
			Pick := Selection[4]
		}
		else 
		{
			sendinput, m
		}
		Control, ChooseString, % Pick, % AutoSelectCombobox, % AutoSelectWindow
		sleep 300
		send {enter}
		sleep 300
		return
	}
	
}


MultipleAutoSelect(NumberOfEntries) {
	Global
	loop, %NumberOfEntries% {
		sendinput, {space}
		Auto_Select(AutoSelectWindow, AutoSelectCombobox)
		sleep 200
	}
}	 


Login(user, password) {
	Sendinput %user%{tab}{200}%password%{enter}
	sleep 200
	return
}










ReplicateByNine(NumberOfReps)	{
	loop %NumberOfReps% {
		Inputbox, MultiEnter%A_Index%, Type measurment number %A_index% value to enter 9x,, , 300, 100, , 0
	}
	loop %NumberOfReps% {
		ToEnter := MultiEnter%A_index%
		loop 9 {
			Sendinput, %ToEnter%{up}{left 2}{down 2}
		}
	}
}

Change_Rep(changerep, Reps, numberOf) {  ;|||||||||||||||| Numpadmult + # change reps
	mousegetpos xx, yy
	;yy -= 18
	loop, %numberOf%
	{
		sleep 200
		sendinput {Lbutton}
		click, %changerep% Left, 1
		sleep 200
		WinWait, Replicates Number, , 3
		if ErrorLevel
		{
			sleep 200
			click, %changerep% Left, 1
			sleep 200
		}
		Else
			sleep 600
		sendinput %Reps%{tab}{space}
		yy += 18
		sleep 600
		mousemove %xx%, %yy%
		sendinput {Lbutton}
		;sendinput {down}
		sleep 200
	}
	return
}






ReviewRun() {
	Click, %ReviewAttachmentA%. Left, 1
	WinWait, Attachments, , 2
	if ErrorLevel {
		Click, %ReviewAttachmentB%  Left, 1
		return
	}
	sleep 200
	WinMove, Attachments,, 861, 605, 798, 385
	Sendinput {tab 3}{enter}
	
	WinWait, ahk_exe AcroRd32.exe, , 2
	if ErrorLevel {
		msgbox, there is no attatchment
		sleep 200
		winclose, Attachments
		return
	}
	WinMove, ahk_exe AcroRd32.exe,, 5, 332, 950, 684
	Winwait, STARLIMS10.Live (Master)
	return
}


ReviewRunLoop() {
	InputBox, ReviewRunLoop, how many,, , 240, 180
	if ErrorLevel
		Return
	Loop, %reviewRunLoop%
	{
		Click, 771, 144 Left, 1
		sleep 9000
		winwait, Warning, , 4
		if errorlevel {
			sleep 2000
			sendinput {down}
			sleep 5000
			continue
		}
		else {
			winclose, Warning
			sleep 2000
			sendinput {down}
		}
		sleep 5000
	}
	return
}


CreateBatch() {
	global
	firstNumber =
	SampleGroupSelection =
	InputBox, itemNumber, Item Number, Enter the Item Number., , 240, 180
	WinActivate, Select Login Method		
	firstNumber := substr(itemNumber, 1,1)
	if ErrorLevel
		exit
	else
		send {tab}{tab}{100}{enter}
	sleep 500
	click, 220, 80 
	if firstNumber contains 4 
		send bu{esc}
	if firstNumber not contains 4
		send ra{esc}
	sleep 600
	Click, 700, 80
	ControlGet, MatCodeList, List,, WindowsForms10.COMBOBOX.app.0.33c0d9d2, ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	control, ChooseString, %itemNumber%, WindowsForms10.COMBOBOX.app.0.33c0d9d2, ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	sendinput {enter}{tab}
	sleep 200
	if firstNumber contains 4 
		sendinput %batchNumber%
	if firstNumber not contains 4
		Sendinput %lotnumber%
	}
	
	
	
	Bulk_Liquid(select, samplegroup, grouptemplate) { 
	global
	Click, %select% Left, 1
	winwait, Select batches, , 3
	if ErrorLevel
		return
	IfWinActive, Select batches,
	{
		sleep 200
		sendinput {tab 3}%batchNumber%
		return
	}
	Else
	{
		sleep 200
		ifwinactive, Select Login Method
		{
			sleep 300
			CreateBatch()
			return
		}
	}
}

	
Raw_Material(select, samplegroup, grouptemplate) {   
	global
	Click, %select% Left, 1
	winwait, Select batches, , 3
	if ErrorLevel
		return
	Else
		IfWinActive, Select batches,
		{
			sleep 200
			sendinput {tab 3}%lotnumber%
			return
		}
	Else
	{
		sleep 200
		ifwinactive, Select Login Method
		{
			sleep 300
			CreateBatch()
			return
		}
	}
}
Item_Number(select) { 
			global
			Click, %select% Left, 1
			winwait, Select batches, , 3
			if ErrorLevel
				return
			Else
				sendinput {right}{tab 2}{enter}{right}mat{space}{enter}{tab 2}{down 3}{right 4}
			return
	}


AnyWindow:
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


;:::::::::::::::::::: Vim controls
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

MoveMouse:
If ( A_TimeIdle > 99999 ) {
	MouseMove, 1 , 1,, R
	MouseMove, -1,-1,, R
}
return


ScannerApp:
#IfWinActive, ahk_exe NAPS2.exe
	;:::::::save selected jpeg
numpadadd::
Mbutton::Sendinput {Click, 447, 29}{100}s
Numpadsub::Sendinput {delete}
Mbutton & Rbutton::sendinput, {click}{delete}{200}{enter}
#IfWinActive, Save As ahk_exe NAPS2.exe
Numlock::sendinput {escape}


;::::::::::::::::::::BPCS

#IfWinActive, ahk_exe pcsws.exe
insert::send, {AltDown}fp{AltUp}

numlock & Numpad0::send, {enter}{AltDown}fp{AltUp}{f3}
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
;}
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





return





STARLIMS:
#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
NumpadSub::Raw_Material(select, samplegroup, grouptemplate)
NumpadDiv::Item_Number(select)
NumpadMult::Bulk_Liquid(select, samplegroup, grouptemplate)
End::Adjust_Columns()

Mbutton::   ;||||||||||  autoselect result
Click,
Click, 2
Auto_Select(AutoSelectWindow, AutoSelectCombobox)
return 

NumpadAdd & Numpad1::MultipleAutoSelect(1)
NumpadAdd & Numpad2::MultipleAutoSelect(2)
NumpadAdd & Numpad3::MultipleAutoSelect(3)
NumpadAdd & Numpad4::MultipleAutoSelect(4)
NumpadAdd & Numpad5::MultipleAutoSelect(5)
;::::change test replicates
Numpadmult & numpad0::Change_Rep(changerep, 10, 4)
Numpadmult & numpad1::Change_Rep(changerep, 1, 1)
Numpadmult & numpad2::Change_Rep(changerep, 2, 1)

;::::repeat multiple auto select results
NumpadAdd & NumpadEnter::
sendinput, {space}
Auto_Select(AutoSelectWindow, AutoSelectCombobox)
return

;:::attatch a file
;Numpadadd & Numpaddot::
Mbutton & WheelDown::Attatch(SGattachment, PVattachment, pickScanner)
Mbutton & Wheelup::
Attatch(SGattachment, PVattachment, pickComponent)
sleep 100
sendinput, {ctrldown}e{ctrlup}
return


; ::::::::::auto add scanned COAs
Numpadsub & Numpaddot:: 
InputBox, COAcount, COA, how many COAs , , 240, 180,, 0000
NumberofCOA = %COAcount%
COAcount-=1
GoDown = {down %COAcount%}
sleep 300
Raw_Material(select, samplegroup, grouptemplate)
sleep 300
AttatchCOA(PVattachment)
winwait, Select batches
keywait, NumpadEnter
SubmitAttatchment()
sleep 400
IfWinActive, Attachments
	Winclose, Attachments
return

;  ||||||||||auto attach COA
NumpadAdd & NumpadDot:: 
Raw_Material(select, samplegroup, grouptemplate)
WinWaitClose, Select batches
sleep 1500
AttatchCOA(PVattachment)
return 


return   
LotTemplateLogin:
#ifwinactive, Lot template login,
numpadenter::!o
Enter::!o


SelectBatches:
#IfWinActive, Select batches
	;:::::::::select batches/lots/material number
/*
NumpadAdd::
Click, %Search% left, 1
if swap_code is 0
	sendinput {tab 3}%BatchNumber%
if swap_code is 1
	sendinput {tab 3}%lotnumber%
*/
Numlock & numpadmult::

sendinput {tab 3}%BatchNumber%
return
Numlock & Numpadsub::
Click, %Search% left, 1
sendinput {tab 3}%lotnumber%
return
Numpaddiv::
Click, %Search% left, 1
sendinput {right}{tab 2}{enter}{right}mat{space}{enter}{tab 2}{down 3}{right 4}
return
numpadenter::click, 589, 391
Numlock::winclose, Select batches
numpadenter::!o ;sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
;Enter::!o ;Sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
Enter::ControlClick, WindowsForms10.Window.8.app.0.33c0d9d15 Ok, Select batches,,,


;::::::::::create batch widow::::::
SelectLoginMethod:
#IfWinActive, Select Login Method
numpadmult::
numpadsub::
numpadadd::CreateBatch()



;::::::::::::::::::::review Run
Numlock & right::Click, 771, 141 Left, 1 ;RELEASE RUN
Numlock & Down::ReviewRunLoop()
Numlock & pgup::ReviewRun() 


ReplicatesNumber:
#IfWinActive, Replicates Number
NumpadEnter::
enter::sendinput {tab}{space}


QuickResults:
#Ifwinactive, Quick Results
numpadenter::!o
;::::enter 2 measurement results 9 times
Numpadmult & Numpad1::ReplicateByNine(1)
Numpadmult & Numpad2::ReplicateByNine(2)
Numpadmult & Numpad3::ReplicateByNine(3)
Numpadmult & Numpad4::ReplicateByNine(4)
Numpadmult & Numpad5::ReplicateByNine(5)
Numpadmult & Numpad6::ReplicateByNine(6)
Numpadmult & Numpad7::ReplicateByNine(7)
Numpadmult & Numpad8::ReplicateByNine(8)
Numpadmult & Numpad9::ReplicateByNine(9)

Attatchments:
#IfWinActive, Attachments ahk_class WindowsForms10
Numlock::Winclose, Attachments
NumpadEnter::Winclose, Attachments
enter::Winclose, Attachments

Mbutton::
Click, %add% left, 1
WinWait, Open , , 2
if ErrorLevel
	return
Else
	sendinput {tab 7}
sendinput {up 7}{space}
Return


Open:
#ifwinactive, Open
NumpadEnter::SubmitAttatchment() 
