FROM osrf/ros:noetic-desktop-full

RUN mkdir -p /catkin_ws
# WORKDIR /catkin_ws

# Based on: https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/
RUN apt update && apt-get install -y ros-noetic-joy ros-noetic-teleop-twist-joy \
  ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc \
  ros-noetic-rgbd-launch ros-noetic-rosserial-arduino \
  ros-noetic-rosserial-python ros-noetic-rosserial-client \
  ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server \
  ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro \
  ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz \
  ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers

RUN apt update && apt-get install -y ros-noetic-dynamixel-sdk ros-noetic-turtlebot3-msgs ros-noetic-turtlebot3

COPY ./autostart.sh /
RUN chmod +x /autostart.sh
ENTRYPOINT /autostart.sh
# ENTRYPOINT ["bash"]
