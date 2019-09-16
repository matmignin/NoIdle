
#IfWinActive, STARLIMS10.Live (Master) - Site: NY - User: MAT.HOUGH,





;{_________________________XV.exe commands________________________
#IfWinActive, STARLIMS10.Live ahk_exe xv.exe

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
	return ;}
















;|||||||||||||||||||Options


Numpadadd::Sendinput, {shift down}={shift Up}
NumpadSub::Sendinput -
Pause::pause
Numpadadd & numpadsub::Sendinput, %Lotnumber%
Numpadadd & numpadmult::Sendinput, %bulkliquid%
F11 & F12::
NumLock & NumpadDiv::
	Sendinput, mat.hough{tab}
	sendinput, %password%{enter}
	return
	#IfWinActive,


#IfWinActive, Replicates Number
NumpadEnter::
	enter::sendinput {tab}{space}
	#Ifwinactive,   ;}



F11 & F10::exitapp


Insert::
	InputBox, FillerZeros, Lot Code, How many filler zeros in the current lot numbers , , 240, 180,, 0000
	Lotnumber = %Year%%FillerZeros%
	return
NumLock & numpad7::
	traytip, , Autoclosing Scanner window, 2
	SetTimer, ScannerClose
	return

Numlock & Delete::
	ControlClick, WindowsForms10.STATIC.app.0.202c66626 Select, STARLIMS10.Live,,,, NA
	return

ScannerClose:
	IfWinActive, EPSON Scan
	Send, {ALT DOWN}{TAB}{ALT UP}
	return
PumpOff:
	IfWinActive, LC Hands On
	msgbox, will send the key
	return

MoveMouse:
	If ( A_TimeIdle > 99999 ) {
	MouseMove, 1 , 1,, R
	MouseMove, -1,-1,, R
	}
	return
;}

Numlock & Numpadsub::exitapp
	#ifwinactive,


;{::::::::::::::::::::::::::::::::::: adjust columb ::::::::::::::::::::::::::::::::::
End::
	MouseClickDrag, L, 97, 120, 115, 122, 2
	sleep 250
	Mouseclick, L, 96, 342, 2
	Mouseclick, L, 96, 342, 2
	sleep 200
	gosub, ScrollUp2
	return
	Scrollup2:
	loop, 300
	sendinput {WheelUp}
	Return ;}




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
  Numlock::winclose, Select batches
  numpadenter::!o ;sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
  Enter::!o ;Sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
#ifwinactive, Lot template login,
  numpadenter::!o
  Enter::!o
  ;}




;||||||||||||||||||||||||||||||||||||||Sample Test Group

Mbutton & Rbutton::Click, 413, 384 L ;|||||add to run
  Mbutton:: ;{  ||||||||||  autoselect
    Click,
    Click, 2
    Auto_Select(Aclass2, Cbox2)
    return ;}


;{::::::::::::repetitive resulst
#IfWinActive, STARLIMS10.Live (Master)
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



