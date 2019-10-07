

#Persistent
ToolTip, Timed ToolTip`nThis will be displayed for 5 seconds.
SetTimer, RemoveToolTip, -5000
return

RemoveToolTip:
ToolTip
return

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


;|||||||||||||||||||auto attatch COA from list
Numlock & 0::
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

numlock & \::
	msgbox, 1 + 10 min hour timer set. `n just leave the Setup Instrument window open and leave. the computer will automatically log you off 10min after the run starts. (make sure you check the Start Run When Ready box)
	Menu, Tray, Icon, H:\QC LAB\MH\Stuff\Icons\Clock.ico,
	Menu, Tray, tip, is set to shut down soon. `n .
	Settimer, ShutdownTime, 60000
	return
return






;msgbox % lotnumber . COAnumber[1] "`n" lotnumber . COAnumber[2] "`n" Lotnumber  COAnumber[3] "`n"
return



	;FileReadLine, COAnumber, H:\QC LAB\MH\Stuff\BatchCOA.txt, %NumberofCOA%
	;NumberofCOA-=1

