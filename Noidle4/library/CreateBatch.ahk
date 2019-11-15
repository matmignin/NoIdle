CreateBatch() {
	global
	firstNumber =
	SampleGroupSelection =
	InputBox, itemNumber, Item Number, Enter the Item Number., , 240, 180
	WinActivate, Select Login Method		
	firstNumber := substr(itemNumber, 1,1)
	if ErrorLevel
		exit
	else
		send {tab}{tab}{100}{enter}
	sleep 500
	click, 220, 80 
	if firstNumber contains 4 
		send bu{esc}
	if firstNumber not contains 4
		send ra{esc}
	sleep 600
	Click, 700, 80
	ControlGet, MatCodeList, List,, WindowsForms10.COMBOBOX.app.0.33c0d9d2, ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	control, ChooseString, %itemNumber%, WindowsForms10.COMBOBOX.app.0.33c0d9d2, ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	sendinput {enter}{tab}
	sleep 200
	if firstNumber contains 4 
		sendinput %batchNumber%
	if firstNumber not contains 4
		Sendinput %lotnumber%
	return
}



/* 
	BatchTemplateLink = WindowsForms10.STATIC.app.0.33c0d9d4, ahk_class WindowsForms10.Window.8.app.0.33c0d9d, Select Login Method, Batch Template, left, 1 
	AutoSelectCombobox = WindowsForms10.COMBOBOX.app.0.33c0d9d1
	AutoSelectWindow = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	AttachmentWindow = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
	Window_LotTemplateLogin = 
	Control_SampleGroupTemplateBox = WindowsForms10.COMBOBOX.app.0.33c0d9d2
	Control_SampleGroupBox = WindowsForms10.COMBOBOX.app.0.33c0d9d1 
	Click_SampleGroupTemplate = 
	Click_SampleGroupBox = 
	
	
	
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