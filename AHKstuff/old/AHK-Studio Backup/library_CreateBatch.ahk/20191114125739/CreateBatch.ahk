Numlock & numpadadd::CreateBatch()


CreateBatch() {
	InputBox, itemNumber, Item Number, Enter the Item Number., , 240, 180
	firstNumber := substr(itemNumber, 1,1)
	if ErrorLevel
		exit
	else
		ControlClick, WindowsForms10.STATIC.app.0.33c0d9d5, Select Login Method, Batch Template
	if firstNumber contains 4 {
		ControlClick, WindowsForms10.COMBOBOX.app.0.33c0d9d1, Lot template login, Bulk Liquid
		batchOrLot = 9L
	}
	if firstNumber contains 7 {
		Msgbox, RawMaterial
		;sendinput r{enter}
		batchOrLot = 19000
	}
	else
		exit
	Click, 760, 86 Left, 1
	sleep 200
	send %itemNumber%
	sendinput {enter}{tab}%batchOrLot%
	return
}


/*   example of old way of doing it
	send {tab}{tab}{enter}
	Click, %samplegroup% Left, 1
	sendinput b{enter}
	Click, %grouptemplate% Left, 1
	send %Bulknumber%
	Sendinput {enter}{tab}%batchNumber%
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