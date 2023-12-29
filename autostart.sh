#!/bin/bash

source /opt/ros/$ROS_DISTRO/setup.bash

cd /catkin_ws && catkin_make -j4

source /catkin_ws/devel/setup.bash

# roslaunch turtlebot3_gazebo turtlebot3_house.launch
# roslaunch turtlebot3_gazebo turtlebot3_house.launch

exec "$@"