Version = 4.01

#Include Variables.ahk
;#Include unimportant_code.ahk
#Include other_apps.ahk
#Include options.ahk



return 



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
Change_Rep(changerep2, 10, 4)
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
	
	
	
	
	
#Include Functions.html
#Include reviewRun.ahk
#Include Functions.ahk