samplegroup2 = 268, 83
grouptemplate2 = 760, 83



#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
NumpadSub::Raw_Material(select2, samplegroup2, grouptemplate2)
NumpadDiv::Item_Number(select2)
NumpadMult::Bulk_Liquid(select2, samplegroup2, grouptemplate2)



;{::::::::::select batches/lots/material number
#IfWinActive, Select batches
Numlock & numpadmult::
Click, %Search1% left, 1
sendinput {tab 3}%BulkLiquid%
return
Numlock & Numpadsub::
Click, %Search1% left, 1
sendinput {tab 3}%lotnumber%
return
Numpaddiv::
Click, %Search1% left, 1
sendinput {right}{tab 2}{enter}{right}mat{space}{enter}{tab 2}{down 3}{right 4}
return
numpadenter::

;}

;{::::::::::create batch window::::::
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
Sendinput {enter}{tab}%BulkLiquid%
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

CreateBatch(itemNumber, t, itemType) {
InputBox, itemNumber, Item Number, Enter the RAW MATERIAL Item Number., , 240, 180
if ErrorLevel
	Return
else
	sendinput {tab}{tab}{enter}
Click, %samplegroup% Left, 1
if itemNumber
sendinput %t%{enter}
Click, %grouptemplate% Left, 1
sleep 200
send %rawMaterialNumber%
sendinput {enter}{tab}%lotnumber%
return
}
