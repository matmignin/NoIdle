Version = 4.13
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
traytip, , Hit [ Home ] key for more info, 1
Menu, Tray, Icon, lib\Icons\Fish.ico,

FileReadLine, PDIuser, %A_Desktop%\loginfo.txt, 1
FileReadLine, PDIPassword, %A_Desktop%\loginfo.txt, 2
FileReadLine, BPCSuser, %A_Desktop%\loginfo.txt, 3
FileReadLine, BPCSPassword, %A_Desktop%\loginfo.txt, 4
FileReadLine, totalChromUser, %A_Desktop%\loginfo.txt, 5
FileReadLine, totalChromPassword, %A_Desktop%\loginfo.txt, 6
FileRead, helptext, *t %A_Desktop%\helptext.txt, 1
samplegroup = 268, 83
grouptemplate = 760, 83
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
Cbox = WindowsForms10.COMBOBOX.app.0.33c0d9d1
Aclass = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
AttachmentWindow = ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
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

Home::Msgbox, , Things to do, %HelpBox%
Insert & Home::
InputBox, FillerZeros, Lot Code, enter redundent digits in Lot code that follow %year%   , , 240, 180,, 0000
Lotnumber = %Year%%FillerZeros%
return

#Include lib\Attatchments.ahk
#Include lib\selectAndCreateBatch.ahk
#Include lib\other_apps.ahk

return   

MoveMouse:
If ( A_TimeIdle > 99999 ) {
	MouseMove, 1 , 1,, R
	MouseMove, -1,-1,, R
}
return


;{____________________________________________Functions______________________________________________________________
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



MultipleAutoSelect(NumberOfEntries) {
	loop, %NumberOfEntries%
	{
		sendinput, {space}
		Auto_Select(Aclass, Cbox)
		sleep 400
	}	
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

CreateBatch() {
	InputBox, itemNumber, Item Number, Enter the Item Number., , 240, 180
	if ErrorLevel
		Return
	else
		firstNumber := substr(itemNumber, 1)
	msgbox, %firstNumber%
	sendinput {tab}{tab}{enter}
	Click, %samplegroup% Left, 1
	if (firstNumber="4") {
		sendinput b{enter}
		batchOrLot = %batchNumber%
	}
	else {
		sendinput r{enter}
		batchOrLot = %lotNumber%
	}
	Click, %grouptemplate% Left, 1
	sleep 200
	send %itemNumber%
	sendinput {enter}{tab}%batchOrLot%
	return
}



login(user, password) {
	Sendinput %user%{tab}{200}%password%{enter}
	sleep 200
}

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
		sendinput {tab 3}%batchNumber%
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
		Sendinput {enter}{tab}%batchNumber%
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

Auto_Select(Aclass, Cbox) { ;|||||||||||||||| Numpadmult + # change reps
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
	;}
}


Change_Rep(changerep, Reps, numberOf) {  ;|||||||||||||||| Numpadmult + # change reps
	mousegetpos xx, yy
	yy -= 18
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
;}
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




;________________________________________Options
#IfWinActive,
Numpadadd::Sendinput, {shift down}={shift Up}
NumpadSub::Sendinput -
Numpadadd & numpadsub::Sendinput, %Lotnumber%
Numpadadd & numpadmult::Sendinput, %batchNumber%
Numlock & Numpaddiv::login(PDIUser, PDIPassword)

;{:::::::::::::::::::: Vim controls
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



#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
End::Adjust_Columns()