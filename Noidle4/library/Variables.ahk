#Persistent
#SingleInstance force
#noenv
SetNumlockState AlwaysOn
coordmode, mouse,Client
SetKeyDelay, 100
SetDefaultMouseSpeed, 0
DetectHiddenText, On
SetTitleMatchMode, 2
SetTimer, MoveMouse
traytip, , [ Home ] key for more info,
;Menu, Tray, Icon, library\Fish.ico,

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
PVAttachment = 650, 334
SGAttachment = 350, 316
pickScanner = sc
pickComponent = com
ChangeRep = 673, 316
ReleaseRun = 771, 142
AdjustA = L, 97, 120, 115, 122, 2
AdjustB = L, 96, 342, 2


BatchTemplateLink = WindowsForms10.STATIC.app.0.33c0d9d4, ahk_class WindowsForms10.Window.8.app.0.33c0d9d, Select Login Method, Batch Template, left, 1 
AutoSelectCombobox = WindowsForms10.COMBOBOX.app.0.33c0d9d1
AutoSelectWindow = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
AttachmentWindow = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
Window_LotTemplateLogin = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
Control_SampleGroupTemplateBox = WindowsForms10.COMBOBOX.app.0.33c0d9d2
Control_SampleGroupBox = WindowsForms10.COMBOBOX.app.0.33c0d9d1 
Click_SampleGroupTemplate = 700, 80
Click_SampleGroupBox = 220, 80




Adobe = AcroRd32.exe
Excel = EXCEL.EXE
Window = WINWORD.EXE

FormatTime, Year,,yy
FormatTime, Today,, dd
FormatTime, Month,, MM
Formattime, Date,, MMddyy
JulianMonth := ["A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M"]
LetterMonth := JulianMonth[month]
SingleYear = %year%{left}{backspace}{right}
dailyStdDate = alch{space}std{space}%month%%today%%year%{space}MH
BPCSdate = %month%{right}%today%{right}%year%{right}{down}{left 8}
batchNumber = %singleYear%%lettermonth%
Lotnumber = %Year%000

HelpBox = 
( 	
____________ View Process Sample Tab  `n
-Press [ NumPad( / ) ]  to search for an Item Number `n 
-Press [ NumPad( * )  ]  to  search for Bulk Liquid `n 
-Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n 
____________ Create Batch Tab`n`n (wont) always work the 1st time)`n 
-Press [ NumPad( * ) ]  to create Bulk Liquid batch `n 
-Press [ NumPad( - ) ] to create a Raw Material  `n`n 
____________ My Service Group Pending Test Tab  `n 
-Press [ End ] to make the Run# column fit `n 
-Press [ NumPad( - ) ]  to search for a Raw Material `n 
-Press [ Middle Click ] or [ Numpad( + ) & Numpad( Enter ) ] to auto-select result`n 
-Press ""and"" Roll [ Mouse Wheel Down ] to attatch a file `n`n 
____________ Miscellaneous  `n
-The [ Numpad( Enter ) ] is usable in more places `n 
-Press [ Numpad( + ) & Numpad( 0 ) ] at the same time to open the calculator`n 
-Press [ Insert ] to set the digits in the middle of the lot# 
         (currently: `"%lotnumber%___`") `n`n`n`n`n 
ver. %version%
)



