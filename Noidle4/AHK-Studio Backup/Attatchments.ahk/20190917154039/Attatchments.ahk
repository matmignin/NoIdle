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
