#!/bin/bash
xhost +
PACKAGE_NAME="$(basename "${PWD}")"
docker run --name rans-ros-container -it --gpus all -e "ACCEPT_EULA=Y" --rm --network=host \
-v $HOME/.Xauthority:/root/.Xauthority \
-e DISPLAY \
-e "PRIVACY_CONSENT=Y" \
-v $PWD:/home/ros1_ws/src/$PACKAGE_NAME \
rans-ros:latest