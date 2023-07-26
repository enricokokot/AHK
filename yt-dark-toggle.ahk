; ; Retrieve the screen size
; ScreenWidth := A_ScreenWidth
; ScreenHeight := A_ScreenHeight

; ; Display the screen size
; MsgBox, Screen Width: %ScreenWidth%`nScreen Height: %ScreenHeight%


^!L::
    endingString := "YouTube - Google Chrome"
    WinGet, windowList, List

    Loop, %windowList%
    {
        windowID := windowList%A_Index%
        WinGetTitle, windowTitle, ahk_id %windowID%
        if (StrEnd(windowTitle, endingString))
        {
            WinGetPos, windowX, windowY, windowWidth, windowHeight, ahk_id %windowID%
            CoordMode, Mouse, Screen
        
            Sleep, 1000
            X := windowX + windowWidth - 70
            Y := windowY + 110
            Click, %X%, %Y%
        
            Sleep, 1000
            Y := Y + 470
            Click, %X%, %Y%
        
            Sleep, 1000
            Y := Y - 245
            Click, %X%, %Y%
            break
        }
    }

    FileReadLine, lightenScriptLocation, .env, 1
    Run, python.exe %lightenScriptLocation%

return

^!D::
    endingString := "YouTube - Google Chrome"
    WinGet, windowList, List

    Loop, %windowList%
    {
        windowID := windowList%A_Index%
        WinGetTitle, windowTitle, ahk_id %windowID%
        if (StrEnd(windowTitle, endingString))
        {
            WinGetPos, windowX, windowY, windowWidth, windowHeight, ahk_id %windowID%
            CoordMode, Mouse, Screen
        
            Sleep, 1000
            X := windowX + windowWidth - 70
            Y := windowY + 110
            Click, %X%, %Y%
        
            Sleep, 1000
            Y := Y + 470
            Click, %X%, %Y%
        
            Sleep, 1000
            Y := Y - 290
            Click, %X%, %Y%
            break
        }
    }

    FileReadLine, darkenScriptLocation, .env, 2
    Run, python.exe %darkenScriptLocation%

return

; Function to check if a string ends with another string
StrEnd(str, substr)
{
    return SubStr(str, StrLen(str) - StrLen(substr) + 1) = substr
}
