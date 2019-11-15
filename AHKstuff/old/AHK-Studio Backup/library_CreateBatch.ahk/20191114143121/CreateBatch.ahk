CreateBatch() {
	firstnumber =
	InputBox, itemNumber, Item Number, Enter the Item Number., , 240, 180
	firstNumber := substr(itemNumber, 1,1)
	if ErrorLevel
		exit
	else
		send {tab}{tab}{100}{enter}
	sleep 500
	click, %samplegroup%, left, 1
	if firstNumber contains 4 
	{
		Control, Choose, 2, WindowsForms10.COMBOBOX.app.0.33c0d9d1, Lot template login
		batchOrLot = 9L
		return
	} 
	if firstNumber not contains 4
	{
		Control, Choosestring, "Raw Material", WindowsForms10.COMBOBOX.app.0.33c0d9d1, Lot template login
		batchOrLot = 19000
		return
	}
	sleep 600
	Click, 760, 86 Left, 1
	sleep 200
	send %itemNumber%
	sendinput {enter}{tab}%batchOrLot%
	return
}





/*   
	Control, ChooseString, % Pick, % AutoSelectCombobox, % AutoSelectWindow
	ControlGet, ItemList, List,, WindowsForms10.COMBOBOX.app.0.33c0d9d1, ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	Lot template login
	WindowsForms10.COMBOBOX.app.0.33c0d9d1
	Client:	275, 84 (recommended)]
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