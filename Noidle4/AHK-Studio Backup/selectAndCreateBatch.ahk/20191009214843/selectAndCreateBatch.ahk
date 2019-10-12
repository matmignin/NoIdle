samplegroup2 = 268, 83
grouptemplate2 = 760, 83
Search2 = 70, 60


#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
NumpadSub::Raw_Material(select2, samplegroup2, grouptemplate2)
NumpadDiv::Item_Number(select2)
NumpadMult::Bulk_Liquid(select2, samplegroup2, grouptemplate2)



;:::::::::select batches/lots/material number
#IfWinActive, Select batches
Numlock & numpadmult::
	Click, %Search1% left, 1
	sendinput {tab 3}%BatchNumber%
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

CreateBatch() {
	InputBox, itemNumber, Item Number, Enter the Item Number., , 240, 180
	if ErrorLevel
		Return
	else
	firstNumber := substr(itemNumber, 1)
	msgbx, %firstNumber%
		sendinput {tab}{tab}{enter}
	Click, %samplegroup% Left, 1
	if (firstNumber="4") {
	  sendinput b{enter}
	  batchOrLot = %batchNumber%
	  }
	else {
	  sendinput r{enter}
	  batchOrLot = %lotNumber%
	  }
	Click, %grouptemplate% Left, 1
	sleep 200
	send %itemNumber%
	sendinput {enter}{tab}%batchOrLot%
	return
}
