#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; wiki
; here is key list - https://www.autohotkey.com/docs/KeyList.htm

; stop capslock
Capslock::Esc

; stop capslock
Esc::Capslock

;always on top
^SPACE:: Winset, Alwaysontop, , A


; stop cortana from opening
#c::
run, C:\Program Files (x86)\CopyQ\copyq.exe toggle
return

; close a window
; #<+q::WinClose A
; return

; open terminal ---> too slow didn't work cannot focus the terminal
; #Enter:: 
;     run wt
; return

; open copy q
#v::
 run, C:\Program Files (x86)\CopyQ\copyq.exe toggle
return