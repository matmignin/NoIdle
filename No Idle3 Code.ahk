Version = 3.17
;{ ::::::::::::::::::::::::::::::::::::::variables and opening stuff::::::::::::::::::::::::::::::::::::::::
#Persistent
#SingleInstance force
SetNumlockState AlwaysOn
coordmode, mouse,Client
#noenv
SetKeyDelay, 500
SetDefaultMouseSpeed, 0
DetectHiddenText, On
SetTitleMatchMode, 2
FormatTime, Year,,yy
FormatTime, Today,, dd
FormatTime, Month,, MM
Formattime, Date,, MMddyy
JulianMonth := ["A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M"]
LetterMonth := JulianMonth[month]
SetTimer, MoveMouse
Menu, Tray, Icon, H:\QC LAB\MH\Stuff\Icons\Boo.ico,
Menu, Tray, tip, Press [ Home ] key for more info
SingleYear = %year%{left}{backspace}{right}
dailyStdDate = alch{space}std{space}%month%%today%%year%{space}MH
BPCSdate = %month%{right}%today%{right}%year%{right}{down}{left 8}
BulkLiquid = %singleYear%%lettermonth%
FileReadLine, BPCSPassword, H:\QC LAB\MH\Stuff\Variables.txt, 1
FileReadLine, PasswordEnd, H:\QC LAB\MH\Stuff\Variables.txt, 2
Password = {shiftdown}K{shiftup}ilgore%PasswordEnd%
select1 = 60, 135
select2 = 45, 73
Search1 = 70, 60
Search2 = 70, 60
PVAttachment1 = 650, 400
PVAttachment2 = 650, 334
SGAttachment1 = 350, 383
SGAttachment2 = 350, 316
ChangeRep1 = 673, 383
ChangeRep2 = 673, 316
Add = 55, 55
samplegroup = 268, 83
samplegroup1 = 268, 83
samplegroup2 = 268, 83
grouptemplate = 760, 83
grouptemplate1 = 760, 83
grouptemplate2 = 760, 83
OpenFolderX = 40
;Release runs
ReviewAttachment1 = 130, 277
ReviewAttachment2 = 136, 316
ReviewAttachment3 = 131, 210
AttachmentWindow1 = ahk_class WindowsForms10.Window.8.app.0.202c666 ahk_exe IEXPLORE.EXE
AttachmentWindow2 = ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
Adobe = AcroRd32.exe
Excel = EXCEL.EXE
Window = WINWORD.EXE
ReleaseRun1 = 773, 206
ReleaseRun2 = 771, 142
MoveWindow1 = 5, 332, 950, 684
MoveWindow2 = 
;adjust columb
AdjustA1 = L, 97, 192, 115, 192, 2
AdjustB1 = L, 96, 403, 2
AdjustA2 = L, 97, 120, 115, 122, 2
AdjustB2 = L, 96, 342, 2
;auto select
Cbox1 = WindowsForms10.COMBOBOX.app.0.202c6661
Aclass1 = ahk_class WindowsForms10.Window.8.app.0.202c666
Cbox2 = WindowsForms10.COMBOBOX.app.0.33c0d9d1
Aclass2 = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
attatchmentNumb = 0
Lotnumber = %Year%0001	

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








SetTimer, CheckBecameActive, 500

Return



CheckBecameActive:
IfWinActive,  Release update  2019 - Excel ahk_exe EXCEL.EXE
    SetCapsLockState, On
else,
  SetCapsLockState, OfF
return





return ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/  End of Autorun  /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
Numpadsub & numpad3::
	loop, 3 
	{
		click, %changerep2% Left, 1
		WinWait, Replicates Number, , 2
		if ErrorLevel
			{
				return
			}
		Else
			sendinput 10{tab}{space}
		sleep 200
		loop, 33
			sendinput {tab}
		sleep 200
		sendinput {down}
	}
		return
;{ :::::::::::::::::::::::::::::::::::::::::Help Screen::::::::::::::::::::::::::
Home::
	Msgbox, , Things to do, ____________ View Process Sample Tab of LIMS ___________________________________ `n`n -Press [ NumPad( / ) ]  to search for an Item Number `n -Press [ NumPad( * )  ]  to  search for Bulk Liquid `n -Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n____________ Create Batch Tab of LIMS ___________________________________________ `n(doesnt always work depending on the computers cashe)`n -Press [ NumPad( * ) ]  to create Bulk Liquid batch `n -Press [ NumPad( - ) ] to create a Raw Material  `n`n____________ My Service Group Pending Test tab of LIMS ________________________`n`n -Press [ End ] to make the `"Run#`" column fit `n -Press [ NumPad( - ) ]  to search for a Raw Material `n -Press [ Middle Click ] or [ Numpad( + ) & Numpad( Enter ) ] to auto-select result`n -Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n____________ Miscellaneous _______________________________________________________ `n`n -The [ Numpad( Enter ) ] is usable in more places `n -Press [ Numpad( + ) & Numpad( 0 ) ] at the same time to open the calculator`n -Press [ Insert ] to set the digits in the middle of the lot# (currently: `"%lotnumber%___`") `n`n`n :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::`nIt helps if you dont have the `"Menu Bar`" and `"Favorites Bar`" showing in Internet Explorer because it lowers the screen by 30 pixels.`n`n`tThis works on the non-Internet Explorer version of LIMS now`n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::`nver. %version%
	return
;}

;{____________________________________________Functions______________________
Bulk_Liquid(select, samplegroup, grouptemplate) { ;||||||||||||||||numpad multiply
	global
	Click, %select% Left, 1
	winwait, Select batches, , 3
	if ErrorLevel
		{
			return
		}
	;Else
	IfWinActive, Select batches,
		{
			sleep 200
			sendinput {tab 3}%bulkLiquid%
			return
		}
	Else
		{
			sleep 200
			ifwinactive, Select Login Method
				{
					sleep 150
					InputBox, Bulknumber, Item Number, Enter the BULK LIQUID Item Number., , 240, 180
					if ErrorLevel
						Return
					else
						sendinput {tab}{tab}{enter}
				}
			Click, %samplegroup% Left, 1
			sendinput b{enter}
			Click, %grouptemplate% Left, 1
			send %Bulknumber%
			Sendinput {enter}{tab}%BulkLiquid%
			return
		}
}
Raw_Material(select, samplegroup, grouptemplate) {   ;||||||||||||||||numpad subtract
	global
	Click, %select% Left, 1
	winwait, Select batches, , 3
	if ErrorLevel
		{
			return
		}
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
					sleep 150
					InputBox, itemnumber, Item Number, Enter the RAW MATERIAL Item Number., , 240, 180
					if ErrorLevel
						Return
					else
						sendinput {tab}{tab}{enter}
				}
			Click, %samplegroup% Left, 1
			sendinput r{enter}
			Click, %grouptemplate% Left, 1
			send %itemnumber%
			sendinput {enter}{tab}%lotnumber%
			return
		}
}
Item_Number(select) { ;||||||||||||||||numpad divide
	global
	Click, %select% Left, 1
	winwait, Select batches, , 3
	if ErrorLevel
		{
			return
		}
	Else
		sendinput {right}{tab 2}{enter}{right}mat{space}{enter}{tab 2}{down 3}{right 4}
	return
}
Attatch(SGattachment, PVattachment) {  ;|||||||||||||||||middle mouse & wheeldown / numpad add + dot
	global
	click, %SGattachment% Left, 1
	WinWait, Attachments, , 0.5
	if ErrorLevel
		{
			click, %PVattachment% Left, 1
			WinWait, Attachments, , 2
			if ErrorLevel
				{
					return
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
				sendinput {tab 7}sc
				sleep 200
				send {enter}
				sendinput {tab}
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
		sendinput, {tab 7}sc
		send {enter}
		sendinput, {tab}
		sleep 300
		winwaitclose, Open ahk_class #32770 ahk_exe xv.exe
		sleep 500
		winwait, ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe, , 3
		if ErrorLevel {
			sleep 400
			Winactivate, ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
			sleep 100
			ControlClick, Done, ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
			return
		}
		else
			ControlClick, Done, ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
		return
}

Auto_Select(Aclass, Cbox) {  ;||||||||||||||||Middle Mouse / Numpad plus & numpad enter
	WinWaitActive, Resent List, , 3
			if ErrorLevel {
		return
	}
	else
	{
		ControlGet, ItemList, List,, % Cbox, % Aclass
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
		else 
		{
			send {delete}
		}
		Control, ChooseString, % Pick, % Cbox, % Aclass
		sleep 200
		send {enter}
		return
	}

}
Change_Rep(changerep, Reps) {  ;|||||||||||||||| Numpadmult + # change reps
loop, 3 
{
	mousegetpos xx, yy
	sendinput {Lbutton}
	click, %changerep% Left, 1
	WinWait, Replicates Number, , 2
	if ErrorLevel
		{
			return
		}
	Else
		sendinput %Reps%{tab}{space}
	sleep 200
	mousemove %xx%, %yy%
	sendinput {Lbutton}
	sendinput {down}
}
	return
}
;}
AttatchCOA(PVattachment) {   ;||||||||||||||||Attatch COA loops
	global
	click, %PVattachment% Left, 1
	WinWait, Attachments, , 4
	if ErrorLevel
		{
			return
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
		sendinput {tab 7}sc
		sleep 200
		send {enter}
		sendinput {space}{tab}
		sleep 300
		sendinput %GoDown%
		COAcount-=1
		GoDown = {down %COAcount%}
		Blockinput, off
		return	
		}
SubmitAttatchment() {
		Sendinput {enter}
		sleep 200
		winwait, Attachments, , 3
		if ErrorLevel {
			ControlClick, Done, Attachments
			return
		}
		else
			ControlClick, Done, Attachments
		return
	}

Raw_MaterialCOA(select, x) {   ;||||||||||||||||numpad subtract
	global
	Click, %select% Left, 1
	winwait, Select batches, , 3
	if ErrorLevel
		{
			return
		}
	Else
	;IfWinActive, Select batches,
	;	{
			sleep 200
			sendinput {tab 3}%lotnumber%
			sendinput % COAnumber[x]
			sleep 800
			sendinput {altdown}o{altup}
			return
		;}
}




; [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]EXPERIMENTAL[[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]  
#IfWinActive, 

+Capslock::
SetTimer, CheckBecameActive, Off
SetCapsLockState, on
return
Capslock::SetTimer, CheckBecameActive, 600



	
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

Experiment:		

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



#IfWinActive, STARLIMS10.Live (Master) - Site: NY - User: MAT.HOUGH,

;Rbutton::^LButton
Rbutton & WheelUp::Click, 770, 144 L
Rbutton & Wheeldown::Click, 770, 165 L
Rbutton & Lbutton::Click, 413, 384 L
;Rbutton::mouseclick, R


#IfWinActive, ahk_exe chrome.exe
Mbutton & WheelDown::WinActivate, ahk_exe xv.exe

#IfWinActive
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
numlock & \::
	msgbox, 1 + 10 min hour timer set. `n just leave the Setup Instrument window open and leave. the computer will automatically log you off 10min after the run starts. (make sure you check the Start Run When Ready box)
	Menu, Tray, Icon, H:\QC LAB\MH\Stuff\Icons\Clock.ico,
	Menu, Tray, tip, is set to shut down soon. `n .
	Settimer, ShutdownTime, 60000
	return
return
Numlock & end::  ; logg off
	msgbox, 6 hour timer set. `n just leave the Setup Instrument window open and leave. the computer will automatically log you off 10min after the run starts. (make sure you check the Start Run When Ready box)
	Menu, Tray, Icon, H:\QC LAB\MH\Stuff\Icons\Clock.ico,
	Menu, Tray, tip, is set to shut down soon. `n .
	Settimer, ShutdownTime, 21635280
	return
ShutdownTime:
	ControlClick, Button24, Setup Instrument ahk_class #32770 ahk_exe TcNav.exe
	;sendinput {enter}
	sleep 600000
	Shutdown, 4
	return
COAnumber := []

loop, read, H:\QC LAB\MH\BatchCOA.txt, 
{
	loop, parse, A_LoopReadLine, `n
	{
		COAnumber.Push(A_LoopReadLine)
	}
}
	InputBox, COAcount, COA, how many COAs , , 240, 180,, 0000
	;COAcount-=1
	GoDown := COAnumber.length()
	GoDown-=1
	while COAcount > 0
	{
		WinWaitActive, STARLIMS10.Live
		sleep 300
		numberofCOA-=1
		Raw_MaterialCOA(select2, COAcount)
		WinWaitClose, Select batches
		sleep 1500
		click, %PVattachment2% Left, 1
		WinWait, Attachments, , 4
		if ErrorLevel
			{
				return
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
			sendinput {tab 7}sc
			sleep 200
			send {enter}
			sendinput {space}{tab}
			sleep 300
			sendinput {down %GoDown%}
			COAcount-=1
			GoDown-=1
			Blockinput, off
			return	
		}



;msgbox % lotnumber . COAnumber[1] "`n" lotnumber . COAnumber[2] "`n" Lotnumber  COAnumber[3] "`n" 
return



	;FileReadLine, COAnumber, H:\QC LAB\MH\Stuff\BatchCOA.txt, %NumberofCOA%
	;NumberofCOA-=1
Numpadsub & Numpaddot:: ; ::::::::::auto add scanned COAs
	InputBox, COAcount, COA, how many COAs , , 240, 180,, 0000
	NumberofCOA = %COAcount%
	COAcount-=1
	GoDown = {down %COAcount%}	
	while COAcount > 0
	{
		WinWaitActive, STARLIMS10.Live
		sleep 300
		Raw_Material(select2, samplegroup2, grouptemplate2)
		WinWaitClose, Select batches
		sleep 1500
		AttatchCOA(PVattachment2)
		winwait, Select batches
		;Sleep 2000
		;send % COAccount[NumberofCOA]
		keywait, NumpadEnter
		SubmitAttatchment()
		WinWaitActive, STARLIMS10.Live
		;sleep 1000
	}
NumpadAdd & NumpadDot:: ;{  ||||||||||auto attach COA
	Raw_Material(select2, samplegroup2, grouptemplate2)
	WinWaitClose, Select batches
	sleep 1500
	AttatchCOA(PVattachment2)
	return ;}
		#ifwinactive

#ifwinactive ;}




;{_________________________XV.exe commands________________________
#IfWinActive, STARLIMS10.Live ahk_exe xv.exe

NumpadSub::Raw_Material(select2, samplegroup2, grouptemplate2)
NumpadDiv::Item_Number(select2)
NumpadMult::Bulk_Liquid(select2, samplegroup2, grouptemplate2)

Mbutton & WheelDown::Attatch(SGattachment2, PVattachment2)
Mbutton & Wheelup::  ;||||||||||change reps
Numpadmult & numpad0::Change_Rep(changerep2, 10)
Numpadmult & numpad1::Change_Rep(changerep2, 1)
Numpadmult & numpad2::Change_Rep(changerep2, 2)
NumpadAdd & NumpadEnter:: ;{
	sendinput, {space}
	Auto_Select(Aclass2, Cbox2)
	return ;}
Mbutton:: ;{  ||||||||||  autoselect
	Click,
	Click, 2
	Auto_Select(Aclass2, Cbox2)
	return ;}
Numlock & right:: ;{ |||||||||| release run
	Click, 771, 141 Left, 1
	return ;}
; }
NumpadAdd & NumpadDiv:: ;{
InputBox, AutoFillCount, AutoFill, how many results? , , 240, 180,, 0000
loop, %autofillcount% 
{
	sendinput, {space}
	WinWaitActive, Resent List ahk_exe xv.exe, , 3
		If ErrorLevel {
			sendinput {backspace}{down}
			click, %changerep2% Left, 1
			WinWait, Replicates Number, , 3
				if ErrorLevel
					{
						Change_Rep(changerep2, 10)
						sleep 200
						return
					}
			Else
				send 10{tab}{space}
				sleep 200
				loop, 33
					sendinput {tab}
				sleep 200
			send {down}
			continue
		}
	sleep 200	
	Auto_Select(Aclass2, Cbox2)
	sleep 200
	sendinput {alt down}o{alt up}
	sleep 400
}
return ;}





;{::::::::::::::::::::::::::::::::: ::review run Loop :::::::::::::::::::::::::
Numlock & up::
		 
		loop, 400 
		{
			MouseGetPos, xpos, ypos
		PixelGetColor, ReleaseRunColor, %xpos%, %ypos%, Slow
		traytip, color, %ReleaseRunColor%, 1
		sleep 50
		}
		return
		
Numlock & Down::
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
;}
#Persistent
ToolTip, Timed ToolTip`nThis will be displayed for 5 seconds.
SetTimer, RemoveToolTip, -5000
return

RemoveToolTip:
ToolTip
return


;{::::::::::::::::::::::::::::::::::: adjust columb ::::::::::::::::::::::::::::::::::
End:: 
	MouseClickDrag, L, 97, 120, 115, 122, 2
	sleep 250
	Mouseclick, L, 96, 342, 2
	Mouseclick, L, 96, 342, 2
	sleep 200
	gosub, ScrollUp2
	return
	Scrollup2:
	loop, 300
	sendinput {WheelUp}
	Return ;}

;{:::::::::::::::::::::::::::::::::::::review Run::::::::::::::::::::::::::::::::::::::::
ReviewRun:
Numlock & pgup::
;ReviewRun(ReviewAttachment, AttachmentWindow,
	Click, %ReviewAttachment2%  Left, 1
	WinWait, Attachments, , 2
		if ErrorLevel {
			Click, %ReviewAttachment3%  Left, 1
			return
		}
	sleep 200
	WinMove, Attachments,, 861, 605, 798, 385
	Sendinput {tab 3}{enter}
	;sleep 1000
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
	return
;ClosePDF:
;#IfWinActive, ahk_class AcrobatSDIWindow ahk_exe AcroRd32.exe
;Numlock & pgup::;
;	WinClose, ahk_class AcrobatSDIWindow ahk_exe AcroRd32.exe
;	sleep 200
;	sendinput {esc 2}
;	Return
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

;{:::::::::::::::::::::::::::select batches/lots/material number:::::::::::::::::::::::::::
	#IfWinActive, Select batches 
Numlock & numpadmult::
	Click, %Search1% left, 1
	sendinput {tab 3}%BulkLiquid%
	return
Numlock & Numpadsub::
	Click, %Search1% left, 1
	sendinput {tab 3}%lotnumber%
	return
Numpaddiv::
	Click, %Search1% left, 1
	sendinput {right}{tab 2}{enter}{right}mat{space}{enter}{tab 2}{down 3}{right 4}
	return
Numlock::winclose, Select batches 
numpadenter::!o ;sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
Enter::!o ;Sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
#ifwinactive, Lot template login,
numpadenter::!o 
Enter::!o 
;}	

;{:::::::::::::::::::::::::::::::::::create batch window:::::::::::::::::::::::::::::::
#IfWinActive, Select Login Method
numpadMult::
	InputBox, Bulknumber, Item Number, Enter the BULK LIQUID Item Number., , 240, 180
					if ErrorLevel
						Return
					else
						sendinput {tab}{tab}{enter}
			Click, %samplegroup% Left, 1
			sendinput b{enter}
			Click, %grouptemplate% Left, 1
			send %Bulknumber%
			Sendinput {enter}{tab}%BulkLiquid%
			return
numpadSub::
			InputBox, itemnumber, Item Number, Enter the RAW MATERIAL Item Number., , 240, 180
			if ErrorLevel
				Return
			else
			sendinput {tab}{tab}{enter}
			Click, %samplegroup% Left, 1
			sendinput r{enter}
			Click, %grouptemplate% Left, 1
			send %itemnumber%
			sendinput {enter}{tab}%lotnumber%
			return
;}

;{:::::::::::::::::::::::::::::::::::::attatchments:::::::::::::::::::::::::::::::::::::::::
#ifwinactive, Attachments,
Numlock::Winclose, Attachments
#IfWinActive, Attachments ahk_class WindowsForms10
Mbutton::
	Click, %add% left, 1

	WinWait, Open , , 2
	if ErrorLevel
	{
		return
	}
	Else
		sendinput {tab 7}
		sendinput {up 7}{space}
	Return
#ifwinactive, Open
Mbutton::
		Sendinput, {LButton}
NumpadEnter::SubmitAttatchment() ;}


;{:::::::::::::::::::::::::::::::::::::::repetitive shit:::::::::::::::::::::::::::::::::::::::
#IfWinActive, STARLIMS10.Live (Master)
Numpadadd & Right::sendinput, {tab}{right 5}avg of ten{enter}{left 5}	
Mbutton & Wheelup::	
	sendinput avg of ten{enter}
	return

+Tab::Sendinput {tab 2}{down}

#Ifwinactive, Quick Results
Numpadmult & Numpad1::
	Inputbox, MultiEnter, Type a value to enter 9x,, , 300, 100, , 0
	loop 9 {
	Sendinput, %MultiEnter%{up}{left 2}{down 2}
	}
	sleep 200
	sendinput {alt down}o{alt up}
	return
Numpadmult & Numpad2::
	Inputbox, MultiEnter1, Type 1st value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter2, Type 2nd value to enter 9x,, , 300, 100, , 0
	loop 2 {
		ToEnter := MultiEnter%A_index%
		loop 9 {
		Sendinput, %ToEnter%{up}{left 2}{down 2}
		}
	}
	sleep 200
	sendinput {alt down}o{alt up}
	return	
Numpadmult & Numpad3::
	Inputbox, MultiEnter1, Type 1st value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter2, Type 2nd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter3, Type 3rd value to enter 9x,, , 300, 100, , 0
	loop 3 {
		ToEnter := MultiEnter%A_index%
		loop 9 {
		Sendinput, %ToEnter%{up}{left 2}{down 2}
		}
	}
	sleep 200
	sendinput {alt down}o{alt up} 
	return
Numpadmult & Numpad4::
	Inputbox, MultiEnter1, Type 1st value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter2, Type 2nd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter3, Type 3rd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter4, Type 4th value to enter 9x,, , 300, 100, , 0
	loop 4 {
		ToEnter := MultiEnter%A_index%
		loop 9 {
		Sendinput, %ToEnter%{up}{left 2}{down 2}
		}
	}
	sleep 200
	sendinput {alt down}o{alt up}
	return
Numpadmult & Numpad5::
	Inputbox, MultiEnter1, Type 1st value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter2, Type 2nd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter3, Type 3rd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter4, Type 4th value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter5, Type 4th value to enter 9x,, , 300, 100, , 0
	loop 5 {
		ToEnter := MultiEnter%A_index%
		loop 9 {
		Sendinput, %ToEnter%{up}{left 2}{down 2}
		}
	}
	sleep 200
	sendinput {alt down}o{alt up}
	return
Numpadmult & Numpad6::
	Inputbox, MultiEnter1, Type 1st value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter2, Type 2nd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter3, Type 3rd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter4, Type 4th value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter5, Type 5th value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter6, Type 6th value to enter 9x,, , 300, 100, , 0
	loop 6 {
		ToEnter := MultiEnter%A_index%
		loop 9 {
		Sendinput, %ToEnter%{up}{left 2}{down 2}
		}
	}
	sleep 200
	sendinput {alt down}o{alt up}
	return
Numpadmult & Numpad7::
	Inputbox, MultiEnter1, Type 1st value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter2, Type 2nd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter3, Type 3rd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter4, Type 4th value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter5, Type 5th value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter6, Type 6th value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter7, Type 7th value to enter 9x,, , 300, 100, , 0
	loop 7 {
		ToEnter := MultiEnter%A_index%
		loop 9 {
		Sendinput, %ToEnter%{up}{left 2}{down 2}
		}
	}
	sleep 200
	sendinput {alt down}o{alt up}
	return
	Numpadmult & Numpad8::
	Inputbox, MultiEnter1, Type 1st value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter2, Type 2nd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter3, Type 3rd value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter4, Type 4th value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter5, Type 5th value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter6, Type 6th value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter7, Type 7th value to enter 9x,, , 300, 100, , 0
	Inputbox, MultiEnter8, Type 7th value to enter 9x,, , 300, 100, , 0
	loop 8 {
		ToEnter := MultiEnter%A_index%
		loop 9 {
		Sendinput, %ToEnter%{up}{left 2}{down 2}
		}
	}
	sleep 200
	sendinput {alt down}o{alt up}
	return

	
NumpadEnter::
enter::sendinput !o
#IfWinActive, Replicates Number 
NumpadEnter::
	enter::sendinput {tab}{space}
	#Ifwinactive,--    ;}

  


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

Numlock & Numpadadd::
	IfWinExist, Mat Worksheets - Excel ahk_exe EXCEL.EXE 
		winactivate, Mat Worksheets - Excel ahk_exe EXCEL.EXE

	else
		run, H:\QC LAB\MH\Mat Worksheets.xlsx
	return

;} 

;{:::::::::::::::::::::::::::::::::::::: Options ::::::::::::::::::::::::::::::::::::
Numpadadd::Sendinput, {shift down}={shift Up}
NumpadSub::Sendinput -
Pause::pause
Numpadadd & numpadsub::Sendinput, %Lotnumber%
Numpadadd & numpadmult::Sendinput, %bulkliquid%
F11 & F12::
NumLock & NumpadDiv::
	Sendinput, mat.hough{tab}
	sendinput, %password%{enter}
	return
	#IfWinActive,
F11 & F10::exitapp


Insert::
	InputBox, FillerZeros, Lot Code, How many filler zeros in the current lot numbers , , 240, 180,, 0000
	Lotnumber = %Year%%FillerZeros%	
	return
NumLock & numpad7::
	traytip, , Autoclosing Scanner window, 2
	SetTimer, ScannerClose
	return
XButton1::
	MouseGetPos cx, cy
	Click
	Click 417, 447
	Sleep 200
	MouseMove %cx%, %cy%
	return
Numlock & Delete::
	ControlClick, WindowsForms10.STATIC.app.0.202c66626 Select, STARLIMS10.Live,,,, NA
	return

MalwareClose:
	IfWinExist, OfficeScan
	WinClose, OfficeScan
	return
ScannerClose:
	IfWinActive, EPSON Scan
	Send, {ALT DOWN}{TAB}{ALT UP}
	return
PumpOff:
	IfWinActive, LC Hands On
	msgbox, will send the key
	return

MoveMouse:
	If ( A_TimeIdle > 99999 ) {
	MouseMove, 1 , 1,, R
	MouseMove, -1,-1,, R
	}
	return
;}

;{ :::::::::::::::::::::::::::::::::::Internet Explorer :::::::::::::::::::::::::::::::::
#IfWinActive, STARLIMS10.Live ahk_class IEFrame ahk_exe iexplore.exe
Rbutton::mouseclick, R
NumpadSub::Raw_Material(select1, samplegroup1, grouptemplate1)
NumpadDiv::Item_Number(select1)
NumpadMult::Bulk_Liquid(select1, samplegroup1, grouptemplate1)
NumpadAdd & NumpadDot::
Mbutton & WheelDown::Attatch(SGattachment1, PVattachment1)
Mbutton & Wheelup::
Numpadmult & numpad0::Change_Rep(changerep1, 10)
Numpadmult & numpad1::Change_Rep(changerep1, 1)
Numpadmult & numpad2::Change_Rep(changerep1, 2)
NumpadAdd & NumpadEnter::
	sendinput, {space}
	Auto_Select(Aclass1, Cbox1)
	return
Mbutton::
	Click,
	Click, 2
	Auto_Select(Aclass1, Cbox1)
	return
End:: ;{;Adjust columb
	MouseClickDrag, L, 97, 192, 115, 192, 2
	sleep 250
	Mouseclick, L, 96, 403, 2
	Mouseclick, L, 96, 403, 2
	sleep 200
	gosub, ScrollUp1
	return
	Scrollup1:
	loop, 300
	sendinput {WheelUp}
	Return ;}
;}

;{:::::::::::::::::::::::::::::::::::::other programs::::::::::::::::::::::::::::::::::::::::
#IfWinActive, ahk_exe firefox.exe
Rbutton::mouseclick, R
Rbutton & Wheeldown:: sendinput {ctrldown}w{ctrlup}
Rbutton & Wheelup:: WinActivate, STARLIMS10.Live (Master) ahk_exe xv.exe
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



#IfWinActive, Find and Replace ahk_exe EXCEL.EXE
	numpadEnter::sendinput, {alt down}i{alt up} 
	numpadsub::sendinput, {alt down}n{alt up}%lotnumber%
	numpadadd & Numpadenter::sendinput {esc}{ctrldown}{right}{ctrlup}{right}P{ctrldown}f{CtrlUp}%lotnumber%
	
#ifwinactive, ahk_exe EXCEL.EXE 
	Numpadadd & numpad0::sendinput {ctrldown}f{ctrlup}{AltDown}th{altup}w{enter}{altdown}n{altup}%lotnumber%
	Numpadadd & NumpadDot::sendinput {ctrldown}f{ctrlup}{AltDown}th{altup}w{enter}{altdown}n{altup}{Delete}
	Capslock::CapsLock




#ifwinactive, Property Grid Form
	Mbutton::sendinput, {backspace 4}
	NumpadEnter::
	SendInput, {enter}{down 2}1
	sleep 200
	sendinput, {tab 2}{enter}
	return


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

#ifwinactive, EPSON Scan
	Numpadsub::Winactivate, STARLIMS10.Live (Master)
	NumpadMult::Winactivate, STARLIMS10.Live (Master)
	#IfWinActive

#IfWinActive, iCloud - Mozilla Firefox
	Tab::sendinput {space 4}
#IfWinActive, ahk_exe chrome.exe
	;Mbutton & Wheelup:: sendinput #j
	!space::
	;Mbutton & WheelDown::
		WinGet MMX, MinMax, ahk_class IEFrame
		IfEqual MMX,-1, WinRestore, ahk_class IEFrame
		IfEqual MMX,1, WinActivate, ahk_class IEFrame
		Return
#IfWinActive, iCloud Notes - Google Chrome
	Tab::sendinput {space 4}
#IfWinActive, iCloud Notes - Mozilla Firefox
	Tab::sendinput {space 4}
	;Rbutton & LButton::WinActivate, ahk_class IEFrame	
	;Rbutton::Click, Right
#IfWinActive, ahk_exe notepad.exe
	;Mbutton & Wheelup:: sendinput #j
	Tab::sendinput {space 4}
	Mbutton & WheelDown::
		WinGet MMX, MinMax, ahk_class IEFrame
		IfEqual MMX,-1, WinRestore, ahk_class IEFrame
		IfEqual MMX,1, WinActivate, ahk_class IEFrame
		Return
	#IfWinActive
 
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


	;Rbutton & LButton::WinActivate, ahk_class IEFrame	
;Rbutton::Click, Right
Numlock & Numpadsub::exitapp
	#ifwinactive,

#ifwinactive, ahk_class SciTEWindow
F11::
		run, H:\QC LAB\MH\Stuff\AHK\EditCode.exe
		ExitApp
		Return


;}:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::







	
	
	
	
	

	
		
/*    Defunked

;{ |||||||turn off pump and set shutdown after run
	Inputbox,  runs, how many runs are left?,, , 300, 100, , 0
	Inputbox,  runlenght, how long is each run?,, , 300, 100, , 0
	SetTimer, PumpOff, -%min_till_enter%
	return
	#IfWinActive, STARLIMS10.Live (Master) - Site ahk_class IEFrame
	#ifwinactive
	#IfWinActive, MasterControl Portal Home Page
	#IfWinActive
	#IfWinActive, Signon to iSeries ahk_class #32770  ;}



;{;::::::::::::::::::::::::::auto select group [not active] :::::::::::::::::::::::::::::::::::::::	
	
	Mbutton::
	Click,
	Click, 2
	WinWaitActive, Resent List, , 3
			if ErrorLevel
	{
		return
	}
	else
		gosub Resent
	return

	
#ifwinactive, Resent List	
Resent:
Space::
Mbutton::
	;CClass 	= WindowsForms10.COMBOBOX.app.0.202c6661
	;Title 	= ahk_class WindowsForms10.Window.8.app.0.202c666
	CClass 	= WindowsForms10.COMBOBOX.app.0.33c0d9d1
	Title 	= ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	ControlGet, ItemList, List,, % CClass, % Title
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
	else 
	{
		send {delete}
	}
	Control, ChooseString, % Pick, % CClass, % Title
	sleep 200
	send {enter}
	return
#ifwinactive



#IfWinActive, STARLIMS10.Live (Master)
Mbutton::
	Click,
	Click, 2
	WinWaitActive, Resent List, , 3
			if ErrorLevel
	{
		return
	}
	else
		gosub Resent
	return


Numpadadd & Numpad3::
	loop 3 {
		gosub OpenResult
}
return
	
^Down::	
OpenResult:
Send {space}
	WinWait, Resent List, , 3
	if ErrorLevel
	{
		send {delete}{down}
		gosub NextResult
		return
	}
	Else
		gosub Resent
	WinWaitclose, , , 3
	if ErrorLevel
	{
		Send {enter}
		return
	}
	Else
		Sleep 200
	return
 

NextResult:
	Send {space}
	WinWait, Resent List, , 3
	if ErrorLevel
	{
		return
	}
	Else
		gosub Resent
	WinWaitclose, , , 3
	if ErrorLevel
	{
		Send {enter}
		return
	}
	Else
		Sleep 200
	return
	
;}	





+#\::
	MouseGetPos, MouseX, MouseY
	PixelGetColor, color1, %MouseX%, %MouseY%
	PixelGetColor, color2, %PleasewaitX%, %PleasewaitY%
	ToolTip,  %color1%  `n %color2%  `n %color%
	return
CheckColor:
	PixelGetColor,Color,%RRreleaseX%,%RRreleasey%
	If Color= %grey%
	{
	msgbox, its grey
	return
	}
	else
	msgbox, its NOT grey
	return
	Numlock & Home::
	color = 0
	gosub, ReviewRun
	KeyWait, Right, D
	sleep 200
	gosub, ClosePDF
	sleep 500
	gosub, ReleaseRun
	return



Numpadadd & Numpadsub::
if (attatchmentNumb = 0) {
	inputbox, attatchmentNumb, how many attatchments are there?,, , 300, 100, , 0
	return
}
else {
	attatchmentNumb-=1
	click, %PVattachmentx%, %PVattachmentY% Left, 1
	WinWait, Attachments ahk_class WindowsForms10.Window.8.app.0.202c666, , 2
	if ErrorLevel
		{
			return
		}
		Else
			Click, %add%, %add% left, 1
			WinWait, Open ahk_class #32770, , 3
		if ErrorLevel
		{	
			return
		}
		Else
			sleep 200
			Blockinput, On
			sendinput {tab 7}sc
			sleep 200
			send {enter}
			sendinput {tab}{Down %attatchmentNumb%}
			Blockinput, off
			return
	}



Adjust(AdjustA, AdjustB) {
	MouseClickDrag %AdjustA%
	sleep 250
	Mouseclick %AdjustB%
	Mouseclick %AdjustB%
	sleep 200
	loop, 300
	sendinput {WheelUp}
	return

}






#IfWinActive, ahk_exe putty.exe
Mbutton & Wheelup:: sendinput #j
!space::
Mbutton & WheelDown::
	WinGet MMX, MinMax, ahk_class IEFrame
	IfEqual MMX,-1, WinRestore, ahk_class IEFrame
	IfEqual MMX,1, WinActivate, ahk_class IEFrame
	Return
#IfWinActive, ahk_exe firefox.exe
Mbutton & Wheelup:: sendinput #j
!space::
;Mbutton & WheelDown::
	WinGet MMX, MinMax, ahk_class IEFrame
	IfEqual MMX,-1, WinRestore, ahk_class IEFrame
	IfEqual MMX,1, WinActivate, ahk_class IEFrame
	Return
	#ifwinactive, Repl.it
CapsLock::sendinput {esc 2}
#IfWinActive