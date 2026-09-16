

# 6. PX4_GUIDE.md

# PX4 Integration Guide

## Overview

IndiFloGroundControl is used with PX4-based UAV development and simulation workflows.

PX4 can be used for:

- Flight-controller development
- SITL testing
- MAVLink communication
- Vehicle telemetry
- Gimbal testing
- Gazebo simulation

---

## PX4 Repository

The PX4 development source is maintained separately.

MAVLink

IndiFloGroundControl communicates with PX4 using MAVLink.

## When troubleshooting communication verify:

PX4 is running.
MAVLink is running.
The expected UDP endpoint is being used.
The network interface is reachable.
IndiFloGroundControl is running.
The vehicle is detected.
SITL Testing

## Recommended sequence:

Start PX4 SITL.
Start Gazebo.
Wait for the simulated vehicle.
Start IndiFloGroundControl.
Confirm vehicle connection.
Confirm telemetry.
Confirm vehicle state.
Test required controls.
Test gimbal functionality where applicable.
Gimbal Configuration

## Gimbal behavior depends on PX4 version, vehicle configuration and gimbal implementation.

When debugging a gimbal:

Verify the vehicle is connected.
Verify gimbal configuration.
Verify gimbal initialization.
Verify MAVLink communication.
Verify the commanded axis.
Verify command scaling.
Test joystick movement.
Test buttons independently.
Physical Vehicle Testing

Simulation should be used during development whenever practical.

## Before physical testing:

Verify configuration.
Validate functionality in simulation.
Confirm communication.
Perform appropriate pre-flight checks.
Use a controlled test environment.
