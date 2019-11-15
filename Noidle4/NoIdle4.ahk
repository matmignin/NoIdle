Version = 4.14

#Include library\Variables.ahk
#Include library\Fuctions.ahk
#Include library\CreateBatch.ahk
#Include library\other_apps.ahk



return





STARLIMS:
#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
NumpadSub::Raw_Material(select, samplegroup, grouptemplate)
NumpadDiv::Item_Number(select)
NumpadMult::Bulk_Liquid(select, samplegroup, grouptemplate)
End::Adjust_Columns()

Mbutton::   ;||||||||||  autoselect result
Click,
Click, 2
Auto_Select(AutoSelectWindow, AutoSelectCombobox)
return 

NumpadAdd & Numpad1::MultipleAutoSelect(1)
NumpadAdd & Numpad2::MultipleAutoSelect(2)
NumpadAdd & Numpad3::MultipleAutoSelect(3)
NumpadAdd & Numpad4::MultipleAutoSelect(4)
NumpadAdd & Numpad5::MultipleAutoSelect(5)
;::::change test replicates
Numpadmult & numpad0::Change_Rep(changerep, 10, 4)
Numpadmult & numpad1::Change_Rep(changerep, 1, 1)
Numpadmult & numpad2::Change_Rep(changerep, 2, 1)

;::::repeat multiple auto select results
NumpadAdd & NumpadEnter::
sendinput, {space}
Auto_Select(AutoSelectWindow, AutoSelectCombobox)
return

;:::attatch a file
;Numpadadd & Numpaddot::
Mbutton & WheelDown::Attatch(SGattachment, PVattachment, pickScanner)
Mbutton & Wheelup::
Attatch(SGattachment, PVattachment, pickComponent)
sleep 100
sendinput, {ctrldown}e{ctrlup}
return


; ::::::::::auto add scanned COAs
Numpadsub & Numpaddot:: 
InputBox, COAcount, COA, how many COAs , , 240, 180,, 0000
NumberofCOA = %COAcount%
COAcount-=1
GoDown = {down %COAcount%}
sleep 300
Raw_Material(select, samplegroup, grouptemplate)
sleep 300
AttatchCOA(PVattachment)
winwait, Select batches
keywait, NumpadEnter
SubmitAttatchment()
sleep 400
IfWinActive, Attachments
	Winclose, Attachments
return

;  ||||||||||auto attach COA
NumpadAdd & NumpadDot:: 
Raw_Material(select, samplegroup, grouptemplate)
WinWaitClose, Select batches
sleep 1500
AttatchCOA(PVattachment)
return 


return   
LotTemplateLogin:
#ifwinactive, Lot template login,
numpadenter::!o
Enter::!o


SelectBatches:
#IfWinActive, Select batches
	;:::::::::select batches/lots/material number
Numlock & numpadmult::
Click, %Search% left, 1
sendinput {tab 3}%BatchNumber%
return
Numlock & Numpadsub::
Click, %Search% left, 1
sendinput {tab 3}%lotnumber%
return
Numpaddiv::
Click, %Search% left, 1
sendinput {right}{tab 2}{enter}{right}mat{space}{enter}{tab 2}{down 3}{right 4}
return
numpadenter::click, 589, 391
Numlock::winclose, Select batches
numpadenter::!o ;sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
;Enter::!o ;Sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
Enter::ControlClick, WindowsForms10.Window.8.app.0.33c0d9d15 Ok, Select batches,,,


;::::::::::create batch window::::::
SelectLoginMethod:
#IfWinActive, Select Login Method
numpadadd::CreateBatch()

/*
numpadMult::
InputBox, Bulknumber, Item Number, Enter the BULK LIQUID Item Number., , 240, 180
if ErrorLevel
	Return
else
	sendinput {tab}{tab}{enter}
Click, %samplegroup% Left, 1
sendinput b{enter}
Click, %grouptemplate% Left, 1
sleep 200
send %Bulknumber%
Sendinput {enter}{tab}%BatchNumber%
return

numpadSub::
InputBox, rawMaterialNumber, Item Number, Enter the RAW MATERIAL Item Number., , 240, 180
if ErrorLevel
	Return
else
	sendinput {tab}{tab}{enter}
Click, %samplegroup% Left, 1
sendinput r{enter}
Click, %grouptemplate% Left, 1
sleep 200
send %rawMaterialNumber%
sendinput {enter}{tab}%lotnumber%
return

*/


;{::::::::::::::::::::review Run
Numlock & right::Click, 771, 141 Left, 1 ;RELEASE RUN
Numlock & Down::ReviewRunLoop()
Numlock & pgup::ReviewRun() 


ReplicatesNumber:
#IfWinActive, Replicates Number
NumpadEnter::
enter::sendinput {tab}{space}


QuickResults:
#Ifwinactive, Quick Results
numpadenter::!o
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













Attatchments:
#IfWinActive, Attachments ahk_class WindowsForms10
Numlock::Winclose, Attachments
NumpadEnter::Winclose, Attachments
enter::Winclose, Attachments

Mbutton::
Click, %add% left, 1
WinWait, Open , , 2
if ErrorLevel
	return
Else
	sendinput {tab 7}
sendinput {up 7}{space}
Return


Open:
#ifwinactive, Open
NumpadEnter::SubmitAttatchment() 




AnyWindow:
;_______________Options
#IfWinActive,
Numpadadd::Sendinput, {shift down}={shift Up}
NumpadSub::Sendinput -
Numpadadd & numpadsub::Sendinput, %Lotnumber%
Numpadadd & numpadmult::Sendinput, %batchNumber%
Numlock & Numpaddiv::login(PDIUser, PDIPassword)
Home::Msgbox, , Things to do, %HelpBox%
Insert & Home::
InputBox, FillerZeros, Lot Code, enter redundent digits in Lot code that follow %year%   , , 240, 180,, 0000
Lotnumber = %Year%%FillerZeros%


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

F11 & F12::
sendinput ^s
Reload
return

F11::SENDINPUT {f11}

MoveMouse:
If ( A_TimeIdle > 99999 ) {
	MouseMove, 1 , 1,, R
	MouseMove, -1,-1,, R
}
return
