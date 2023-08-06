; ; Retrieve the screen size
; ScreenWidth := A_ScreenWidth
; ScreenHeight := A_ScreenHeight

; ; Display the screen size
; MsgBox, Screen Width: %ScreenWidth%`nScreen Height: %ScreenHeight%

SetWorkingDir, %A_ScriptDir%

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
            CoordMode Pixel, Screen
        
            colorSampleX := windowX + windowWidth - 70
            colorSampleY := windowY +  150

            PixelGetColor, ColorSample, colorSampleX, colorSampleY
            isDarkMode := ColorSample == 0x0F0F0F

            Sleep, 1000
            X := windowX + windowWidth - 70
            Y := windowY + 110
            Click, %X%, %Y%
        
            Sleep, 1000
            Y := Y + 470
            Click, %X%, %Y%
        
            Sleep, 1000
            if (isDarkMode) {
                Y := Y - 245
            } 
            else 
            {
                Y := Y - 290
            }
            Click, %X%, %Y%
            break
        }
    }

    ScreenWidth := A_ScreenWidth
    ScreenHeight := A_ScreenHeight
    Click, ScreenWidth, ScreenHeight
    Sleep, 100
    PixelGetColor, ColorSample2, 100, 100
    Sleep, 400
    Click, ScreenWidth, ScreenHeight

    FileReadLine, darkWallpaperColor, .env, 3
    isWallpaperDarkMode := ColorSample2 == darkWallpaperColor

    if (isWallpaperDarkMode) {
        FileReadLine, changeThemeScriptLocation, .env, 1
    }
    else
    {
        FileReadLine, changeThemeScriptLocation, .env, 2
    }
    Run, python.exe %changeThemeScriptLocation%

return

; Function to check if a string ends with another string
StrEnd(str, substr)
{
    return SubStr(str, StrLen(str) - StrLen(substr) + 1) = substr
}
