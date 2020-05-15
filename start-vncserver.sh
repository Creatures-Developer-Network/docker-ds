#!/bin/bash

export USER=root
vncserver :1 -geometry 1280x800 -depth 15 && tail -F /root/.vnc/*.log