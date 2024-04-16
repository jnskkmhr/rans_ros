FROM osrf/ros:noetic-desktop

# Standard package
RUN apt-get update && apt-get install -y git vim wget byobu

# ROS build dependencies
RUN sh \
    -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" \
        > /etc/apt/sources.list.d/ros-latest.list'
RUN wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
RUN apt-get update && apt-get install -y python3-catkin-tools python3-rosdep

# Python dependencies
RUN apt-get install -y python3-tk

# Other thirdparty packages
WORKDIR /home/thirdparty
RUN git clone https://github.com/AntoineRichard/rl_games.git

WORKDIR /home