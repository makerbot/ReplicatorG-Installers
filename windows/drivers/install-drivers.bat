mkdir %TEMP%\drivers
copy /y dpinst.exe %TEMP%\drivers
copy /y devcon.exe %TEMP%\drivers
cd "FTDI USB Drivers\"
copy /y * %TEMP%\drivers
cd "../Arduino Mega 2560 usbser Driver"
copy /y * %TEMP%\drivers
cd "../Makerbot"
copy /y * %TEMP%\drivers
cd %TEMP%\drivers
devcon.exe dp_add MightyBoard.inf
devcon.exe dp_add Replicator.inf
devcon.exe rescan
ping -n 10 127.0.0.1 > nul