
#IfWinActive, STARLIMS10.Live (Master)
;:::idk
Mbutton & Rbutton::Click, 413, 384 L

#IfWinActive, Replicates Number
NumpadEnter::
enter::sendinput {tab}{space}


;::::change test replicates
Numpadmult & numpad0::
;InputBox, inputNumberOf, ,How many Measurments?? , , 240, 180,, 0000
Change_Rep(changerep, 10, 4)
return
Numpadmult & numpad1::Change_Rep(changerep, 1, 1)
Numpadmult & numpad2::Change_Rep(changerep, 2, 1)


;::::::autofile results
NumpadAdd & NumpadDiv:: ;{
	InputBox, AutoFillCount, AutoFill, how many results? , , 240, 180,, 0000
	loop, %autofillcount%
	{
		sendinput, {space}
		WinWaitActive, Resent List ahk_exe xv.exe, , 3
		If ErrorLevel {
			sendinput {backspace}{down}
			click, %changerep% Left, 1
			WinWait, Replicates Number, , 3
			if ErrorLevel
			{
				Change_Rep(changerep, 10, 1)
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
		Auto_Select(Aclass, Cbox)
		sleep 200
		sendinput {alt down}o{alt up}
		sleep 400
	}
	return 
	
	+Tab::Sendinput {tab 2}{down}
	
	
	
	
	
	
	
	
;{::::::::::::::::::::::::::depending on the numpadenumber you use, enters multiple measurement results 9x in the Quick Results window.::::::::::::::::::::::::::::::::::
	#Ifwinactive, Quick Results
	
	

;::::enter 2 measurement results 9 times
	Numpadmult & Numpad1::ReplicateByNine(1)
	Numpadmult & Numpad2::ReplicateByNine(2)
	Numpadmult & Numpad3::ReplicateByNine(3)
	Numpadmult & Numpad4::ReplicateByNine(4)
	Numpadmult & Numpad5::ReplicateByNine(5)
	Numpadmult & Numpad6::ReplicateByNine(6)
	Numpadmult & Numpad7::ReplicateByNine(7)
	Numpadmult & Numpad8::ReplicateByNine(8)
	Numpadmult & Numpad9::ReplicateByNine(9)
	
	
	
	/*
		Numpadmult & Numpad1::
		Inputbox, MultiEnter, Type a value to enter 9x,, , 300, 100, , 0
		loop 9 {
			Sendinput, %MultiEnter%{up}{left 2}{down 2}
		}
		sleep 200
		sendinput {alt down}o{alt up}
		return
		
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
		return
	*/
	
;::::repeat multiple auto select results
	NumpadAdd & NumpadEnter::
	sendinput, {space}
	Auto_Select(Aclass, Cbox)
	return
	
	NumpadAdd & Numpad1::MultipleAutoSelect(1)
	NumpadAdd & Numpad2::MultipleAutoSelect(2)
	NumpadAdd & Numpad3::MultipleAutoSelect(3)
	NumpadAdd & Numpad4::MultipleAutoSelect(4)
	NumpadAdd & Numpad5::MultipleAutoSelect(5)
	
	
	
	
	
