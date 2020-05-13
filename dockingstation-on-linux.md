You need to have multilib enabled on your system since DS uses 32 bit binaries.

We're extracting the necessary libraries from binary packages since compiling ancient 32bit libraries on a 64bit system proved extremely frustrating.

Get the following rpms from Fedora and the official SDL site.

[gtk+-1.2.10-90.fc30.i686.rpm](https://fedora.pkgs.org/30/fedora-i386/gtk+-1.2.10-90.fc30.i686.rpm.html) from [here](https://download-ib01.fedoraproject.org/pub/fedora-secondary/releases/30/Everything/i386/os/Packages/g/gtk+-1.2.10-90.fc30.i686.rpm). (Fedora)

[glib-1.2.10-55.fc30.i686.rpm](https://fedora.pkgs.org/30/fedora-i386/glib-1.2.10-55.fc30.i686.rpm.html) from [here](https://download-ib01.fedoraproject.org/pub/fedora-secondary/releases/30/Everything/i386/os/Packages/g/glib-1.2.10-55.fc30.i686.rpm). (Fedora)

[SDL-1.2.9-1.i386.rpm](https://www.libsdl.org/release/SDL-1.2.9-1.i386.rpm) (Official SDL site)

Use rpm2archive to convert them to tarballs.

Pick where you're going to install docking station and extract the tarballs in that folder. This will give you a usr/lib folder holding these 32 bit libraries.

If you have Creatures 3 installed, set $C3_MAIN to point to it. Be aware that if it's on a case-sensitive filesystem you'll need to lowercase all the filenames in Images, Sounds and Backgrounds. (Maybe more!)

Extract dockingstation_195_64.tar.bz2 to a temporary directory.
cd to the dockingstation_195_64 directory

Run the following

```
LD_LIBRARY_PATH=/path/to/32bit/usr/lib INSTALL_DEST=/path/to/DS/destination/directory BIN_DEST=/path/to/DS/startscript/bin ./dstation-install
```

You may need to run it multiple times if not done as root (or maybe even if you are!) if you get trap errors.

Once the installation is complete, delete the libSDL-1.2.so* files in the docking station folder. This version of the library breaks the game sounds. The version we downloaded earlier will be used instead to fix this. (Information found [here](https://www.reddit.com/r/CreaturesNorns/comments/4gtevf/anyone_still_playing_docking_station_linux/d2kmm93/))

Then create a shell script to run the game as follows.

```#!/bin/sh
C3_MAIN=/path/to/creatures3  LD_LIBRARY_PATH=/path/to/32bit/usr/lib   INSTALL_DEST=/path/to/DS/installation/directory /path/to/startscript/bin/dockingstation nocheck
```

Running this script should start Docking Station with the ability to create docked worlds. If you get errors about files missing in ~/.dockingstation, this is due to the case sensitivity mentioned above. Lowercase the files in the Creatures 3 folders Images, Sounds and Backgrounds.

If you don't have Creatures 3, just leave out the "C3_MAIN=/path/to/creatures3" bit.

Everything can be installed under the same directory, though I put my start script in ~/bin for convenience.
