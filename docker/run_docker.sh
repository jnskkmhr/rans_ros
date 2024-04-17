#!/bin/bash
xhost +
PACKAGE_NAME="$(basename "${PWD}")"
docker run --name rans-ros-container -it --gpus all \
-e "ACCEPT_EULA=Y" --rm --privileged --network=host \
-e DISPLAY \
-e "PRIVACY_CONSENT=Y" \
-v $HOME/.Xauthority:/root/.Xauthority \
-v /dev/:/dev/ \
-v $PWD:/home/ros1_ws/src/$PACKAGE_NAME \
rans-ros:latest