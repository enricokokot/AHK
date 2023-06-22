; Press Ctrl+Alt+T to modify the style of the active window
^!T::
    WinSet, Style, ^0xC00000, A
    ; WinSet, Style, ^0x00C40000, A
    ; WinSet, Style, ^0xC40000, A
    ; WinHide, A
    ; WinShow, A
    ; WinGet, windows, list

    ; WinGetActiveTitle, activeTitle
    ; MsgBox, Title %activeTitle%

    ; If InStr(windows, "Error") > 0
    ; {
	    ; MsgBox, There are no open windows.
    ; }
    ; Else
    ; {
    	; Loop, %windows%
    	; {
	        ; MsgBox, Window %A_Index% handle: %windows[A_Index]%
            ; hwnd := windows%A_Index%
            ; WinSet, Style, ^0xC00000, ahk_id %hwnd%
    	; }
    ; }
return
