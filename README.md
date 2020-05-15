# docker-ds

A proof of concept implementation for dockerizing the linux version of Docking Station

# building

Add `dockingstation_195_64.tar.bz2`, `glib-1.2.10-55.fc30.i686.rpm`, `gtk+-1.2.10-90.fc30.i686.rpm` and `SDL-1.2.9-1.i386.rpm` to `./app`

Add `offlinelogin.c16` and `zzz_gamestart_login.cos` from the offline login hack

# usage (mac os x)

run `./launch-osx-xquartz.sh` after ensuring you have changed the settings to allow incomming network connections and restarted!

# usage (vnc)

run `launch-tightvnc-server-15-bit.sh` and login to VNC server: vnc://localhost:5901
