﻿
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
#Ifwinactive,    ;}

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