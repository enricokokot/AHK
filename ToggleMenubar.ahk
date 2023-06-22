#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ToggleMenu()
{
  ;static associative array for keeping track of all windows that have had their menus hidden
  static MenuArray := {}
 
  ;find active window handle in array / add to array if not found
  hWin := WinExist("A")
  hMenu := null
  hMenu := MenuArray.Remove(hWin)
  if (hMenu = null)
  {
    ;store a reference to the window's menu in the array
    hMenu := (DllCall("GetMenu", "uint", hWin))
    MenuArray[hWin] := hMenu
    
    ;hide the menu by uncoupling it from the parent window
    DllCall("SetMenu", "uint", hWin, "uint", 0)
  }
  else
  {
    ;show menu by recoupling it to the parent window
    DllCall("SetMenu", "uint", hWin, "uint", hMenu)
  }
}

^!M::
    ToggleMenu()
;    WinSet, Style, ^0xC00000, A
;    WinGetPos, X, Y, , , A
;    WinGet, WindowID, ID, A
;    WinSet, Style, ^0xC40000, ahk_id %WindowID%
;    WinMove, ahk_id %WindowID%, , 1 + X, 0 + Y,
return