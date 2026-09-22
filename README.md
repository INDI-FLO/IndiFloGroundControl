<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTpSIjNpQCYgcHIoOwWXVXOZlZuqPFpwEQzbrWBGEGVw&s" alt="IndiFloGroundControl Logo" width="200">
</p>

<h1 align="center">IndiFloGroundControl</h1>

<p align="center">
  <strong>IndiFlo's Ground Control Station for UAV Operations, Mission Planning, Flight Control and Simulation</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Release-v5.1.4-blue" alt="IndiFloGroundControl v5.1.4">
  <img src="https://img.shields.io/badge/PX4-Compatible-orange" alt="PX4">
  <img src="https://img.shields.io/badge/MAVLink-Compatible-green" alt="MAVLink">
  <img src="https://img.shields.io/badge/Qt-6.8.3-41CD52" alt="Qt 6.8.3">
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20Linux-lightgrey" alt="Platforms">
</p>

---

## About IndiFloGroundControl

**IndiFloGroundControl (IGC)** is a customized ground control station developed by **IndiFlo Private Limited** for UAV development, flight operations, mission planning, vehicle configuration and simulation.

IndiFloGroundControl is based on the **QGroundControl** project and extends its ground-control capabilities with IndiFlo-specific branding, user-interface customization, flight-display components and UAV control functionality.

IndiFlo Private Limited is a drone manufacturing and aerial technology company incorporated on July 12, 2024. Headquartered in Patna, Bihar, the company focuses on indigenous UAV platforms, embedded electronics and AI-driven autonomous drone operations.

---

## 🌟 Why IndiFloGroundControl?

IndiFloGroundControl is designed to provide a unified ground-control environment for UAV development and operations.

- 🚀 Modern mission planning
- ✈️ PX4-based UAV operations
- 🛩️ MAVLink vehicle communication
- 🧭 Enhanced flight instrumentation
- 🎛️ Custom gimbal control
- 🎮 Physical controller integration
- 🧪 PX4 SITL and Gazebo simulation
- 🖥️ Customized IndiFlo flight interface
- ⚙️ Vehicle configuration and setup
- 🧩 Extensible Qt/QML architecture

---

## 🚁 Key Features

### 🕹️ Flight Control

- MAVLink-based vehicle communication
- PX4 vehicle support
- Flight-mode monitoring and control
- Arm/disarm operations
- Vehicle status and telemetry monitoring
- Real-time vehicle position and flight information

### 🗺️ Mission Planning

- Interactive map-based mission planning
- Waypoint creation and editing
- Mission item configuration
- Flight-path visualization
- Mission upload and download
- Mission monitoring during flight

### 🧭 Enhanced Flight Display

IndiFloGroundControl includes customized flight-display components developed for IndiFlo UAV operations.

Current interface customization includes:

- Glass-style flight interface
- Transparent telemetry panels
- Customized flight toolbar
- Customized compass
- Artificial horizon
- Enhanced flight instrumentation
- IndiFlo-specific controls and visual elements

### 🎛️ Custom Gimbal Control

IndiFloGroundControl includes a customized on-screen gimbal interface.

Features include:

- Pan control
- Tilt control
- Joystick-based control
- Directional controls
- Independent joystick and button operation
- PX4 gimbal integration
- Gimbal status and feedback

### 🎮 Physical Controller Support

The development environment supports physical-controller testing for UAV simulation.

Controller workflows can be used with:

- PX4 SITL
- Gazebo
- MAVLink
- Linux joystick interfaces
- Compatible USB controllers

### 🧪 PX4 + Gazebo Simulation

IndiFloGroundControl can be used as part of a PX4 SITL and Gazebo development workflow.

Typical architecture:

    Physical Controller
           │
           ▼
      Ubuntu / WSL2
           │
           ▼
        PX4 SITL
           │
           ▼
         Gazebo
           │
           │ MAVLink
           ▼
    IndiFloGroundControl

This allows UAV flight-control and ground-control workflows to be tested before deployment to physical aircraft.

---

# 🎨 IndiFlo User Interface

IndiFloGroundControl includes IndiFlo-specific UI development built using **Qt Quick and QML**.

Major UI customization areas include:

- IndiFlo application branding
- Custom IndiFlo logo and resources
- Customized Fly View
- Glassmorphism-style interface
- Transparent telemetry panels
- Custom compass
- Artificial horizon
- Custom gimbal control
- Customized flight toolbar
- Flight instrumentation improvements

The goal is to provide a consistent and professional ground-control interface for IndiFlo UAV systems.

---

# 🧭 Flight Instruments

### Artificial Horizon

IndiFloGroundControl includes a custom artificial-horizon component integrated into the flight display.

The instrument provides visual attitude information including:

- Pitch
- Roll
- Directional reference
- Aircraft attitude visualization

### Compass

The flight interface includes a customized IndiFlo compass presentation for heading and navigation awareness.

---

# 🎛️ Gimbal Control

The IndiFlo gimbal interface is designed for UAV payload control and provides:

- Pan control
- Tilt control
- On-screen joystick operation
- Directional button control
- Independent joystick/button interaction
- PX4-compatible gimbal workflows

Detailed documentation:

**[Gimbal Control Guide](docs/GIMBAL_GUIDE.md)**

---

# 🧪 Simulation

IndiFloGroundControl can be integrated with PX4 SITL and Gazebo for development and testing.

Typical workflow:

    PX4 Autopilot
          │
          ▼
       PX4 SITL
          │
          ▼
        Gazebo
          │
          │ MAVLink
          ▼
    IndiFloGroundControl

Simulation documentation:

- [PX4 Integration Guide](docs/PX4_GUIDE.md)
- [Gazebo Simulation Guide](docs/GAZEBO_GUIDE.md)
- [Controller Guide](docs/CONTROLLER_GUIDE.md)

---

# 🛠️ Development

IndiFloGroundControl is developed using:

| Component | Version / Technology |
|---|---|
| Application | IndiFloGroundControl |
| Framework | Qt |
| Qt Version | 6.8.3 |
| UI | Qt Quick / QML |
| Language | C++ / QML |
| Build System | CMake |
| Communication | MAVLink |
| Autopilot | PX4 |
| Simulation | Gazebo |
| Development OS | Linux / Ubuntu / WSL2 |
| Desktop Platform | Windows / Linux |

---

# 🏗️ Building IndiFloGroundControl

IndiFlo maintains its own build documentation so developers can build the project using the versions and configuration required by the IndiFlo development environment.

## Linux

See:

**[Linux Build Guide](docs/LINUX_BUILD.md)**

## Windows

See:

**[Windows Build Guide](docs/WINDOWS_BUILD.md)**

## General Development

See:

**[Developer Guide](docs/DEVELOPER_GUIDE.md)**

---

# 📚 Documentation

All IndiFlo-specific documentation is maintained inside this repository.

### 👤 User Documentation

- 📖 [User Guide](docs/USER_GUIDE.md)
- 🎛️ [Gimbal Control Guide](docs/GIMBAL_GUIDE.md)
- 🎮 [Controller Guide](docs/CONTROLLER_GUIDE.md)
- 🛩️ [PX4 Integration Guide](docs/PX4_GUIDE.md)
- 🧪 [Gazebo Simulation Guide](docs/GAZEBO_GUIDE.md)

### 👨‍💻 Developer Documentation

- 🛠️ [Developer Guide](docs/DEVELOPER_GUIDE.md)
- 🏗️ [Build Guide](docs/BUILD_GUIDE.md)
- 🐧 [Linux Build Guide](docs/LINUX_BUILD.md)
- 🪟 [Windows Build Guide](docs/WINDOWS_BUILD.md)
- 🎨 [UI Customization Guide](docs/UI_CUSTOMIZATION.md)
- 🔧 [Troubleshooting Guide](docs/TROUBLESHOOTING.md)
- 📦 [Release Guide](docs/RELEASE_GUIDE.md)

---

# 🏗️ Project Structure

Important development areas include:

    src/
    │
    ├── FlightDisplay/
    │   ├── GimbalControl.qml
    │   ├── ArtificialHorizon.qml
    │   └── ...
    │
    ├── QmlControls/
    │   ├── IndiFloCompass.qml
    │   ├── TelemetryValuesBar.qml
    │   ├── HorizontalFactValueGrid.qml
    │   └── ...
    │
    ├── Vehicle/
    ├── MAVLink/
    ├── VideoManager/
    └── ...

The project structure may evolve as IndiFloGroundControl development continues.

---

# 🎮 Controller Development

Physical controllers can be used during PX4 and Gazebo simulation development.

The current development workflow supports Linux joystick interfaces and has been tested with compatible USB game controllers.

See:

**[Controller Guide](docs/CONTROLLER_GUIDE.md)**

---

# 🔧 Troubleshooting

If you encounter problems with IndiFloGroundControl:

1. Check the terminal output.
2. Verify the Qt version.
3. Verify the CMake configuration.
4. Perform a clean build.
5. Check QML errors.
6. Verify MAVLink connectivity.
7. Check PX4 SITL when using simulation.
8. Check Gazebo when using simulation.
9. Verify controller devices when using physical-controller input.

See:

**[Troubleshooting Guide](docs/TROUBLESHOOTING.md)**

---

# 🤝 Contributing

IndiFloGroundControl is an open-source project and welcomes contributions to the project.

Contributors can help with:

- Bug fixes
- Flight-display improvements
- QML development
- C++ development
- MAVLink integration
- PX4 integration
- Simulation
- Documentation
- Testing
- UI/UX improvements

Before submitting a change:

1. Create a feature branch.
2. Make the required changes.
3. Build the application.
4. Test the affected functionality.
5. Check for QML and runtime errors.
6. Update documentation where necessary.
7. Submit the change for review.

See:

**[Developer Guide](docs/DEVELOPER_GUIDE.md)**

---

# 📦 Release Information

## Current Release

**IndiFloGroundControl v5.1.4**

Release information, changes and validation details are maintained in the project's release documentation.

See:

**[Release Guide](docs/RELEASE_GUIDE.md)**

---

# 🌐 IndiFlo

IndiFlo Private Limited is focused on UAV platforms, aerial technology, embedded electronics and autonomous drone systems.

**Official Website:** IndiFlo

---

# 📜 Upstream Project and Licensing

IndiFloGroundControl (IGC) is an open-source ground control station project developed and maintained by **IndiFlo Private Limited**.

IndiFloGroundControl is based on the open-source **QGroundControl** project and includes IndiFlo-specific modifications, additions, integrations, configuration, user-interface work, and documentation.

### GNU General Public License v3

IndiFloGroundControl is distributed under the **GNU General Public License version 3 (GPLv3)** to the extent applicable to IndiFlo-specific original work and GPLv3-covered portions of the project.

The complete GNU GPLv3 license text is provided in:

- [COPYING](COPYING)

The official GNU GPLv3 license information is available from the Free Software Foundation:

- https://www.gnu.org/licenses/gpl-3.0.html

### QGroundControl

IndiFloGroundControl is based on **QGroundControl**.

QGroundControl provides the underlying open-source ground control architecture used by IndiFloGroundControl.

Applicable QGroundControl copyright notices, license notices, attribution requirements, and contributor notices remain applicable to the portions of the software derived from or incorporating QGroundControl source code.

QGroundControl project:

- https://github.com/mavlink/qgroundcontrol

QGroundControl documentation:

- https://docs.qgroundcontrol.com/

### IndiFlo-Specific Work

IndiFloGroundControl contains IndiFlo-specific modifications and additions, including:

- IndiFloGroundControl branding
- Application identity and visual branding
- User-interface modifications
- Custom flight-display components
- Artificial horizon and flight instrumentation
- Custom compass and telemetry presentation
- Custom gimbal controls and integration
- PX4 integration and configuration workflows
- Gazebo simulation workflows
- Controller and joystick workflows
- IndiFlo-specific application configuration
- Build and deployment workflows
- IndiFlo-specific documentation and examples

IndiFlo-specific original modifications and additions are intended to be distributed under GPLv3 unless a specific file or component states otherwise.

### Third-Party Software

IndiFloGroundControl uses and/or interfaces with third-party software, libraries, frameworks, protocols, and tools.

Third-party components remain subject to their respective licenses and copyright notices.

Nothing in this project license section is intended to remove, replace, or modify an applicable third-party license.

Users and distributors should preserve all applicable copyright notices, license notices, attribution requirements, and other legal notices.

For additional information, see:

- [NOTICE.md](NOTICE.md)
- [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)
- [COPYING](COPYING)

### Copyright

Copyright © 2026 **IndiFlo Private Limited**.

QGroundControl and other third-party copyrights remain with their respective copyright holders.

IndiFloGroundControl does not claim ownership of upstream or third-party code that is not original IndiFlo work.

# ⚠️ Safety Notice

IndiFloGroundControl is intended for UAV development, testing, simulation and operation.

Always perform appropriate pre-flight checks and verify vehicle configuration before operating a physical aircraft.

New software, vehicle configurations and control functionality should be validated in an appropriate development or simulation environment before deployment to physical UAV hardware.

---

# ✈️ IndiFloGroundControl

<p align="center">
  <strong>Mission Planning • Flight Control • UAV Configuration • Simulation</strong>
</p>

<p align="center">
  Built for IndiFlo UAV and aerial technology development.
</p>
