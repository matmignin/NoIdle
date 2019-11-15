CreateBatch() {
	firstnumber =
	InputBox, itemNumber, Item Number, Enter the Item Number., , 240, 180
	firstNumber := substr(itemNumber, 1,1)
	if ErrorLevel
		exit
	else
		ControlClick, x355 y72, Select Login Method, Batch Template
	sleep 200
	if firstNumber contains 4 
	{
		ControlClick, WindowsForms10.COMBOBOX.app.0.33c0d9d1, Lot template login, Bulk Liquid
		batchOrLot = 9L
	} 
	if firstNumber Not contains 4 
	{
		;sendinput r{enter}
		batchOrLot = 19000
	}
	Click, 760, 86 Left, 1
	sleep 200
	send %itemNumber%
	sendinput {enter}{tab}%batchOrLot%
	return
}


/*   
example of old way of doing it
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