xhost + 127.0.0.1

docker run \
-e DISPLAY=host.docker.internal:0 \
-e REALLY_RUN_AS_ROOT=1 \
-e TERM=xterm-256color \
-e LD_LIBRARY_PATH=/home/ds/app/usr/lib \
-e INSTALL_DEST=/home/ds/app \
-e BIN_DEST=/home/ds/app/bin \
-v /tmp/.X11-unix:/tmp/.X11-unix \
dockerds /home/ds/app/bin/dockingstation nocheck