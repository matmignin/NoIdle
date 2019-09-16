;::::::::::::::::::::::::::::::::::::variables and opening stuff::::::::::::::::::::::::::::::::::::::::
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
;Menu, Tray, Icon, H:\QC LAB\MH\Stuff\Icons\Boo.ico,
Menu, Tray, tip, Press [ Home ] key for more info
SingleYear = %year%{left}{backspace}{right}
dailyStdDate = alch{space}std{space}%month%%today%%year%{space}MH
BPCSdate = %month%{right}%today%{right}%year%{right}{down}{left 8}
BulkLiquid = %singleYear%%lettermonth%
;FileReadLine, BPCSPassword, H:\QC LAB\MH\Stuff\Variables.txt, 1
;FileReadLine, PasswordEnd, H:\QC LAB\MH\Stuff\Variables.txt, 2
Password = {shiftdown}K{shiftup}ilgore%PasswordEnd%
select1 = 60, 135
select2 = 45, 73
Search1 = 70, 60
Search2 = 70, 60
PVAttachment1 = 650, 400
PVAttachment2 = 650, 334
SGAttachment1 = 350, 383
SGAttachment2 = 350, 316
pickScanner = sc
pickComponent = com
ChangeRep1 = 673, 383
ChangeRep2 = 673, 316
Add = 55, 55
samplegroup = 268, 83
samplegroup1 = 268, 83
samplegroup2 = 268, 83
grouptemplate = 760, 83
grouptemplate1 = 760, 83
grouptemplate2 = 760, 83
OpenFolderX = 40
;Release runs
ReviewAttachment1 = 130, 277
ReviewAttachment2 = 136, 316
ReviewAttachment3 = 131, 210
AttachmentWindow1 = ahk_class WindowsForms10.Window.8.app.0.202c666 ahk_exe IEXPLORE.EXE
AttachmentWindow2 = ahk_class WindowsForms10.Window.8.app.0.33c0d9d ahk_exe xv.exe
Adobe = AcroRd32.exe
Excel = EXCEL.EXE
Window = WINWORD.EXE
ReleaseRun1 = 773, 206
ReleaseRun2 = 771, 142
MoveWindow1 = 5, 332, 950, 684
MoveWindow2 =
;adjust columb
AdjustA1 = L, 97, 192, 115, 192, 2
AdjustB1 = L, 96, 403, 2
AdjustA2 = L, 97, 120, 115, 122, 2
AdjustB2 = L, 96, 342, 2
;auto select
Cbox1 = WindowsForms10.COMBOBOX.app.0.202c6661
Aclass1 = ahk_class WindowsForms10.Window.8.app.0.202c666
Cbox2 = WindowsForms10.COMBOBOX.app.0.33c0d9d1
Aclass2 = ahk_class WindowsForms10.Window.8.app.0.33c0d9d
attatchmentNumb = 0
Lotnumber = %Year%0001
