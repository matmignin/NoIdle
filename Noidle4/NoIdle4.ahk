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
FileReadLine, PDIuser, %A_Desktop%\logInfo.txt, 1
FileReadLine, PDIPassword, %A_Desktop%\logInfo.txt, 2
FileReadLine, BPCSPassword, %A_Desktop%\logInfo.txt, 3
FileReadLine, totalChromUser, %A_Desktop%\logInfo.txt, 4
FileReadLine, totalChromPassword, %A_Desktop%\logInfo.txt, 5

msgbox, hi, username: %userName% password: %userPassword%



FormatTime, Year,,yy
FormatTime, Today,, dd
FormatTime, Month,, MM
Formattime, Date,, MMddyy
JulianMonth := ["A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M"]
LetterMonth := JulianMonth[month]
SingleYear = %year%{left}{backspace}{right}
dailyStdDate = alch{space}std{space}%month%%today%%year%{space}MH
BPCSdate = %month%{right}%today%{right}%year%{right}{down}{left 8}
BulkLiquid = %singleYear%%lettermonth%
Lotnumber = %Year%0001

Menu, Tray, Icon, Icons/Boo.ico,
Menu, Tray, tip, Press [ Home ] key for shortcuts











#Include Functions.ahk
#Include reviewRun.ahk
#Include Attatchments.ahk
#Include Reps.ahk
#Include selectAndCreateBatch.ahk
#Include other_apps.ahk
#Include options.ahk

MoveMouse:
If ( A_TimeIdle > 99999 ) {
      MouseMove, 1 , 1,, R
      MouseMove, -1,-1,, R
}
return

Home::
	Msgbox, , Things to do, ____________ View Process Sample Tab of LIMS ___________________________________ `n`n -Press [ NumPad( / ) ]  to search for an Item Number `n
	-Press [ NumPad( * )  ]  to  search for Bulk Liquid `n -Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n____________ Create Batch Tab of LIMS ___________________________________________ `n(doesnt always work depending on the computers cashe)`n -Press [ NumPad( * ) ]  to create Bulk Liquid batch `n -Press [ NumPad( - ) ] to create a Raw Material  `n`n____________ My Service Group Pending Test tab of LIMS ________________________`n`n -Press [ End ] to make the `"Run#`" column fit `n -Press [ NumPad( - ) ]  to search for a Raw Material `n -Press [ Middle Click ] or [ Numpad( + ) & Numpad( Enter ) ] to auto-select result`n -Press and Roll [ Mouse Wheel Down ] to attatch a file `n`n____________ Miscellaneous _______________________________________________________ `n`n -The [ Numpad( Enter ) ] is usable in more places `n -Press [ Numpad( + ) & Numpad( 0 ) ] at the same time to open the calculator`n -Press [ Insert ] to set the digits in the middle of the lot# (currently: `"%lotnumber%___`") `n`n`n :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::`nIt helps if you dont have the `"Menu Bar`" and `"Favorites Bar`" showing in Internet Explorer because it lowers the screen by 30 pixels.`n`n`tThis works on the non-Internet Explorer version of LIMS now`n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::`nver. %version%
return          
