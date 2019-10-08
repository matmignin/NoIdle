


;{:::::::::::::::::::: Vim controls
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
Numpadadd & numpadsub::Sendinput, %Lotnumber%
Numpadadd & numpadmult::Sendinput, %bulkliquid%
NumLock & NumpadDiv::login(PDIuser, PDIpassword)
return
F11 & F10::exitapp
#IfWinActive,


;#IfWinActive, ahk_exe xv.exe
;NumpadEnter::
;enter::sendinput !o
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

;::::??
Numlock & Delete::
ControlClick, WindowsForms10.STATIC.app.0.202c66626 Select, STARLIMS10.Live,,,, NA
return


;::::::::::::::::::::: adjust columns width
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
Return



