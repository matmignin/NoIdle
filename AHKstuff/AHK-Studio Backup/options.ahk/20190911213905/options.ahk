



traytip, , Hit [ Home ] key for more info, 2
;}







;{ :::::::::::::::::::::::::::::::::::::::::Help Screen::::::::::::::::::::::::::
Home::
Msgbox, , Things to do, ____________ View Process Sample Tab of LIMS ___________________________________ `n`n -Press [ NumPad( / ) ]  to search for an Item Number `n -Press [ NumPad( * )  ]  to  search for Bulk Liquid `n -Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n____________ Create Batch Tab of LIMS ___________________________________________ `n(doesnt always work depending on the computers cashe)`n -Press [ NumPad( * ) ]  to create Bulk Liquid batch `n -Press [ NumPad( - ) ] to create a Raw Material  `n`n____________ My Service Group Pending Test tab of LIMS ________________________`n`n -Press [ End ] to make the `"Run#`" column fit `n -Press [ NumPad( - ) ]  to search for a Raw Material `n -Press [ Middle Click ] or [ Numpad( + ) & Numpad( Enter ) ] to auto-select result`n -Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n____________ Miscellaneous _______________________________________________________ `n`n -The [ Numpad( Enter ) ] is usable in more places `n -Press [ Numpad( + ) & Numpad( 0 ) ] at the same time to open the calculator`n -Press [ Insert ] to set the digits in the middle of the lot# (currently: `"%lotnumber%___`") `n`n`n :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::`nIt helps if you dont have the `"Menu Bar`" and `"Favorites Bar`" showing in Internet Explorer because it lowers the screen by 30 pixels.`n`n`tThis works on the non-Internet Explorer version of LIMS now`n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::`nver. %version%
return
;}






;{:::::::::::::::::::::::::::::::::::::: Options ::::::::::::::::::::::::::::::::::::
Capslock & j::sendinput {down}
Capslock & k::sendinput {up}
Capslock & h::sendinput {left}
Capslock & l::sendinput {right}
Capslock & x::sendinput {Delete}
Capslock & 4::sendinput {end}
Capslock & 6::sendinput {Home}
Capslock & w::sendinput {CtrlDown}{right}{CtrlUp}
Capslock & d::sendinput {home}{SHIFTDown}{end}{shiftUp}{delete}
Capslock & o::sendinput {end}{return}{down}
Capslock & b::sendinput {CtrlDown}{left}{CtrlUp}

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
F11 & F10::exitapp


NumpadEnter::
enter::sendinput !o
#IfWinActive, Replicates Number
	NumpadEnter::
	enter::sendinput {tab}{space}
#IfWinActive, Select batches 
	Numlock::winclose, Select batches
	numpadenter::!o ;sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
	Enter::!o ;Sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
	#ifwinactive, Lot template login,
	numpadenter::!o
	Enter::!o
	#ifwinactive,
		
Insert::
InputBox, FillerZeros, Lot Code, How many filler zeros in the current lot numbers , , 240, 180,, 0000
Lotnumber = %Year%%FillerZeros%
return
NumLock & numpad7::
traytip, , Autoclosing Scanner window, 2
SetTimer, ScannerClose
return
XButton1::
MouseGetPos cx, cy
Click
Click 417, 447
Sleep 200
MouseMove %cx%, %cy%
return
Numlock & Delete::
ControlClick, WindowsForms10.STATIC.app.0.202c66626 Select, STARLIMS10.Live,,,, NA
return


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



Numlock & Numpadsub::exitapp