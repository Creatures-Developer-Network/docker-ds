#!/bin/bash

./prepare.sh

docker run -v $PWD/data:/root/.dockingstation -p 5901:5901 dockerds

./save.sh