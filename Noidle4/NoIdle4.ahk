Version = 4.16

#Include library\Variables.ahk
#Include library\Fuctions.ahk
#Include library\other.ahk

/*
	DetectTab() 
	if tab contains View Process Samples {
		
	}
	if tab contains Pending Tests {

	}
	if Tab contains Create Batch {
		
		}

*/


return





ViewSample(ProductCode) { 
	global
	Click, %select%
	WinWait Select batches, , 4
	sleep 200
	sendinput {tab 3}%ProductCode%
	If ProductCode = %LotNumber%
		Swap_code = "Lot"
	If ProductCode = %BatchNumber%
		Swap_code = "Batch"
}

STARLIMS:
#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
Numpadadd::
NumpadSub::ViewSample(LotNumber)
NumpadDiv::Item_Number(select)
NumpadMult::ViewSample(BatchNumber)
End::Adjust_Columns()


;:::attatch a file
numpadAdd & Numpaddot::Attatch("Scanner", 1)
Mbutton & WheelDown::Attatch("Scanner", 0)
Mbutton & Wheelup::Attatch("Component", 1)

Attatch(PickFolder, Search) {
	Global
	DetectTab() 
	if tab contains View Process Samples
		click, %PVattachment%
	if tab contains Pending Tests
		click, %SGattachment%
	Sleep 400
	Winwait, Attachments,, 5
	sleep 200
	Click, %add%
	Blockinput, on
	sendinput, {shiftdown}{tab 3}{shiftup}%PickFolder%{300}{space}
	sleep 200
	send, {TAB}{space}
	if Search = 1
		sendinput, ^e
	Blockinput, off
	winwait, Attachments
	sleep 200
	WinClose, Attachments
	return
	
}



Mbutton::Auto_Select(AutoSelectWindow, AutoSelectCombobox, 1) ;*[NoIdle4]
NumpadAdd & NumpadEnter::Auto_Select(AutoSelectWindow, AutoSelectCombobox, 0)
NumpadAdd & Numpad1::MultipleAutoSelect(1)
NumpadAdd & Numpad2::MultipleAutoSelect(2)
NumpadAdd & Numpad3::MultipleAutoSelect(3)
NumpadAdd & Numpad4::MultipleAutoSelect(4)
NumpadAdd & Numpad5::MultipleAutoSelect(5)

;::::change test replicates
Numpadmult & numpad0::Change_Rep(changerep, 10, 1)
Numpadmult & numpad1::Change_Rep(changerep, 1, 1)
Numpadmult & numpad2::Change_Rep(changerep, 2, 1)




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
WinWaitActive Select batches
keywait, NumpadEnter
SubmitAttatchment()
sleep 400
IfWinActive, Attachments
	Winclose, Attachments
return


Lot_Template_Login:
#ifwinactive, Lot template login,
numpadenter::
Enter::!o


Select_Batches:
#IfWinActive, Select batches
NumpadAdd::SwapCode()
Numlock & numpadmult::sendinput {click %search%}{tab 3}%BatchNumber%
Numlock & Numpadsub::sendinput {click %search%}{tab 3}%lotnumber%
Numpaddiv::sendinput {Click %Search%}{right}{tab 2}{enter}{right}mat{space}{enter}{tab 2}{down 3}{right 4}
enter::
numpadenter::click, %SelectBatchesOK%
Numlock::winclose, Select batches


;::::::::::create batch widow::::::
Select_Login_Method:
#IfWinActive, Select Login Method
numpadmult::
numpadsub::
numpadadd::CreateBatch()



;::::::::::::::::::::review Run
Numlock & right::Click, 771, 141 Left, 1 ;RELEASE RUN
Numlock & Down::ReviewRunLoop()
Numlock & pgup::ReviewRun() 


Replicates_Number:
#IfWinActive, Replicates Number
NumpadEnter::
enter::sendinput {tab}{space}


Quick_Results:
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
#IfWinActive, Attachments
Numlock::Winclose, Attachments
NumpadEnter::Winclose, Attachments
enter::Winclose, Attachments

Mbutton::
Click, %add% left, 1
WinWaitActive Open, , 2
if ErrorLevel
	return
Else
	sendinput {tab 7}
sendinput {up 7}{space}
Return


Open:
#ifwinactive, Open
NumpadEnter::SubmitAttatchment() 
