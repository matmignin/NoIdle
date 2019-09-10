;||||||||||||||||numpad multiply
Bulk_Liquid(select, samplegroup, grouptemplate) { 
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


;||||||||||||||||numpad subtract
Raw_Material(select, samplegroup, grouptemplate) {   
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



;||||||||||||||||numpad divide
Item_Number(select) { 
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


;|||||||||||||||||middle mouse & wheeldown / numpad add + dot
Attatch(SGattachment, PVattachment, pick) { 
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


;||||||||||||||||Middle Mouse / Numpad plus & numpad enter
Auto_Select(Aclass, Cbox) {  
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


;|||||||||||||||| Numpadmult + # change reps
Change_Rep(changerep, Reps) {  
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


;||||||||||||||||Attatch COA loops
AttatchCOA(PVattachment) {   
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



;||||||||||||Submit Attatchment
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




;||||||||||||||||numpad subtract
Raw_MaterialCOA(select, x) {   
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




