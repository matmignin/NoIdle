Version = 3.19
#Persistent
#SingleInstance force
SetNumlockState AlwaysOn
coordmode, mouse,Client
#noenv
SetKeyDelay, 500
SetDefaultMouseSpeed, 0
DetectHiddenText, On
SetTitleMatchMode, 2
FormatTime, Year,,yy
FormatTime, Today,, dd
FormatTime, Month,, MM
Formattime, Date,, MMddyy
JulianMonth := ["A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M"]
LetterMonth := JulianMonth[month]
SetTimer, MoveMouse
Menu, Tray, Icon, H:\QC LAB\MH\Stuff\Icons\Boo.ico,
Menu, Tray, tip, Press [ Home ] key for more info
SingleYear = %year%{left}{backspace}{right}
dailyStdDate = alch{space}std{space}%month%%today%%year%{space}MH
BPCSdate = %month%{right}%today%{right}%year%{right}{down}{left 8}
BulkLiquid = %singleYear%%lettermonth%
FileReadLine, BPCSPassword, H:\QC LAB\MH\Stuff\Variables.txt, 1
FileReadLine, PasswordEnd, H:\QC LAB\MH\Stuff\Variables.txt, 2
Password = {shiftdown}K{shiftup}ilgore%PasswordEnd%
Lotnumber = %Year%0001


;select
select2 = 45, 73
Search2 = 70, 60
PVAttachment2 = 650, 334
SGAttachment2 = 350, 316
pickScanner = sc
pickComponent = com
ChangeRep2 = 673, 316
Add = 55, 55
samplegroup = 268, 83
samplegroup2 = 268, 83
grouptemplate = 760, 83
grouptemplate2 = 760, 83
OpenFolderX = 40

;Release runs
ReviewAttachment2 = 136, 316
ReviewAttachment3 = 131, 210
AttachmentWindow2 = ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
Adobe = AcroRd32.exe
Excel = EXCEL.EXE
Window = WINWORD.EXE
ReleaseRun2 = 771, 142
MoveWindow1 = 5, 332, 950, 684
MoveWindow2 =

;adjust columb
AdjustA1 = L, 97, 192, 115, 192, 2
AdjustB1 = L, 96, 403, 2
AdjustA2 = L, 97, 120, 115, 122, 2
AdjustB2 = L, 96, 342, 2


;auto select
Cbox2 = WindowsForms10.COMBOBOX.app.0.33c0d9d1
Aclass2 = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
attatchmentNumb = 0



;{ :::::::::::::::::::::::::::::::::::::::::Help Screen::::::::::::::::::::::::::
Home::
	Msgbox, , Things to do, ____________ View Process Sample Tab of LIMS ___________________________________ `n`n -Press [ NumPad( / ) ]  to search for an Item Number `n -Press [ NumPad( * )  ]  to  search for Bulk Liquid `n -Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n____________ Create Batch Tab of LIMS ___________________________________________ `n(doesnt always work depending on the computers cashe)`n -Press [ NumPad( * ) ]  to create Bulk Liquid batch `n -Press [ NumPad( - ) ] to create a Raw Material  `n`n____________ My Service Group Pending Test tab of LIMS ________________________`n`n -Press [ End ] to make the `"Run#`" column fit `n -Press [ NumPad( - ) ]  to search for a Raw Material `n -Press [ Middle Click ] or [ Numpad( + ) & Numpad( Enter ) ] to auto-select result`n -Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n____________ Miscellaneous _______________________________________________________ `n`n -The [ Numpad( Enter ) ] is usable in more places `n -Press [ Numpad( + ) & Numpad( 0 ) ] at the same time to open the calculator`n -Press [ Insert ] to set the digits in the middle of the lot# (currently: `"%lotnumber%___`") `n`n`n :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::`nIt helps if you dont have the `"Menu Bar`" and `"Favorites Bar`" showing in Internet Explorer because it lowers the screen by 30 pixels.`n`n`tThis works on the non-Internet Explorer version of LIMS now`n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::`nver. %version%
	return
;}




