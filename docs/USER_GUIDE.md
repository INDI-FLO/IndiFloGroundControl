
# IndiFloGroundControl User Guide

## 1. Introduction

IndiFloGroundControl (IGC) is the ground control station developed and customized by IndiFlo for UAV development, mission planning, vehicle configuration, flight monitoring, simulation and payload-control workflows.

IndiFloGroundControl is based on the QGroundControl open-source project and contains IndiFlo-specific branding, interface customization and development features.

---

## 2. Main Application Areas

IndiFloGroundControl provides several primary operating areas.

### Fly View

Fly View is the primary interface used during vehicle operation.

It provides access to:

- Live vehicle position
- Map information
- Vehicle telemetry
- Flight instruments
- Compass
- Artificial horizon
- Vehicle status
- Flight controls
- Gimbal controls
- Mission monitoring

### Plan View

Plan View is used to create and manage UAV missions.

Typical workflow:

1. Open Plan View.
2. Select the required operating area.
3. Add mission items.
4. Configure mission parameters.
5. Review the mission route.
6. Upload the mission to the vehicle.
7. Monitor the mission from Fly View.

### Vehicle Setup

Vehicle Setup provides access to vehicle configuration and calibration functions.

Always verify vehicle configuration before operating a physical UAV.

---

## 3. Flight Display

IndiFloGroundControl contains customized flight-display components.

The IndiFlo interface includes customized:

- Flight toolbar
- Telemetry presentation
- Compass
- Artificial horizon
- Gimbal controls
- Flight instrumentation
- Glass-style interface elements

These components are implemented primarily using Qt Quick and QML.

---

## 4. Artificial Horizon

The customized artificial horizon provides a visual representation of vehicle attitude.

The instrument is intended to provide:

- Pitch reference
- Roll reference
- Directional reference
- Aircraft attitude visualization

The component is integrated into the Fly View.

---

## 5. Compass

IndiFloGroundControl includes a customized compass presentation.

The compass provides heading information and is integrated into the flight-display interface.

The customized component is located in:

```text
src/QmlControls/IndiFloCompass.qml
