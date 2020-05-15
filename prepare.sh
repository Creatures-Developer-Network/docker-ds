#!/bin/bash

docker create -ti --name dummy dockerds bash
docker cp dummy:"/root/.dockingstation" "./data/"
docker rm -f dummy