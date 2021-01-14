FROM ros:noetic-upmoon-base

# setup GPIO
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-pip \
        python3-wheel && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install Jetson.GPIO

# create catkin workspace
RUN mkdir -p ~/catkin_ws/src && \
    cd ~/catkin_ws/ && \
    /bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash; \
    catkin_make"

# download upmoon packages and ignore desktop packages
RUN cd ~/catkin_ws/src && \
    git clone https://github.com/MarsRobotics/upmoon.git && \
    touch upmoon/upmoon_gazebo/CATKIN_IGNORE && \
    touch upmoon/upmoon_viz/CATKIN_IGNORE

# compile catkin workspace
RUN cd ~/catkin_ws/ && \
    /bin/bash -c "source /opt/ros/${ROS_DISTRO}/setup.bash; \
    catkin_make"

# setup environment
COPY ./ros_entrypoint.sh /
