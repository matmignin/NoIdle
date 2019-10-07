
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


