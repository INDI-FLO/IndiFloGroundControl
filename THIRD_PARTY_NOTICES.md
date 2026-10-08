# Third-Party Notices

IndiFloGroundControl (IGC) incorporates, derives from, interfaces with, or is distributed alongside software and technologies developed by third parties.

This document provides a high-level record of important upstream projects and technologies.

The license and copyright terms contained in the original source files, submodules, dependency metadata, and corresponding project distributions remain authoritative.

---

## QGroundControl

**Project:** QGroundControl

**Repository:**  
https://github.com/mavlink/qgroundcontrol

**Documentation:**  
https://docs.qgroundcontrol.com/

IndiFloGroundControl is based on QGroundControl.

The upstream QGroundControl project documents its source code as being available under:

- Apache License 2.0
- GNU General Public License version 3

Applicable QGroundControl copyright, license, attribution, and contributor notices remain applicable to the relevant source material.

---

## Qt

**Project:** Qt

**Website:**  
https://www.qt.io/

IndiFloGroundControl uses the Qt framework.

Qt and its individual modules remain subject to their applicable licensing terms.

The applicable Qt license depends on the Qt version, modules, distribution, and use case.

---

## PX4 Autopilot

**Project:** PX4 Autopilot

**Repository:**  
https://github.com/PX4/PX4-Autopilot

**Documentation:**  
https://docs.px4.io/

IndiFloGroundControl supports workflows involving PX4-powered vehicles and simulation environments.

PX4 remains an independent project and is subject to its own applicable licenses and notices.

---

## MAVLink

**Project:** MAVLink

**Website:**  
https://mavlink.io/

IndiFloGroundControl uses MAVLink-compatible communication and vehicle-control interfaces.

MAVLink remains an independent project and is subject to its applicable licensing and attribution requirements.

---

## Gazebo

**Project:** Gazebo

**Website:**  
https://gazebosim.org/

IndiFloGroundControl development and simulation workflows may use Gazebo.

Gazebo and associated components remain subject to their respective licenses and notices.

---

## ArduPilot Parameter Repository

**Project:** ArduPilot Parameter Repository

**Repository:**  
https://github.com/ArduPilot/ArduPilot-Parameter-Repository

IndiFloGroundControl references the ArduPilot Parameter Repository as a Git submodule at:

`src/FirmwarePlugin/APM/ArduPilot-Parameter-Repository`

The checked-out submodule does not currently contain a `LICENSE`, `COPYING`, or `NOTICE` file in the inspected directory hierarchy.

No specific license is therefore asserted for this submodule by this document.

The submodule remains third-party material, and its applicable licensing status should be verified from the upstream project before redistribution where required.

---

## Additional Dependencies

IndiFloGroundControl may include additional open-source libraries and third-party dependencies.

Users and distributors should review:

- source-file license headers;
- dependency manifests;
- Git submodules;
- `LICENSE` files;
- `COPYING` files;
- package metadata;
- build-system dependency declarations; and
- upstream project documentation

for the applicable terms of individual components.

No third-party license is superseded by this document.

---

## License Preservation

Copyright notices, license notices, attribution statements, and other legal notices contained in third-party source code must be preserved in accordance with the applicable license.

This document is informational and does not modify the license of any third-party component.

Copyright © 2026 IndiFlo Private Limited.
