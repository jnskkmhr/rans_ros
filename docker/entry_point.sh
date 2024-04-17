#!/bin/bash

# install ros dependencies
cd /home/ros1_ws
rosdep update && rosdep install --from-paths src -yi
pip3 install cvxpy hydra-core omegaconf mujoco
cd ../thirdparty/rl_games && pip3 install -e .

# build package
cd /home/ros1_ws
mkdir build logs devel
catkin build

# install extra packages
apt-get update && apt-get install -y ros-noetic-realsense2-camera