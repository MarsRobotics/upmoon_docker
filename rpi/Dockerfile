FROM ros:noetic-robot

# Add ROS packages controller_manager joint_state_controller robot_state_publisher
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
	python3-pip \
        python3-rpi.gpio \
        ros-noetic-controller-manager \
        ros-noetic-joint-state-controller \
        ros-noetic-robot-state-publisher && \
    rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install pysabertooth PyTrinamic

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
RUN echo 'source "/opt/ros/$ROS_DISTRO/setup.bash"' >> /root/.bashrc
RUN echo 'source "/root/catkin_ws/devel/setup.bash"' >> /root/.bashrc

COPY ./ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
