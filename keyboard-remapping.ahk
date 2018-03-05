; remap caps lock to escape and kill the stupid mapping of cotnrol-z to quit() in the R gui
;
; this requires an install of AHK and this script should be moved to: 
; this should live in ~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\
SetCapsLockState, alwaysoff
Capslock::Escape
#IfWinActive, ahk_exe Rgui.exe
^z::return
