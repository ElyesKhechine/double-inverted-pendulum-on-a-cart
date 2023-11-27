# ROS Robot LQR control

* Original author: Elyes Khechine <elyeskhechine@gmail.com>
* License: GNU General Public License, version 3 (GPL-3.0)

## Quick Start

Compilation:

```sh
catkin_make -DCMAKE_BUILD_TYPE=Release
```

Rviz:

```sh
roslaunch dip_ros_robot_description dip_ros_robot_rviz.launch
```

Gazebo:

```sh
roslaunch dip_ros_robot_gazebo dip_ros_robot_world.launch
```

RQT Graph:

```sh
roslaunch dip_ros_robot_control dip_ros_robot_rqt.launch
```

LQR Controller

```sh
roslaunch dip_ros_robot_control dip_ros_robot_control.launch
```

