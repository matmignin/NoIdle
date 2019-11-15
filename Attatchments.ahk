

;:::attatch a file
#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
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
	;while COAcount > 0
	;{
		;WinWaitActive, STARLIMS10.Live
		sleep 300
		Raw_Material(select, samplegroup, grouptemplate)
		;WinWaitClose, Select batches
		sleep 300
		AttatchCOA(PVattachment)
		winwait, Select batches
		;Sleep 2000
		;send % COAccount[NumberofCOA]
		keywait, NumpadEnter
		SubmitAttatchment()
		;WinWaitActive, STARLIMS10.Live
		sleep 400
		IfWinActive, Attachments
		Winclose, Attachments
	;}
	return
	
;{  ||||||||||auto attach COA
	NumpadAdd & NumpadDot:: 
		Raw_Material(select, samplegroup, grouptemplate)
		WinWaitClose, Select batches
		sleep 1500
		AttatchCOA(PVattachment)
	return 




#IfWinActive, Attachments ahk_class WindowsForms10
;#ifwinactive, Attachments,
Numlock::Winclose, Attachments
NumpadEnter::Winclose, Attachments
enter::Winclose, Attachments

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
;Mbutton::Sendinput, {LButton}
NumpadEnter::SubmitAttatchment() 


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
