

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
Numpadadd & numpadmult::Sendinput, %batchNumber%
Numlock & Numpaddiv::login(PDIUser, PDIPassword)
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
;Enter::!o ;Sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
Enter::ControlClick, WindowsForms10.Window.8.app.0.33c0d9d15 Ok, Select batches,,,
#ifwinactive, Lot template login,
numpadenter::!o
Enter::!o
#ifwinactive,

Insert & Home::
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





