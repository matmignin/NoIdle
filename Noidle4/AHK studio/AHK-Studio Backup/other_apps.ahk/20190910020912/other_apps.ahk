#IfWinActive, Audit Trail ahk_exe SeqEdit.exe
Numlock & numpaddiv::
sendinput, daily Std
ControlClick, Button3, Audit Trail ahk_exe SeqEdit.exe, OK,
sleep 200
sendinput mat{tab}kilgore7744{enter}
sleep 200
sendinput, %DailyStdDate%{enter}
return

#ifwinactive, Electronic Signature ahk_class #32770 ahk_exe SeqEdit.exe
Numlock & numpaddiv::sendinput mat{tab}kilgore7744{enter}

