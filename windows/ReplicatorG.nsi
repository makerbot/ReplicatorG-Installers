
;--------------------------------

!include nsDialogs.nsh
!include LogicLib.nsh

; The name of the installer
Name "ReplicatorG Installer"

; The file to write
OutFile "ReplicatorG-Install.exe"

; The default installation directory
InstallDir $DOCUMENTS\ReplicatorG

; Request application privileges for Windows Vista
RequestExecutionLevel highest

ShowInstDetails show

Var pythonDialog
Var pythonCheckText
Var pythonCheckAskText
Var pythonCheckFoundText
Var pythonCheckDownloadButton
Var congratuWellDone
Var congratuWellDoneText

;--------------------------------

; Pages

Page directory
Page custom pythonCheckPage
Page instfiles
Page custom congratulationsPage

;--------------------------------

Function pythonCheckPage
	
	nsDialogs::Create 1018
	Pop $pythonDialog
	
	${If} pythonDialog == error
		Abort
	${EndIf}
	
	${NSD_CreateLabel} 0 0 100% 12u "Checking for Python..."
	Pop $pythonCheckText
	
#CheckPythonPath:
	ExpandEnvStrings $0 "%PYTHONPATH%"
	StrCmp $0 "%PYTHONPATH%" CheckPythonSearch HasPython
CheckPythonSearch:
	SearchPath $0 "python.exe"
	StrCmp $0 "" ChekPythonDefault HasPython
ChekPythonDefault:
	IfFileExists "C:\Python*\*.*" HasPython
#NoPython:
	${NSD_CreateLabel} 0 13u 100% 52u \
	"It looks like you don't have Python. \
	Python is needed for Skeinforge (our slicing engine) to run.$\n\
	If you already have Python, or don't wish to download it now, \
	you can set the path to it in ReplicatorG's preferences. $\n\
	You can download Python now using the button below.$\n\
	Click 'Install' to install ReplicatorG without getting Python."
	Pop $pythonCheckAskText
	
	${NSD_CreateButton} 20% 65u 60% 12u "Open python download page in browser."
	Pop $pythonCheckDownloadButton
	${NSD_OnClick} $pythonCheckDownloadButton getPython
	
	Goto End
  
HasPython:
	${NSD_CreateLabel} 0 13u 100% 12u "Python found!"
	Pop $pythonCheckFoundText
	
End:
	Nop
	

	nsDialogs::Show
	
FunctionEnd

Function getPython
	ExecShell "open" "http://www.python.org/download/"
FunctionEnd

Function congratulationsPage

	nsDialogs::Create 1018
	Pop $congratuWellDone
	
	${If} congratuWellDone == error
		Abort
	${EndIf}
	
	${NSD_CreateLabel} 0 0 100% 50u \
	"Congratuwelldone!$\nYou've installed ReplicatorG!$\n$\n\
	Don't forget to visit Thingiverse.com"
	Pop $congratuWellDoneText
		
FunctionEnd

;--------------------------------

; The stuff to install
Section "" ;No components page, name is not important

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File /r "..\dist-all\windows\replicatorg-*"
  
  ; Set output path to the installation directory.
  SetOutPath "$INSTDIR\replicatorg-0031_Beta"
  # create a shortcut in the start menu programs directory
  # point the new shortcut at the program
  createShortCut "$SMPROGRAMS\ReplicatorG.lnk" "$INSTDIR\replicatorg-0031_Beta\ReplicatorG.exe"
  
  ; Set output path to the driver directory.
  SetOutPath "$INSTDIR\drivers\"
  File /r "drivers\"
  
  ExecWait 'install-drivers.bat'

  
SectionEnd ; end the section
