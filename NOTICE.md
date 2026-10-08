# IndiFloGroundControl Notices

## 1. Project

**IndiFloGroundControl (IGC)** is a ground control station software project developed and maintained by **IndiFlo Private Limited**.

IndiFloGroundControl is based on the open-source **QGroundControl** project and incorporates upstream source code, interfaces, and third-party components.

This notice identifies IndiFlo-specific work and provides attribution information. It does not replace, modify, or remove any applicable license, copyright, or attribution notice belonging to QGroundControl or any third-party component.

---

## 2. IndiFloGroundControl

**Project:** IndiFloGroundControl  
**Short name:** IGC  
**Organization:** IndiFlo Private Limited  
**Copyright:** © 2026 IndiFlo Private Limited

IndiFlo-original source-code contributions and modifications identified as IndiFlo work are distributed under the:

**GNU General Public License, version 3 or any later version (GPLv3-or-later).**

The complete GNU General Public License version 3 is provided in:

`COPYING`

The official GNU GPLv3 text is available from the Free Software Foundation:

https://www.gnu.org/licenses/gpl-3.0.html

This statement does not relicense QGroundControl source code, third-party components, documentation, artwork, or other material that is subject to separate applicable terms.

---

## 3. IndiFlo-Specific Modifications and Additions

IndiFloGroundControl includes IndiFlo-specific modifications and additions made to support IndiFlo's ground-control, UAV operations, user-interface, simulation, development, and deployment requirements.

Examples include:

- IndiFloGroundControl application branding and naming
- IndiFlo application identity and visual branding
- IndiFlo-specific user-interface modifications
- Custom toolbar and flight-display elements
- Custom telemetry presentation
- Custom compass and flight instrumentation
- Artificial horizon and attitude-display components
- Custom gimbal-control interface and integration
- Gimbal-control configuration and user-interface work
- PX4 integration and configuration workflows
- Gazebo simulation workflows and integration
- Controller and joystick workflows
- UAV mission-planning and operational workflows
- IndiFlo-specific configuration and application settings
- Build and deployment documentation
- IndiFlo developer and user documentation
- Windows and Linux build workflows
- IndiFlo-specific documentation, examples, and project guidance

Where a file contains both upstream QGroundControl material and IndiFlo modifications, the original upstream copyright and license notices remain applicable to the upstream material.

An IndiFlo modification does not remove or replace an applicable upstream notice.

---

## 4. Specifically Identified IndiFlo-Original Components

The following components were introduced as IndiFlo-specific source files in the IndiFloGroundControl repository and are identified as IndiFlo-original work:

- `src/FlightDisplay/IndiFloAttitudePanel.qml`
- `src/FlightDisplay/IndiFloMessageBox.qml`
- `src/FlightDisplay/IndiFloYawIndicator.qml`
- `src/QmlControls/IndiFloCompass.qml`
- `src/QmlControls/IndiFloGlassPanel.qml`

These files were introduced through IndiFlo development commits and are part of the project's IndiFlo-specific user-interface and flight-instrumentation work.

Applicable dependencies imported or used by these components remain subject to their own licenses.

---

## 5. Upstream QGroundControl Attribution

IndiFloGroundControl is based on **QGroundControl**.

QGroundControl is an open-source ground-control-station project maintained by the QGroundControl project and its contributors.

The upstream QGroundControl project documents its source code as being available under:

- Apache License 2.0
- GNU General Public License version 3

Applicable QGroundControl copyright notices, license terms, attribution requirements, and contributor notices remain applicable to portions of IndiFloGroundControl derived from or incorporating QGroundControl source code.

Upstream project:

https://github.com/mavlink/qgroundcontrol

QGroundControl documentation:

https://docs.qgroundcontrol.com/

---

## 6. Third-Party Components

IndiFloGroundControl uses or may incorporate third-party libraries, frameworks, tools, resources, and services.

Third-party components remain subject to their respective licenses and copyright notices.

Nothing in this notice is intended to relicense a third-party component where its original license does not permit such relicensing.

Third-party license information should be reviewed in the corresponding source directories, dependency metadata, license files, submodules, and upstream project documentation.

---

## 7. Qt

IndiFloGroundControl uses the Qt framework.

Qt is a separate third-party project and remains subject to the applicable Qt licensing terms and notices associated with the Qt version and modules used to build IndiFloGroundControl.

Qt project:

https://www.qt.io/

---

## 8. PX4

IndiFloGroundControl may be used with PX4-based vehicles and simulation environments.

PX4 is an independent open-source project and is not owned by IndiFlo Private Limited.

PX4 project:

https://github.com/PX4/PX4-Autopilot

PX4 documentation:

https://docs.px4.io/

PX4 source code and its applicable license notices remain subject to the PX4 project's licensing terms.

---

## 9. Gazebo

IndiFloGroundControl documentation and development workflows may include integration with Gazebo simulation environments.

Gazebo is an independent open-source project.

Gazebo project:

https://gazebosim.org/

Applicable Gazebo and related simulation-component licenses remain in force.

---

## 10. MAVLink

IndiFloGroundControl communicates with compatible vehicles using MAVLink-based interfaces and protocols.

MAVLink is an independent open-source project and is not owned by IndiFlo Private Limited.

MAVLink project:

https://mavlink.io/

Applicable MAVLink licensing and attribution requirements remain in force.

---

## 11. ArduPilot Parameter Repository

IndiFloGroundControl includes the following Git submodule:

`src/FirmwarePlugin/APM/ArduPilot-Parameter-Repository`

Upstream repository:

https://github.com/ArduPilot/ArduPilot-Parameter-Repository

The checked-out submodule in this repository does not currently contain a `LICENSE`, `COPYING`, or `NOTICE` file in the inspected directory hierarchy.

Accordingly, this project does not assign or assume a license for the submodule through this notice.

The submodule remains separate third-party material, and its applicable licensing status should be verified from the upstream project before redistribution where required.

---

## 12. Copyright and License Preservation

Users and contributors must preserve applicable copyright notices, license notices, attribution notices, and other legal notices contained in source files and third-party components.

An IndiFlo copyright notice does not replace an existing upstream copyright notice.

Where an existing source file contains an upstream QGroundControl copyright header, that header should be retained when making modifications to the file.

IndiFlo-specific changes may be identified through an additional copyright or modification notice where appropriate.

---

## 13. No Warranty

IndiFloGroundControl is provided under the applicable open-source license terms and without warranty to the maximum extent permitted by applicable law.

The software may interact with aircraft, unmanned vehicles, flight controllers, sensors, telemetry systems, simulation environments, and other hardware.

Users are responsible for complying with applicable laws, regulations, operating requirements, safety procedures, and manufacturer instructions.

IndiFloGroundControl should be tested and validated in an appropriate controlled environment before operational deployment.

---

## 14. Relationship Between Notices and Licenses

This file is an attribution and notice document.

It does not itself grant additional rights beyond those granted by the applicable software licenses.

The complete GNU GPLv3 license text is provided in:

`COPYING`

Applicable upstream and third-party licenses remain applicable to their respective material.

---

## 15. Project Copyright

Copyright © 2026 IndiFlo Private Limited.

IndiFloGroundControl and IndiFlo-specific original modifications and additions are maintained by IndiFlo Private Limited and its authorized contributors.
