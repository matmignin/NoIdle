
SetTimer, CheckBecameActive, 500

Return



CheckBecameActive:
IfWinActive,  Release update  2019 - Excel ahk_exe EXCEL.EXE
	SetCapsLockState, On
else,
	SetCapsLockState, OfF
return
; [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]EXPERIMENTAL[[][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]
#IfWinActive,
up & /::Sendinput ?
up::Sendinput {up}
+Capslock::
SetTimer, CheckBecameActive, Off
SetCapsLockState, on
return
Capslock::SetTimer, CheckBecameActive, 600






Numpadsub & numpad3::
loop, 3
{
		click, %changerep2% Left, 1
		WinWait, Replicates Number, , 2
		if ErrorLevel
			{
				return
			}
		Else
			sendinput 10{tab}{space}
		sleep 200
		loop, 33
			sendinput {tab}
		sleep 200
		sendinput {down}
}
return



#Ifwinactive, Release update  2019 - Excel ahk_exe EXCEL.EXE
Capslock::SetCapsLockState, Off

#ifwinactive,
Numlock & Numpad0::
IfWinExist, Release update  2019 - Excel ahk_exe EXCEL.EXE
{
	winactivate,Release update  2019 - Excel ahk_exe EXCEL.EXE
	SetCapsLockState, On
}
return




;|||||||||||||||||||||||auto log off

Numlock & end::  ; logg off
msgbox, 6 hour timer set. `n just leave the Setup Instrument window open and leave. the computer will automatically log you off 10min after the run starts. (make sure you check the Start Run When Ready box)
Menu, Tray, Icon, H:\QC LAB\MH\Stuff\Icons\Clock.ico,
Menu, Tray, tip, is set to shut down soon. `n .
Settimer, ShutdownTime, 21635280
return
ShutdownTime:
ControlClick, Button24, Setup Instrument ahk_class #32770 ahk_exe TcNav.exe
		;sendinput {enter}
sleep 600000
Shutdown, 4
return
numlock & \::
msgbox, 1 + 10 min hour timer set. `n just leave the Setup Instrument window open and leave. the computer will automatically log you off 10min after the run starts. (make sure you check the Start Run When Ready box)
Menu, Tray, Icon, H:\QC LAB\MH\Stuff\Icons\Clock.ico,
Menu, Tray, tip, is set to shut down soon. `n .
Settimer, ShutdownTime, 60000
return

PumpOff:
IfWinActive, LC Hands On
	msgbox, will send the key
return
;|||||||||||||||||||||||||||auto add COA from list
COAnumber := []

loop, read, H:\QC LAB\MH\BatchCOA.txt,
{
	loop, parse, A_LoopReadLine, `n
	{
		COAnumber.Push(A_LoopReadLine)
	}
}
	InputBox, COAcount, COA, how many COAs , , 240, 180,, 0000
	;COAcount-=1
	GoDown := COAnumber.length()
	GoDown-=1
	while COAcount > 0
	{
		WinWaitActive, STARLIMS10.Live
		sleep 300
		numberofCOA-=1
		Raw_MaterialCOA(select2, COAcount)
		WinWaitClose, Select batches
		sleep 1500
		click, %PVattachment2% Left, 1
		WinWait, Attachments, , 4
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
			sendinput {tab 7}sc
			sleep 200
			send {enter}
			sendinput {space}{tab}
			sleep 300
			sendinput {down %GoDown%}
			COAcount-=1
			GoDown-=1
			Blockinput, off
			return
}



;msgbox % lotnumber . COAnumber[1] "`n" lotnumber . COAnumber[2] "`n" Lotnumber  COAnumber[3] "`n"
return



	;FileReadLine, COAnumber, H:\QC LAB\MH\Stuff\BatchCOA.txt, %NumberofCOA%
	;NumberofCOA-=1



#ifwinactive, ahk_class SciTEWindow
F11::
run, H:\QC LAB\MH\Stuff\AHK\EditCode.exe
ExitApp
Return




;{ :::::::::::::::::::::::::::::::::::Internet Explorer :::::::::::::::::::::::::::::::::
#IfWinActive, STARLIMS10.Live ahk_class IEFrame ahk_exe iexplore.exe
;rbutton::mouseclick, R
NumpadSub::Raw_Material(select1, samplegroup1, grouptemplate1)
NumpadDiv::Item_Number(select1)
NumpadMult::Bulk_Liquid(select1, samplegroup1, grouptemplate1)
NumpadAdd & NumpadDot::
Mbutton & WheelDown::Attatch(SGattachment1, PVattachment1, pickScanner)
Mbutton & Wheelup::
Attatch(SGattachment1, PVattachment1, pickComponent)
sleep 100
sendinput, {ctrldown}e{ctrlup}
return
Numpadmult & numpad0::Change_Rep(changerep1, 10)
Numpadmult & numpad1::Change_Rep(changerep1, 1)
Numpadmult & numpad2::Change_Rep(changerep1, 2)
NumpadAdd & NumpadEnter::
sendinput, {space}
Auto_Select(Aclass1, Cbox1)
return
Mbutton::
Click,
Click, 2
Auto_Select(Aclass1, Cbox1)
return
End:: ;{;Adjust columb
	MouseClickDrag, L, 97, 192, 115, 192, 2
	sleep 250
	Mouseclick, L, 96, 403, 2
	Mouseclick, L, 96, 403, 2
	sleep 200
	gosub, ScrollUp1
	return
	Scrollup1:
	loop, 300
		sendinput {WheelUp}
Return ;}
;}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	