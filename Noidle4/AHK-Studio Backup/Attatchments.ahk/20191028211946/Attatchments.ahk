

;:::attatch a file
#IfWinActive, STARLIMS10.Live ahk_exe xv.exe

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
		sleep 1500
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




;#IfWinActive, Attachments ahk_class WindowsForms10
#ifwinactive, Attachments,
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



#SGAttachmentifwinactive, Open
;Mbutton::Sendinput, {LButton}
NumpadEnter::SubmitAttatchment() 
