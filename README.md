Creates an installer for ReplicatorG!

To create all installers: ant installer
To create a specific installer: ant installer-(windows|linux|mac)
(currently I've only got windows)

Also archives dists: ant archive OR ant archive-(windows|linux|mac)
Should do the platform-appropriate archive for each dist

Just drag your RepG distribution into the folder and run!
(Python is needed for the windows installer to be compiled)

Tools used:
IzPack - http://izpack.org/downloads/
IzPack native launcher - also at http://izpack.org/downloads/
izpack2exe - one of the izpack utilities in the izpack repo
			git://git.codehaus.org/izpack.git OR
			git://github.com/jponge/izpack.git
			
Files:
IzPack/...				IzPack and its utilities, etc.
launcher/launcher.exe	IzPack native launcher
launcher/launcher.ini	launcher configuration file
build.xml				Ant build script
install.xml				IzPack build script
README.md				This file
run.bat					Runs the native launcher after extraction from the .exe
shortcutSpec.xml		May be needed to create shorcuts, etc.
version.txt				For now, this is how the build script knows what version we're building