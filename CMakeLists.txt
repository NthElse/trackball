cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

project(Trackball)

# Download & Configure Qaterial as part of your build system
include(FetchContent)
FetchContent_Declare(
  Qaterial
  GIT_REPOSITORY https://github.com/OlivierLDff/Qaterial.git
  GIT_TAG        master
  GIT_SHALLOW    1
)
FetchContent_MakeAvailable(Qaterial)

# add_executable(Trackball HelloWorld.cpp HelloWorld.qrc)

target_link_libraries(Trackball PRIVATE Qaterial)

set_target_properties(Trackball PROPERTIES AUTOMOC TRUE)
