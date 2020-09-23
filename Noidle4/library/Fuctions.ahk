
CreateBatch() {
	global
	firstNumber =
	SampleGroupSelection =
	
	sleep 400
	click 349, 45
	sleep 500
	InputBox, itemNumber, Item Number, Enter the Item Number., , 240, 180
		if errorlevel 
			return
	firstNumber := substr(itemNumber, 1,1)
	sleep 200
	if firstNumber contains 4 
		control, ChooseString, Bulk Liquid, WindowsForms10.COMBOBOX.app.0.33c0d9d1, ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	else
		control, ChooseString, Raw Material, WindowsForms10.COMBOBOX.app.0.33c0d9d1, ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	sleep 200
	ControlGet, MatCodeList, List,, WindowsForms10.COMBOBOX.app.0.33c0d9d2, ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	control, ChooseString, %itemNumber%, WindowsForms10.COMBOBOX.app.0.33c0d9d2, ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	sleep 400
	controlFocus, WindowsForms10.EDIT.app.0.33c0d9d5, Lot template login
	if firstNumber contains 4 
	{
		sendinput %batchNumber%
		return
		}
	else {
		Sendinput %lotnumber%
		sleep 400
		keywait, Right, D T6
			controlFocus, WindowsForms10.EDIT.app.0.33c0d9d3, Lot template login
		}
	return
}



Attatch(PickFolder, Search) {
	Global
	DetectTab() 
	if tab contains View Process Samples
		click, %PVattachment%
	if tab contains Pending Tests
		click, %SGattachment%
	Sleep 400
	Winwait, Attachments,, 5
	sleep 200
	Click, %add%
	Blockinput, on
	sendinput, {shiftdown}{tab 3}{shiftup}%PickFolder%{300}{space}
	sleep 200
	send, {TAB}{space}
	if Search = 1
		sendinput, ^e
	Blockinput, off
	winwait, Attachments
	sleep 250
	WinClose, Attachments
	return
	
}



ViewSample(ProductCode) { 
	global
	Click, %select%
	WinWait Select batches, , 4
	sleep 200
	sendinput {tab 3}%ProductCode%
	If ProductCode = %LotNumber%
		Swap_code = "Lot"
	If ProductCode = %BatchNumber%
		Swap_code = "Batch"
}





DetectTab() {
	GLOBAL
	DetectHiddenText, off
	WinGetText, tab
	DetectHiddenText, on
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

SwapCode() {
	Global
	if swap_code contains "Lot"
	{
		sendinput {Click %search%}{tab 3}%BatchNumber%
		swap_code = "Batch"
		return
	}
	if swap_code contains "Batch" 
	{
		sendinput {Click %Search%}{tab 3}%lotnumber%
		swap_code = "Lot"
		Return
	}
}
	
	



AttatchCOA(PVattachment) {   ;||||||||||||||||Attatch COA loops
	global
	click, %PVattachment% Left, 1
	sleep 400
	WinWaitActive Attachments, , 5
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
	WinWaitActive Open, , 4
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
	WinWaitActive Attachments, , 4
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
	WinWaitActive Select batches, , 3
	if ErrorLevel
		return
	Else
		sleep 200
	sendinput {tab 3}%lotnumber%
	sendinput % COAnumber[x]
	sleep 800
	sendinput {altdown}o{altup}
	return
}





Auto_Select(AutoSelectWindow, AutoSelectCombobox, SpaceOrClick){
	global
	if (SpaceOrClick = 0)
		Sendinput, {Space}
	else if (SpaceOrClick = 1) 
	{
		Click
		Click, 2
	}
	WinWaitActive, Resent List, , 4
	if ErrorLevel 
		exit
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
		else if InStr(Selection[2], Void)
		{
			Pick := Selection[2]
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
			send, m{enter}
		}
		Control, ChooseString, % Pick, % AutoSelectCombobox, % AutoSelectWindow
		sleep 300
		send {enter}
		return
	}
	
}


MultipleAutoSelect(NumberOfEntries) {
	Global
	loop, %NumberOfEntries% {
        sendinput, {space}
		Auto_Select(AutoSelectWindow, AutoSelectCombobox, 0)
		sleep 300
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
			WinWaitActive Replicates Number, , 3
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
			sendinput {down}
			sleep 200
		}
		return
	}
	
	
	
	
	
	
ReviewRun() {
	Click, %ReviewAttachmentA%. Left, 1
	WinWaitActive Attachments, , 2
	if ErrorLevel {
		Click, %ReviewAttachmentB%  Left, 1
		return
	}
	sleep 200
	WinMove, Attachments,, 861, 605, 798, 385
	Sendinput {tab 3}{enter}
	
	WinWaitActive ahk_exe AcroRd32.exe, , 2
	if ErrorLevel {
		msgbox, there is no attatchment
		sleep 200
		winclose, Attachments
		return
	}
	WinMove, ahk_exe AcroRd32.exe,, 5, 332, 950, 684
	WinWaitActive STARLIMS10.Live (Master)
	return
}
	
	
ReviewRunLoop() {
	InputBox, ReviewRunLoop, how many,, , 240, 180
	InputBox, ReviewRunLoopTime, how much Time inbetween? in milliseconds `(default 2000`),, , 240, 180
	if ErrorLevel
		Return
	Loop, %reviewRunLoop%
	{
		Click, 771, 144 Left, 1
		sleep %ReviewRunLoopTime%
		sleep 2000
		WinWaitActive Warning, , 4
		if errorlevel {
			sleep %ReviewRunLoopTime%
			sendinput {down}
			sleep %ReviewRunLoopTime%
			continue
		}
		else {
			winclose, Warning
			sleep %ReviewRunLoopTime%
			sendinput {down}
		}
		sleep %ReviewRunLoopTime%
		sleep 2000
	}
	return
}



	

	
	Raw_Material(select, samplegroup, grouptemplate) {   
		global
		Click, %select% Left, 1
		sleep 300
		;WinWaitActive Select batches, , 3
		If WinActive("Select batches") {
				sleep 200
				sendinput {tab 3}%lotnumber%
				return
			}
	}
	Item_Number(select) { 
		global
		Click, %select% Left, 1
		WinWaitActive Select batches, , 3
		if ErrorLevel
			return
		Else
			sendinput {right}{tab 2}{enter}{right}mat{space}{enter}{tab 2}{down 3}{right 4}
		return
	}
