
;{:::::::::::::::::::::::::::::::::::::review Run::::::::::::::::::::::::::::::::::::::::



  Numlock & up::  ;{::::::::::::::: ::review run Loop ::::::::
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




Numlock & right:: ;{ |||||||||| release run
	Click, 771, 141 Left, 1
	return ;}
; }
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
