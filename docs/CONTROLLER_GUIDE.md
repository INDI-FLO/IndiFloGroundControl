
# 8. CONTROLLER_GUIDE.md


# Physical Controller Integration Guide

## Overview

IndiFloGroundControl development includes physical controller testing with PX4 SITL and Gazebo.

The development setup uses an Xbox 360 controller connected to the Windows host and passed into the WSL2 environment.

---

## Tested Controller

The development controller is identified as:

```text
Xbox 360 Controller for Windows
VID:PID 045e:028e

## Controller Workflow
Xbox 360 Controller
        |
        v
Windows USB
        |
        v
usbipd-win
        |
        v
WSL2
        |
        v
xboxdrv
        |
        v
/dev/input/js0
        |
        v
PX4 / Simulation


Controller Validation

Check:

Controller appears in lsusb.
xboxdrv detects the controller.
/dev/input/js0 exists.
Joystick axes respond.
Buttons respond.
PX4 receives expected input.
Gazebo vehicle responds.
