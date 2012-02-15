mkdir %TEMP%\drivers
if %PROCESSOR_ARCHITECTURE% == x86 goto :x86
copy /y dpinst64.exe %TEMP%\drivers\dpinst.exe
goto :enddpinst
:x86
copy /y dpinst86.exe %TEMP%\drivers\dpinst.exe
:enddpinst
cd "FTDI USB Drivers\"
copy /y * %TEMP%\drivers
cd "../Arduino Mega 2560 usbser Driver"
copy /y * %TEMP%\drivers
cd "../Makerbot"
copy /y * %TEMP%\drivers
cd %TEMP%\drivers

dpinst.exe /lm


ping -n 30 127.0.0.1 > nul