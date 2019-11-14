
#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
NumpadSub::Raw_Material(select, samplegroup, grouptemplate)
NumpadDiv::Item_Number(select)
NumpadMult::Bulk_Liquid(select, samplegroup, grouptemplate)



Mbutton::   ;||||||||||  autoselect result
Click,
Click, 2
Auto_Select(Aclass, Cbox)
return 

;::::change test replicates
Numpadmult & numpad0::Change_Rep(changerep, 10, 4)
Numpadmult & numpad1::Change_Rep(changerep, 1, 1)
Numpadmult & numpad2::Change_Rep(changerep, 2, 1)

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


;:::slect product 
Mbutton & Rbutton::Click, 413, 384 L
#IfWinActive, Select batches 
Numlock::winclose, Select batches
numpadenter::!o ;sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
;Enter::!o ;Sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
Enter::ControlClick, WindowsForms10.Window.8.app.0.33c0d9d15 Ok, Select batches,,,
#ifwinactive, Lot template login,
numpadenter::!o
Enter::!o


;:::::::::select batches/lots/material number
#IfWinActive, Select batches
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

;::::::::::create batch window::::::
#IfWinActive, Select Login Method
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


;{::::::::::::::::::::review Run
Numlock & right::Click, 771, 141 Left, 1 ;RELEASE RUN
Numlock & Down::ReviewRunLoop()
Numlock & pgup::ReviewRun() 



#IfWinActive, Replicates Number
NumpadEnter::
enter::sendinput {tab}{space}

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