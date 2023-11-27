# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "controller_manager;controller_interface;hardware_interface;roscpp;pluginlib".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-ldip_ros_robot_control".split(';') if "-ldip_ros_robot_control" != "" else []
PROJECT_NAME = "dip_ros_robot_control"
PROJECT_SPACE_DIR = "/home/robotics/mushr_ws/install"
PROJECT_VERSION = "0.0.0"
