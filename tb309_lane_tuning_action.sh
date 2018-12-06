#! /bin/bash

source /opt/ros/kinetic/setup.bash

source ~/catkin_ws/devel/setup.bash

#control_lane
roslaunch turtlebot3_autorace_control turtlebot3_autorace_control_lane.launch &

sleep 5

#bringup
ssh tb309@10.42.0.109 'source /opt/ros/kinetic/setup.bash && export ROS_MASTER_URI=http://10.42.0.1:11311 && export ROS_HOSTNAME=10.42.0.109 && export TURTLEBOT3_MODEL=burger && source ~/catkin_ws/devel/setup.bash && ~/catkin_ws/src/tb3_shell_scripts/./bringup.sh' 

#kill in TB3
ssh tb309@10.42.0.109 'killall -9 bash'
ssh tb309@10.42.0.109 'killall -9 bringup.sh'
ssh tb309@10.42.0.109 'killall -9 python'
ssh tb309@10.42.0.109 'killall -9 hlds_laser_publisher'
ssh tb309@10.42.0.109 'killall -9 turtlebot3_diagnostics'

echo "lane tuning action Completed!!!"
