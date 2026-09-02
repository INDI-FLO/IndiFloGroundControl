import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QGroundControl
import QGroundControl.Controls
import QGroundControl.Palette
import QGroundControl.MultiVehicleManager
import QGroundControl.ScreenTools

Rectangle {
    id: root

    width: parent.width

    // =========================================================
    // COMPACT TOOLBAR
    // =========================================================

    height: ScreenTools.toolbarHeight * 0.78

    color: "transparent"

    property var _activeVehicle:
        QGroundControl.multiVehicleManager.activeVehicle

    QGCPalette {
        id: qgcPal
    }

    // =========================================================
    // VEHICLE STATUS
    // =========================================================

    property bool vehicleConnected:
        _activeVehicle !== null

    property bool vehicleFlying:
        _activeVehicle ? _activeVehicle.flying : false

    property bool vehicleArmed:
        _activeVehicle ? _activeVehicle.armed : false

    property string flightStatusText:
        !vehicleConnected
            ? "DISCONNECTED"
            : vehicleFlying
                ? "FLYING"
                : vehicleArmed
                    ? "ARMED"
                    : "READY TO FLY"

    property string flightSubStatus:
        !vehicleConnected
            ? "NO VEHICLE"
            : vehicleFlying
                ? "IN FLIGHT"
                : vehicleArmed
                    ? "ARMED"
                    : "GPS"

    // =========================================================
    // REAL GPS DATA
    // =========================================================

    property int satelliteCount:
        _activeVehicle && _activeVehicle.gps
            ? _activeVehicle.gps.count.value
            : 0

    property real gpsHdop:
        _activeVehicle && _activeVehicle.gps
            ? _activeVehicle.gps.hdop.value
            : NaN

    property bool gpsAvailable:
        _activeVehicle &&
        _activeVehicle.gps &&
        satelliteCount > 0

    // =========================================================
    // REAL BATTERY DATA
    // =========================================================

    property var activeBattery:
        _activeVehicle &&
        _activeVehicle.batteries &&
        _activeVehicle.batteries.count > 0
            ? _activeVehicle.batteries.get(0)
            : null

    property real batteryPercent:
        activeBattery &&
        !isNaN(activeBattery.percentRemaining.rawValue)
            ? activeBattery.percentRemaining.rawValue
            : NaN

    property bool batteryAvailable:
        activeBattery &&
        !isNaN(activeBattery.percentRemaining.rawValue)

    // =========================================================
    // STATUS COLOR
    // =========================================================

    property color statusColor:
        !vehicleConnected
            ? "#58616B"
            : vehicleFlying
                ? "#D88920"
                : vehicleArmed
                    ? "#C8871F"
                    : "#32934A"

    // =========================================================
    // MAIN GLASS BACKGROUND
    // =========================================================

    Rectangle {
        anchors.fill: parent

        radius: 8

        color: "#AA071B2D"

        border.width: 1
        border.color: "#55D8F3FF"

        gradient: Gradient {

            GradientStop {
                position: 0.0
                color: "#B51D344A"
            }

            GradientStop {
                position: 0.45
                color: "#99314F68"
            }

            GradientStop {
                position: 1.0
                color: "#B5091B2D"
            }
        }
    }

    // =========================================================
    // GLASS TOP HIGHLIGHT
    // =========================================================

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: 1

        color: "#CCFFFFFF"
        opacity: 0.35

        radius: 1
    }

    // =========================================================
    // MAIN ROW
    // =========================================================

    RowLayout {

        anchors.fill: parent

        anchors.leftMargin: 4
        anchors.rightMargin: 4
        anchors.topMargin: 3
        anchors.bottomMargin: 3

        spacing: 3

        // =====================================================
        // IGC LOGO
        // =====================================================

        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: 64

            radius: 6

            color: "#331B4560"

            border.width: 1
            border.color: "#35FFFFFF"

            QGCToolBarButton {

                anchors.centerIn: parent

                width: 48
                height: parent.height

                icon.source: "/res/indifloLogo.svg"

                logo: true

                onClicked: {
                    mainWindow.showToolSelectDialog()
                }
            }
        }

        // =====================================================
        // MODE
        // =====================================================

        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: 82

            radius: 6

            color: "#331B4560"

            border.width: 1
            border.color: "#25FFFFFF"

            Column {

                anchors.centerIn: parent

                spacing: 0

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: "MODE"

                    color: "#A9D9F2"

                    font.pixelSize: 9
                    font.bold: true
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text:
                        _activeVehicle
                            ? (_activeVehicle.flightMode || "—")
                            : "—"

                    color: "white"

                    font.pixelSize: 13
                    font.bold: true
                }
            }
        }

        // =====================================================
        // GPS POSITION
        // =====================================================

        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: 105

            radius: 6

            color: "#331B4560"

            border.width: 1
            border.color: "#25FFFFFF"

            Row {

                anchors.centerIn: parent

                spacing: 6

                Rectangle {

                    width: 13
                    height: 13

                    radius: 7

                    color:
                        gpsAvailable
                            ? "#42D96B"
                            : "#777777"

                    border.width: 1
                    border.color: "#CCFFFFFF"
                }

                Column {

                    spacing: 0

                    Text {
                        text: "GPS"

                        color: "#A9D9F2"

                        font.pixelSize: 9
                        font.bold: true
                    }

                    Text {
                        text:
                            gpsAvailable
                                ? "POSITION"
                                : "NO GPS"

                        color: "white"

                        font.pixelSize: 11
                        font.bold: true
                    }
                }
            }
        }

        // =====================================================
        // GPS SATELLITES + HDOP
        // =====================================================

        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: 92

            radius: 6

            color: "#331B4560"

            border.width: 1
            border.color: "#25FFFFFF"

            Column {

                anchors.centerIn: parent

                spacing: 0

                // GPS label

                Text {

                    anchors.horizontalCenter: parent.horizontalCenter

                    text: "GPS"

                    color: "#A9D9F2"

                    font.pixelSize: 8
                    font.bold: true
                }

                // GPS signal bars

                Row {

                    anchors.horizontalCenter: parent.horizontalCenter

                    spacing: 2

                    height: 18

                    Repeater {

                        model: 5

                        Rectangle {

                            width: 4

                            height:
                                gpsAvailable
                                    ? 5 + (index * 3)
                                    : 4

                            anchors.bottom: parent.bottom

                            radius: 2

                            color:
                                gpsAvailable
                                    ? "#45DFF5"
                                    : "#606870"
                        }
                    }
                }

                // Satellite count

                Text {

                    anchors.horizontalCenter: parent.horizontalCenter

                    text:
                        gpsAvailable
                            ? satelliteCount + " SAT"
                            : "-- SAT"

                    color: "#E8F8FF"

                    font.pixelSize: 7

                    font.bold: true
                }

                // HDOP

                Text {

                    anchors.horizontalCenter: parent.horizontalCenter

                    text:
                        gpsAvailable && !isNaN(gpsHdop)
                            ? "HDOP " + gpsHdop.toFixed(1)
                            : "HDOP --"

                    color: "#A9D9F2"

                    font.pixelSize: 7
                }
            }
        }

        // =====================================================
        // CENTRAL FLIGHT STATUS
        // =====================================================

        Rectangle {

            Layout.fillHeight: true

            Layout.fillWidth: true

            Layout.minimumWidth: 260

            radius: 8

            color: statusColor

            opacity: 0.92

            border.width: 1
            border.color: "#70FFFFFF"

            // Glass highlight

            Rectangle {

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top

                height: parent.height * 0.45

                radius: 8

                color: "#FFFFFF"

                opacity: 0.07
            }

            Column {

                anchors.centerIn: parent

                spacing: 0

                Text {

                    anchors.horizontalCenter: parent.horizontalCenter

                    text: flightStatusText

                    color: "white"

                    font.pixelSize: 16

                    font.bold: true
                }

                Text {

                    anchors.horizontalCenter: parent.horizontalCenter

                    text: flightSubStatus

                    color: "#E8F8FF"

                    font.pixelSize: 9

                    font.bold: true
                }
            }
        }

        // =====================================================
        // RC
        // =====================================================

        Rectangle {

            Layout.fillHeight: true

            Layout.preferredWidth: 78

            radius: 6

            color: "#331B4560"

            border.width: 1
            border.color: "#25FFFFFF"

            Column {

                anchors.centerIn: parent

                spacing: 0

                Text {

                    anchors.horizontalCenter: parent.horizontalCenter

                    text: "RC"

                    color: "#A9D9F2"

                    font.pixelSize: 8

                    font.bold: true
                }

                Row {

                    anchors.horizontalCenter: parent.horizontalCenter

                    spacing: 2

                    Repeater {

                        model: 5

                        Rectangle {

                            width: 3

                            height: 5 + (index * 4)

                            anchors.bottom: parent.bottom

                            radius: 2

                            color: "#53DDF4"
                        }
                    }
                }
            }
        }

        // =====================================================
        // HD
        // =====================================================

        Rectangle {

            Layout.fillHeight: true

            Layout.preferredWidth: 78

            radius: 6

            color: "#331B4560"

            border.width: 1
            border.color: "#25FFFFFF"

            Column {

                anchors.centerIn: parent

                spacing: 0

                Text {

                    anchors.horizontalCenter: parent.horizontalCenter

                    text: "HD"

                    color: "#A9D9F2"

                    font.pixelSize: 9

                    font.bold: true
                }

                Row {

                    anchors.horizontalCenter: parent.horizontalCenter

                    spacing: 2

                    Repeater {

                        model: 5

                        Rectangle {

                            width: 3

                            height: 5 + (index * 4)

                            anchors.bottom: parent.bottom

                            radius: 2

                            color: "#53DDF4"
                        }
                    }
                }
            }
        }

        // =====================================================
        // BATTERY
        // =====================================================

        Rectangle {

            Layout.fillHeight: true

            Layout.preferredWidth: 92

            radius: 6

            color: "#331B4560"

            border.width: 1
            border.color: "#25FFFFFF"

            Row {

                anchors.centerIn: parent

                spacing: 5

                Text {

                    text: "▣"

                    color:
                        !batteryAvailable
                            ? "#777777"
                            : batteryPercent <= 20
                                ? "#FF5555"
                                : batteryPercent <= 40
                                    ? "#FFD45C"
                                    : "#55E978"

                    font.pixelSize: 20
                }

                Text {

                    text:
                        batteryAvailable
                            ? Math.round(batteryPercent) + "%"
                            : "--%"

                    color: "white"

                    font.pixelSize: 15

                    font.bold: true
                }
            }
        }

        // =====================================================
        // SETTINGS
        // =====================================================

        Rectangle {

            Layout.fillHeight: true

            Layout.preferredWidth: 48

            radius: 6

            color: "#331B4560"

            border.width: 1
            border.color: "#25FFFFFF"

            Text {

                anchors.centerIn: parent

                text: "⚙"

                color: "#EAF8FF"

                font.pixelSize: 21
            }

            MouseArea {

                anchors.fill: parent

                hoverEnabled: true

                onClicked: {
                    mainWindow.showToolSelectDialog()
                }

                Rectangle {

                    anchors.fill: parent

                    radius: 6

                    color: "#FFFFFF"

                    opacity:
                        parent.containsMouse
                            ? 0.10
                            : 0
                }
            }
        }
    }

    // =========================================================
    // PARAMETER DOWNLOAD PROGRESS
    // =========================================================

    Rectangle {

        anchors.bottom: parent.bottom

        anchors.left: parent.left

        height: 2

        width:
            _activeVehicle
                ? _activeVehicle.loadProgress * parent.width
                : 0

        color: "#63E7F5"

        opacity: 0.85
    }
}
