Version = 4.01

#Include Variables.ahk
;#Include unimportant_code.ahk
#Include other_apps.ahk
#Include options.ahk



return 



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
		sendinput {tab 7}%pick%
		send {enter}{enter}
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
	sendinput, {tab 7}%pick%
	send {enter}{enter}
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
Change_Rep(changerep, Reps, numberOf) {  ;|||||||||||||||| Numpadmult + # change reps
	mousegetpos xx, yy
	yy -= 18
	loop, %numberOf%
	{
		sleep 400
		sendinput {Lbutton}
		click, %changerep% Left, 1
		sleep 200
		WinWait, Replicates Number, , 3
		if ErrorLevel
		{
			sleep 400
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
	WinWait, Attachments, , 5
	if ErrorLevel
		{
			sleep 200
			Click, %add% left, 1
			sleep 200
		}
	Else
		Click, %add% left, 1
		WinWait, Open, , 4
		if ErrorLevel
		{
			return
		}
	Else
		sleep 300
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
		sleep 300
		winwait, Attachments, , 4
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




#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
;{_________________________XV.exe commands________________________
NumpadSub::Raw_Material(select2, samplegroup2, grouptemplate2)
NumpadDiv::Item_Number(select2)
NumpadMult::Bulk_Liquid(select2, samplegroup2, grouptemplate2)
Mbutton & WheelDown::Attatch(SGattachment2, PVattachment2, pickScanner)
Mbutton & Wheelup::
Attatch(SGattachment2, PVattachment2, pickComponent)
sleep 100
sendinput, {ctrldown}e{ctrlup}
return
Numpadmult & numpad0::
;InputBox, inputNumberOf, ,How many Measurments?? , , 240, 180,, 0000
Change_Rep(changerep2, 10, 3)
return
Numpadmult & numpad1::Change_Rep(changerep2, 1, 1)
Numpadmult & numpad2::Change_Rep(changerep2, 2, 1)
NumpadAdd & NumpadEnter:: ;{
	sendinput, {space}
	Auto_Select(Aclass2, Cbox2)
return ;}
NumpadAdd & Numpad1:: ;{
	loop, 1
	{
		sendinput, {space}
		Auto_Select(Aclass2, Cbox2)
		sleep 400
	}
return ;}
NumpadAdd & Numpad2:: ;{
	loop, 2
	{
		sendinput, {space}
		Auto_Select(Aclass2, Cbox2)
		sleep 400
	}
return ;}
NumpadAdd & Numpad3:: ;{
	loop, 3
	{
		sendinput, {space}
		Auto_Select(Aclass2, Cbox2)
		sleep 400
	}
return ;}
NumpadAdd & Numpad4:: ;{
	loop, 4
	{
		sendinput, {space}
		Auto_Select(Aclass2, Cbox2)
		sleep 400
	}
return ;}
NumpadAdd & Numpad5:: ;{
	loop, 5
	{
		sendinput, {space}
		Auto_Select(Aclass2, Cbox2)
		sleep 400
	}
	return 	
	Mbutton:: ;{  ||||||||||  autoselect
		Click,
		Click, 2
		Auto_Select(Aclass2, Cbox2)
	return ;}
	Numlock & right:: ;{ |||||||||| release run
		Click, 771, 141 Left, 1
	return ;}
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
					Change_Rep(changerep2, 10, 1)
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
	
	
; }
;} 
	
;{
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











;{:::::::::::::::::::::::::::::::::::::review Run::::::::::::::::::::::::::::::::::::::::

Numlock & up:: ;{::::::::::::::::: ::review run Loop
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
	Mbutton::Sendinput, {LButton}
	;NumpadEnter::SubmitAttatchment() ;}
	
	
;z{:::::::::::::::::::::::::::::::::::::::repetitive shit:::::::::::::::::::::::::::::::::::::::
	#IfWinActive, STARLIMS10.Live (Master)
	
	
	Mbutton & Rbutton::Click, 413, 384 L
	
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
	
	
	
	
	