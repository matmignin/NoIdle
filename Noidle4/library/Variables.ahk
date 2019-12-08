#Persistent
#SingleInstance force
#noenv
SetNumlockState AlwaysOn
coordmode, mouse,Client
SetKeyDelay, 100
SetDefaultMouseSpeed, 0
DetectHiddenText, on
SetTitleMatchMode, 2
SetTimer, MoveMouse
traytip, Press [ Home ], For help


FileReadLine, PDIuser, %A_Desktop%\loginfo.txt, 1
FileReadLine, PDIPassword, %A_Desktop%\loginfo.txt, 2
FileReadLine, BPCSuser, %A_Desktop%\loginfo.txt, 3
FileReadLine, BPCSPassword, %A_Desktop%\loginfo.txt, 4
FileReadLine, totalChromUser, %A_Desktop%\loginfo.txt, 5
FileReadLine, totalChromPassword, %A_Desktop%\loginfo.txt, 6



samplegroup = 268, 83
Search = 70, 60
select = 45, 73
Add = 55, 55
SelectBatchesOK = 589, 391
PVAttachment = 650, 334
SGAttachment = 350, 316
Login_Link =
pickScanner = sc
pickComponent = com
ChangeRep = 673, 316
ReleaseRun = 771, 142
AdjustA = L, 97, 120, 115, 122, 2
AdjustB = L, 96, 342, 2

Adobe = AcroRd32.exe
Excel = EXCEL.EXE
Window = WINWORD.EXE
AutoSelectCombobox = WindowsForms10.COMBOBOX.app.0.33c0d9d1
AutoSelectWindow = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
FormatTime, Year,,yy
FormatTime, Today,, dd
FormatTime, Month,, MM
Formattime, Date,, MMddyy
JulianMonth := ["A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M"]
LetterMonth := JulianMonth[month]
SingleYear = %year%{left}{backspace}{right}
dailyStdDate = alch{space}std{space}%month%%today%%year%{space}MH
BPCSdate = %month%{right}%today%{right}%year%{right}{down}{left 8}
BatchNumber = %singleYear%%lettermonth%
LotNumber = %Year%000
BPCSswap = 0
HelpBox = 
( 	
____________ View Process Sample Tab  `n
-Press [ NumPad( + )  ]  to  search for Raw Material `n 
-Press [ NumPad( / ) ]  to search for an Item Number `n 
-Press [ NumPad( * )  ]  to  search for Bulk Liquid `n 
-Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n 
____________ Create Batch Tab`n`n (FIXED)`n  
-Press [ NumPad( + ) ] to create a Bulk Liquid & Raw Material  `n`n 
____________ My Service Group Pending Test Tab  `n 
-Press [ End ] to make the Run# column fit `n 
-Press [ Middle Click ] or [ Numpad( + ) & Numpad( Enter ) ] to auto-select result`n 
-Press ""and"" Roll [ Mouse Wheel Down ] to attatch a file `n`n 
____________ Miscellaneous  `n
-The [ Numpad( Enter ) ] is usable in more places `n 
-Press [ Numpad( + ) & Numpad( 0 ) ] at the same time to open the calculator`n 
-Press [ Insert ] to set the digits in the middle of the lot# 
         (currently: `"%lotnumber%___`") `n`n`n`n`n 
ver. %version%
)


MoveMouse:
	If ( A_TimeIdle > 120000 ) {
		MouseMove, 1 , 1,, R
		MouseMove, -1,-1,, R
	}
	return