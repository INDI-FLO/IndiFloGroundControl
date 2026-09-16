
# IndiFloGroundControl Troubleshooting Guide

## Application Does Not Start

Run from a terminal:

```bash
cd ~/Development/IGCv1/build/Release
./IndiFloGroundControl

Review the output for:

QML errors.
Missing libraries.
Graphics errors.
Configuration errors.
Resource errors.
QML Type Unavailable

For:

Type <Component> unavailable

check:

File name.
Import.
File location.
Resource registration.
CMake configuration.
Build output.

Perform a clean build when appropriate.

Clean Build
cd ~/Development/IGCv1

rm -rf build

cmake -B build \
  -DCMAKE_PREFIX_PATH=/home/tasadmin/Qt/6.8.3/gcc_64 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER=/usr/bin/gcc \
  -DCMAKE_CXX_COMPILER=/usr/bin/g++

cmake --build build --parallel
Controller Not Detected

Check:

lsusb

Then:

ls /dev/input/

Start:

sudo xboxdrv --silent

Check:

ls -l /dev/input/js0
PX4 Does Not Connect

Verify:

PX4 is running.
MAVLink is active.
Correct UDP/network configuration.
IndiFloGroundControl is running.
Network connectivity.
Vehicle detection.
Gazebo Does Not Start

Check:

PX4 build target.
Gazebo installation.
World availability.
Model availability.
Plugin errors.
PX4 terminal output.
Gazebo terminal output.
Gimbal Does Not Respond

Check:

Vehicle connection.
PX4 gimbal configuration.
MAVLink communication.
Gimbal initialization.
Joystick input.
Button input.
Axis mapping.
Command scaling.
