ChangeRep2 = 673, 316



Numpadmult & numpad0::
;InputBox, inputNumberOf, ,How many Measurments?? , , 240, 180,, 0000
Change_Rep(changerep2, 10, 4)
return
Numpadmult & numpad1::Change_Rep(changerep2, 1, 1)
Numpadmult & numpad2::Change_Rep(changerep2, 2, 1)



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
	
	
