Version = 4.08
#Persistent
#SingleInstance force
#noenv
SetNumlockState AlwaysOn
coordmode, mouse,Client
SetKeyDelay, 500
SetDefaultMouseSpeed, 0
DetectHiddenText, On
SetTitleMatchMode, 2
SetTimer, MoveMouse
traytip, , Hit [ Home ] key for more info, 2
Menu, Tray, Icon, Icons/Boo.ico,

FileReadLine, PDIuser, %A_Desktop%\loginfo.txt, 1
FileReadLine, PDIPassword, %A_Desktop%\loginfo.txt, 2
FileReadLine, BPCSuser, %A_Desktop%\loginfo.txt, 3
FileReadLine, BPCSPassword, %A_Desktop%\loginfo.txt, 4
FileReadLine, totalChromUser, %A_Desktop%\loginfo.txt, 5
FileReadLine, totalChromPassword, %A_Desktop%\loginfo.txt, 6
FileRead, helptext, *t %A_Desktop%\helptext.txt, 1
samplegroup2 = 268, 83
grouptemplate2 = 760, 83
Search2 = 70, 60
select2 = 45, 73
Add = 55, 55
PVAttachment2 = 650, 334
SGAttachment2 = 350, 316
pickScanner = "sc"
pickComponent = "com"
ChangeRep2 = 673, 316
ReleaseRun2 = 771, 142
AdjustA2 = L, 97, 120, 115, 122, 2
AdjustB2 = L, 96, 342, 2




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
Lotnumber = %Year%0001
Menu, Tray, Icon, Icons/Boo.ico,
Menu, Tray, tip, Press [ Home ] key for shortcuts







Home::
Msgbox, , Things to do, ____________ View Process Sample Tab of LIMS ___________________________________
 `n`n -Press [ NumPad( / ) ]  to search for an Item Number `n
 -Press [ NumPad( * )  ]  to  search for Bulk Liquid `n 
 -Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n
 ____________ Create Batch Tab of LIMS ___________________________________________ `n
 (doesnt always work depending on the computer)`n 
 -Press [ NumPad( * ) ]  to create Bulk Liquid batch `n 
 -Press [ NumPad( - ) ] to create a Raw Material  `n`n____________ My Service Group Pending Test tab of LIMS ________________________`n`n 
 -Press [ End ] to make the `"Run#`" column fit `n -Press [ NumPad( - ) ]  to search for a Raw Material `n -Press [ Middle Click ] or [ Numpad( + ) & Numpad( Enter ) ] to auto-select result`n -Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n____________ Miscellaneous _______________________________________________________ `n`n -The [ Numpad( Enter ) ] is usable in more places `n -Press [ Numpad( + ) & Numpad( 0 ) ] at the same time to open the calculator`n -Press [ Insert ] to set the digits in the middle of the lot# (currently: `"%lotnumber%___`") `n`n`n :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::`n`nver. %version% `n`n`n %helptext%
return   



MoveMouse:
If ( A_TimeIdle > 99999 ) {
	MouseMove, 1 , 1,, R
	MouseMove, -1,-1,, R
}
return

#Include reviewRun.ahk
#Include Attatchments.ahk
#Include Reps.ahk
#Include selectAndCreateBatch.ahk
#Include other_apps.ahk
#Include options.ahk
#Include Functions.ahk



       
