cmake_minimum_required(VERSION 2.8.3)
project(dip_ros_robot_control)

add_compile_options(-std=c++11)

# Eigen3
find_package(Eigen3 QUIET)
if(NOT Eigen3_FOUND)
  find_package(eigen3 REQUIRED)
  set(Eigen3_INCLUDE_DIRS ${EIGEN3_INCLUDE_DIR})
  set(Eigen3_LIBRARIES Eigen3::Eigen)
else()
  set(Eigen3_INCLUDE_DIRS ${Eigen3_INCLUDE_DIRS})
  set(Eigen3_LIBRARIES ${Eigen3_LIBRARIES})
endif()

find_package(catkin REQUIRED COMPONENTS 
  controller_manager 
  controller_interface
  hardware_interface
  roscpp
)

include_directories(include ${catkin_INCLUDE_DIRS} ${Eigen3_INCLUDE_DIRS})

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS
    controller_manager 
    controller_interface
    hardware_interface
    roscpp
    pluginlib
  DEPENDS Eigen3
  LIBRARIES ${PROJECT_NAME}
)

add_library(lqr_controller src/lqr_controller.cpp)
target_link_libraries(lqr_controller ${catkin_LIBRARIES} ${Eigen3_LIBRARIES})

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION})

install(TARGETS lqr_controller
  ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})

install(DIRECTORY config launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

install(FILES controller_plugin.xml
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

