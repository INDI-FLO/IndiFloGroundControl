
---

# 5. WINDOWS_BUILD.md



## Overview

IndiFloGroundControl can be built and tested on Windows using Qt and the Microsoft Visual C++ toolchain.

---

## Development Workspace

An example Windows development workspace is:


## Windows Validation

Verify:

Application launches.
IndiFlo branding appears.
Logo appears correctly.
Fly View loads.
Plan View loads.
Vehicle Setup loads.
Telemetry displays.
Compass displays.
Artificial horizon displays.
Gimbal control loads.
No critical QML errors occur.
Packaging


## Before providing a Windows build to another tester:

Build Release configuration.
Start the executable.
Test major views.
Test simulation/vehicle connection where available.
Verify runtime dependencies.
Verify branding/resources.
Record the build/version.
Package the validated build.


## Windows Testing Checklist
Application startup
        |
        v
Branding verification
        |
        v
Fly View
        |
        v
Plan View
        |
        v
Vehicle connection
        |
        v
Telemetry
        |
        v
Gimbal
        |
        v
Final validation
