resolutionX = 1920
resolutionY = 1080

NbrSlotDrop = 12


;; G11 was missing
BedName := ["G01","G02", "G03" , "G04" , "G05" , "G06" , "G07" , "G08" ,  "G09" , "G10" , "G12" , "G13" , "G14" , "G15" , "G16" , "G17" , "G18" , "G19" , "G20" , "G21" , "G22" , "G23" , "G24" , "G25" , "G26" , "G27" , "G28"]

BasicBed = 1

f1::
    for k, v in BedName
        BedTransfer(v)
return


f2::
Reload
return

BedTransfer(filterString)
{
    global resolutionX
    global resolutionY


    MouseClick, left, resolutionX*0.2, resolutionY*0.9
    Sleep, 1000
    Send, %filterString%
    Sleep, 1000
    MouseClick, left, resolutionX*0.42, resolutionY*0.5
    Sleep, 1000
    MouseClick, left, resolutionX*0.42, resolutionY*0.9
    Sleep, 1000

    AfterPop()

}

AfterPop()
{
    global resolutionX
    global resolutionY
    global NbrSlotDrop

    Sleep, 10000
    Send, c  
    Sleep, 1000  
    DllCall("mouse_event", uint, 1, int, 0, int, 100)
    Sleep, 1000
    Send, f
    Sleep, 1000  

    MouseClick, left, resolutionX*0.68, resolutionY*0.25
    Sleep, 1000

    Loop, NbrSlotDrop{
        Send, o
        Sleep, 1000
    }
    Sleep, 1000
    Send {Escape} 
    Sleep, 1000
    DllCall("mouse_event", uint, 1, int, 0, int, 100)
    Sleep, 1000
    Send, e
    Sleep, 1000


}
