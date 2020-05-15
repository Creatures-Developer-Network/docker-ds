FROM i386/debian:bullseye

RUN apt-get update
RUN apt-get -y install rpm2cpio bzip2 libxi6 libc6 binutils

RUN mkdir -p /home/ds/app
COPY ./app/ /home/ds/app/

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

RUN apt-get remove -y rpm2cpio