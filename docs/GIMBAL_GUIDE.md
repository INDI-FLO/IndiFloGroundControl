
# IndiFlo Gimbal Control Guide

## Overview

IndiFloGroundControl contains a customized on-screen gimbal controller for UAV payload control.

Primary implementation:

## Features

The customized interface supports:

Pan control
Tilt control
On-screen joystick
Directional buttons
Diagonal joystick movement
Independent joystick and button operation
Joystick

The joystick is designed for continuous gimbal control.

Supported movement includes:

        UP
         |
LEFT ----+---- RIGHT
         |
       DOWN

Diagonal movement is also supported.


# Directional Buttons

Directional buttons provide an additional control mechanism.

Button operation is intended to remain independent from direct joystick movement.

# PX4 Integration

Gimbal behavior depends on:

PX4 configuration.
Vehicle configuration.
MAVLink communication.
Gimbal implementation.
Command mapping.
Command scaling.

# Test Procedure
Connect to the simulated vehicle.
Verify telemetry.
Open gimbal controls.
Test up.
Test down.
Test left.
Test right.
Test diagonal movement.
Test each directional button.
Verify pan.
Verify tilt.
Troubleshooting
Joystick Has Low Response

Check:

Joystick scaling.
Axis mapping.
Command scaling.
Active vehicle.
PX4 gimbal configuration.
Buttons Work but Joystick Does Not

# Check:

QML joystick event handling.
Pan/tilt calculation.
Active vehicle reference.
Gimbal controller interface.
Gimbal Does Not Move

# Verify:

Vehicle connection.
PX4 configuration.
MAVLink communication.
Gimbal initialization.
Command generation.
Command reception.
