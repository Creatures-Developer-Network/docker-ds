FROM i386/debian:bullseye

RUN apt-get update
RUN apt-get -y install rpm2cpio bzip2 libxi6 libc6 binutils

RUN apt-get install -y x11vnc tightvncserver xvfb
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
COPY xstartup ~/.vnc/xstartup
RUN touch ~/.Xauthority
RUN mkdir -p /home/ds/app
COPY ./app/ /home/ds/app/
COPY ./start-vncserver.sh /home/ds/app/start-vncserver.sh

WORKDIR /home/ds/app

RUN rpm2archive ./glib-1.2.10-55.fc30.i686.rpm
RUN rpm2archive ./gtk+-1.2.10-90.fc30.i686.rpm
RUN rpm2archive ./SDL-1.2.9-1.i386.rpm

RUN tar -xvzf glib-1.2.10-55.fc30.i686.rpm.tgz
RUN tar -xvzf gtk+-1.2.10-90.fc30.i686.rpm.tgz
RUN tar -xvzf SDL-1.2.9-1.i386.rpm.tgz

RUN mkdir tmp && tar -xvjf dockingstation_195_64.tar.bz2 --directory tmp

RUN mkdir bin

RUN export LD_LIBRARY_PATH=/home/ds/app && ./install.sh; exit 0
RUN export LD_LIBRARY_PATH=/home/ds/app && ./install.sh; exit 0

RUN rm libSDL-1.2.so*

ENV DEST "/home/ds/app/Bootstrap/010\ Docking\ Station/zzz_gamestart_login.cos"

COPY ./offlinelogin.c16 /home/ds/app/Images/offlinelogin.c16
COPY ./zzz_gamestart_login.cos ${DEST}

RUN apt-get remove -y rpm2cpio

CMD [ "/home/ds/app/start-vncserver.sh" ]