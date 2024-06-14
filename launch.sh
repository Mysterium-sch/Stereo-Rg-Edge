#!/bin/bash
source /opt/ros/humble/setup.bash
source /ws/install/setup.bash
cd data
ros2 launch ros2_bringup stereorig_2.launch.py serial:="'21387972'" sonar:='true'  namespace:='jetson_2' camera_type:="blackfly_s" cam_topic:="debayer/image_raw/rgb"
/bin/bash
