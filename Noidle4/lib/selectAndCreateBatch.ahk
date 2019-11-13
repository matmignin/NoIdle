
#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
NumpadSub::Raw_Material(select, samplegroup, grouptemplate)
NumpadDiv::Item_Number(select)
NumpadMult::Bulk_Liquid(select, samplegroup, grouptemplate)

End::Adjust_Columns()

#IfWinActive, Select batches 
Numlock::winclose, Select batches
numpadenter::!o ;sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
;Enter::!o ;Sendinput {tab}{shift down}{tab 6}{shift Up}{enter}
Enter::ControlClick, WindowsForms10.Window.8.app.0.33c0d9d15 Ok, Select batches,,,
#ifwinactive, Lot template login,
numpadenter::!o
Enter::!o
#ifwinactive,

Mbutton::   ;||||||||||  autoselect result
Click,
Click, 2
Auto_Select(Aclass, Cbox)
return 


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






;{:::::::::::::::::::::::::::::::::::::review Run::::::::::::::::::::::::::::::::::::::::
Numlock & right::Click, 771, 141 Left, 1 ;RELEASE RUN
Numlock & Down::ReviewRunLoop()
Numlock & pgup::ReviewRun() 


;}
