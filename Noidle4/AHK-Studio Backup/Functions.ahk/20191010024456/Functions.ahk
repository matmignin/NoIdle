#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
;{____________________________________________Functions______________________
login(user, password) {
	Sendinput %user%{tab}%password%{enter}
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
		sendinput, {shiftdown}{tab 3}{shiftup}
		sleep 100
		SENDinput, %pick%
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
			sendinput {SHIFTDOWN}{tab 3}{SHIFTUP}sc
			sleep 100
			send {sPACE}
			sendinput {tab}
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
		sleep 200
		Winclose, Attachments
		return
	}
	else
		sleep 300
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


