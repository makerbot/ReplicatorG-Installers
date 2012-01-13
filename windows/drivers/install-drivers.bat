mkdir %TEMP%\drivers
copy /y dpinst.exe %TEMP%\drivers
cd "FTDI USB Drivers\"
copy /y * %TEMP%\drivers
cd "../Arduino Mega 2560 usbser Driver"
copy /y * %TEMP%\drivers
cd %TEMP%\drivers
dpinst.exe /lm
ping -n 10 127.0.0.1 > nul