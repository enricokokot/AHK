; ; Retrieve the screen size
; ScreenWidth := A_ScreenWidth
; ScreenHeight := A_ScreenHeight

; ; Display the screen size
; MsgBox, Screen Width: %ScreenWidth%`nScreen Height: %ScreenHeight%


^!L::
    windowTitle := "YouTube - Google Chrome"
    WinGetPos, windowX, windowY, windowWidth, windowHeight, %windowTitle%

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
return

^!D::
    windowTitle := "YouTube - Google Chrome"
    WinGetPos, windowX, windowY, windowWidth, windowHeight, %windowTitle%

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
return