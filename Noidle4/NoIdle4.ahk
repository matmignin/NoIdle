Version = 5.01

#Include library\Variables.ahk
#Include library\Fuctions.ahk
#Include library\other.ahk


return




STARLIMS:
#IfWinActive, STARLIMS10.Live ahk_exe xv.exe
Numpadadd::
	DetectTab()
	if tab contains View Process Samples
		{
		ViewSample(BatchNumber)
		return
		}
	else if Tab contains Create Batch
	{
		click, %select%
		winwait, Select Login Method ahk_class WindowsForms10.Window.8.app.0.33c0d9d
		CreateBatch()
		RETURN
		}
	else if Tab contains My Service Groups Pending Tests
	{
		Auto_Select(AutoSelectWindow, AutoSelectCombobox, 0)
		RETURN
	}
	else if WinActive(Select batches)
	{
		ViewSample(BatchNumber)
	}
else
	return

Numpadsub::
	DetectTab()
	if tab contains View Process Samples
	{
		ViewSample(LotNumber)
		return
	}
	else if Tab contains Create Batch
	{
		Sendinput, -
		RETURN
	}
	else if Tab contains My Service Groups Pending Tests
	{
		Sendinput, -
		Return
	}
	else
		return



Mbutton::
DetectTab()
if tab contains View Process Samples
{
		Attatch("Scanner", 0)
		return
		}
	else if Tab contains Create Batch
	{
		RETURN
		}
	else if Tab contains My Service Groups Pending Tests
	{
		Auto_Select(AutoSelectWindow, AutoSelectCombobox, 0)
		RETURN
		}
	else
		return


NumpadDiv::Item_Number(select)
NumpadMult::ViewSample(BatchNumber)
end::
DetectTab()
	if tab contains View Process Samples
	{
		Adjust_Columns()
		return
	}
	else if Tab contains Create Batch
	{
                sendinput, {end}
		RETURN
	}
	else if Tab contains My Service Groups Pending Tests
	{
		Adjust_Columns()
		Return
	}
	else
        {
                sendinput, {end}
                return
       }



;:::attatch a file
Mbutton & Wheelup::Attatch("Scanner", 1)
Mbutton & WheelDown::Attatch("Scanner", 0)
numpadAdd & Numpaddot::Attatch("Component", 1)


;Mbutton::Auto_Select(AutoSelectWindow, AutoSelectCombobox, 1) ;*[NoIdle4]
;NumpadAdd & NumpadEnter::Auto_Select(AutoSelectWindow, AutoSelectCombobox, 0)
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
Numpaddiv::sendinput {Click %Search%}{right}{tab 2}{enter}{right}mat{space}{enter}{tab 2}{down 3}{right 4}
enter::
numpadenter::click, %SelectBatchesOK%
Numlock::winclose, Select batches


;::::::::::create batch widow::::::
Select_Login_Method:
#IfWinActive, Select Login Method
numpadadd::CreateBatch()
#IfWinActive, Lot template login
numpadadd::CreateBatch()
#ifwinactive,

;::::::::::::::::::::review Run
;#IfWinActive, STARLIMS v10 (Master) - Site ahk_class IEFrame
Numlock & right::Click, 771, 141 Left, 1 ;RELEASE RUN
Numlock & Down::ReviewRunLoop()
Numlock & pgup::ReviewRun()




numlock & up::
Click, 771, 141 Left, 1
sleep 3500
sendinput {down}
return



numlock & pgdn::
	Click, %RRviewx%, %RRviewy% Left, 1
	WinWait, ahk_class WindowsForms10.Window.8.app.0.202c666 ahk_exe IEXPLORE.EXE, , 2
	WinMove, ahk_class WindowsForms10.Window.8.app.0.202c666 ahk_exe IEXPLORE.EXE,, 861, 605, 798, 385
	Sendinput {tab 3}{enter}
	winwait, ahk_class AcrobatSDIWindow ahk_exe AcroRd32.exe, , 2
	WinMove, ahk_class AcrobatSDIWindow ahk_exe AcroRd32.exe,, 5, 332, 550, 684
	return
#ifwinactive




#IfWinActive, ahk_class AcrobatSDIWindow ahk_exe AcroRd32.exe
numlock & pgup::
     WinClose, ahk_class AcrobatSDIWindow ahk_exe AcroRd32.exe
     sleep 200
     sendinput {tab 4}{enter}
     Return

Mbutton & Rbutton::WinClose, ahk_class AcrobatSDIWindow ahk_exe AcroRd32.exe

#ifwinactive



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

