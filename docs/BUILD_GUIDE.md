


# 3. BUILD_GUIDE.md

# IndiFloGroundControl Build Guide

## Overview

This guide describes the general build process for IndiFloGroundControl.

---

## Development Environment

The current Linux development environment uses:

| Component | Configuration |
|---|---|
| Project | IndiFloGroundControl |
| Branch | v1 |
| Qt | 6.8.3 |
| Build system | CMake |
| Compiler | GCC/G++ |
| UI | Qt Quick / QML |
| Communication | MAVLink |
| Autopilot | PX4 |
| Simulator | Gazebo |
| Environment | Ubuntu / WSL2 |

---

## Repository

Build Validation

After building, verify:


The executable was generated.
The application starts.
IndiFlo branding is displayed.
Fly View loads.
Plan View loads.
Vehicle Setup loads.
QML components load.
No critical runtime QML errors occur.



Common Build Problems
CMake Cannot Find Qt
QML Component Is Missing
Check:

File exists.

Correct import.

Correct filename.

Resource registration.


