
# Gazebo Simulation Guide

## Overview

Gazebo provides a simulated environment for testing PX4 and IndiFloGroundControl without requiring a physical UAV.

---

## Simulation Architecture

```text
Xbox / Physical Controller
          |
          v
      Windows USB
          |
          v
        WSL2
          |
          v
       xboxdrv
          |
          v
      PX4 SITL
          |
          v
        Gazebo
          |
       MAVLink
          |
          v
IndiFloGroundControl



## Verify Simulation


Gazebo starts.
Simulated vehicle appears.
PX4 reaches its expected startup state.
IndiFloGroundControl detects the vehicle.
Telemetry updates.
Vehicle position updates.
Control inputs work.
Gimbal responds where configured.
Gimbal Simulation

## The simulated gimbal can be used to test:

Pan.
Tilt.
Joystick movement.
Directional buttons.
Diagonal movement.
Control response.
Common Gazebo Problems
PX4 Waits for Gazebo

## Check:

PX4 target.
Gazebo installation.
World/model availability.
Terminal messages.
World or Model Not Found

Verify that the requested simulation assets are available and that the selected PX4/Gazebo target references valid assets.

Simulation Logs

## When reporting a simulation problem, collect:

PX4 terminal output.
Gazebo terminal output.
IndiFloGroundControl terminal output.
Operating-system information.
Exact command used.
Approximate time the problem occurred.
