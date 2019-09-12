

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
Numpadmult & numpad0::Change_Rep(changerep2, 10)
Numpadmult & numpad1::Change_Rep(changerep2, 1)
Numpadmult & numpad2::Change_Rep(changerep2, 2)
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
