/****************************************************************************
 *
 * IndiFlo Ground Control
 *
 * Professional Transparent Fly View Toolbar
 *
 ****************************************************************************/

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
    height: ScreenTools.toolbarHeight * 1.05

    color: "transparent"
    border.width: 0

    z: 100


    // =========================================================
    // ACTIVE VEHICLE
    // =========================================================

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
        _activeVehicle
            ? _activeVehicle.flying
            : false


    property bool vehicleArmed:
        _activeVehicle
            ? _activeVehicle.armed
            : false


    // =========================================================
    // FLIGHT STATUS TEXT
    // =========================================================

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
    // STATUS COLORS
    //
    // GREEN  = FLYING
    // ORANGE = ARMED
    // BLUE   = READY
    // GREY   = DISCONNECTED
    // =========================================================

    property color statusColor:

        !vehicleConnected
            ? "#68737D"

            : vehicleFlying
                ? "#35C759"

                : vehicleArmed
                    ? "#F0A52B"

                    : "#3287C7"


    property color statusTextColor:

        !vehicleConnected
            ? "#D0D5D9"

            : vehicleFlying
                ? "#7CFF9A"

                : vehicleArmed
                    ? "#FFD37A"

                    : "#7CC7FF"


    // =========================================================
    // GPS
    // =========================================================

    property int satelliteCount:

        _activeVehicle &&
        _activeVehicle.gps
            ? _activeVehicle.gps.count.value
            : 0


    property real gpsHdop:

        _activeVehicle &&
        _activeVehicle.gps
            ? _activeVehicle.gps.hdop.value
            : NaN


    property bool gpsAvailable:

        _activeVehicle &&
        _activeVehicle.gps &&
        satelliteCount > 0


    // =========================================================
    // BATTERY
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
    // COMMON PANEL COLORS
    // =========================================================

    property color panelColor:
        "#180A1015"

    property color panelBorder:
        "#35FFFFFF"

    property color labelColor:
        "#AFC4D2"

    property color valueColor:
        "#F4F8FA"


    // =========================================================
    // TOP GLASS LINE
    // =========================================================

    Rectangle {
        id: topReflection

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        anchors.leftMargin: 8
        anchors.rightMargin: 8

        height: 1

        color: "#FFFFFF"
        opacity: 0.16

        z: 10
    }


    // =========================================================
    // TOOLBAR CONTENT
    // =========================================================

    RowLayout {
        id: toolbarRow

        anchors.fill: parent

        anchors.leftMargin: 3
        anchors.rightMargin: 3
        anchors.topMargin: 2
        anchors.bottomMargin: 2

        spacing: 3


        // =====================================================
        // HOME BUTTON
        // =====================================================

        Rectangle {
            id: homePanel

            Layout.fillHeight: true
            Layout.preferredWidth: 64

            radius: 6

            color: "#160B1117"

            border.width: 1
            border.color: "#35FFFFFF"


            QGCToolBarButton {
                id: homeButton

                anchors.fill: parent

                icon.source: "/res/home.svg"

                onClicked: {
                    mainWindow.showFlyView()
                }

                ToolTip.visible: hovered
                ToolTip.text: qsTr("Home")
            }


            Rectangle {
                anchors.fill: parent

                radius: 6

                color: "#FFFFFF"

                opacity:
                    homeButton.hovered
                        ? 0.08
                        : 0

                visible:
                    homeButton.hovered

                z: 10
            }
        }


        // =====================================================
        // MODE
        // =====================================================

        Rectangle {
            id: modePanel

            Layout.fillHeight: true
            Layout.preferredWidth: 82

            radius: 6

            color: panelColor

            border.width: 1
            border.color: panelBorder


            Column {
                anchors.centerIn: parent

                spacing: 0


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: "MODE"

                    color: labelColor

                    font.pixelSize: 9
                    font.bold: true
                }


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text:
                        _activeVehicle
                            ? (_activeVehicle.flightMode || "—")
                            : "—"

                    color: valueColor

                    font.pixelSize: 13
                    font.bold: true
                }
            }
        }


        // =====================================================
        // GPS POSITION
        // =====================================================

        Rectangle {
            id: gpsPositionPanel

            Layout.fillHeight: true
            Layout.preferredWidth: 105

            radius: 6

            color: panelColor

            border.width: 1
            border.color: panelBorder


            Row {
                anchors.centerIn: parent

                spacing: 6


                Rectangle {
                    width: 13
                    height: 13

                    radius: 7

                    color:
                        gpsAvailable
                            ? "#35D66A"
                            : "#69737A"

                    border.width: 1
                    border.color: "#80FFFFFF"
                }


                Column {
                    spacing: 0


                    Text {
                        text: "GPS"

                        color: labelColor

                        font.pixelSize: 9
                        font.bold: true
                    }


                    Text {
                        text:
                            gpsAvailable
                                ? "POSITION"
                                : "NO GPS"

                        color: valueColor

                        font.pixelSize: 11
                        font.bold: true
                    }
                }
            }
        }


        // =====================================================
        // SATELLITES
        // =====================================================

        Rectangle {
            id: satellitePanel

            Layout.fillHeight: true
            Layout.preferredWidth: 92

            radius: 6

            color: panelColor

            border.width: 1
            border.color: panelBorder


            Column {
                anchors.centerIn: parent

                spacing: 0


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: "GPS"

                    color: labelColor

                    font.pixelSize: 8
                    font.bold: true
                }


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
                                    ? "#42D8F2"
                                    : "#5E676D"
                        }
                    }
                }


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text:
                        gpsAvailable
                            ? satelliteCount + " SAT"
                            : "-- SAT"

                    color: valueColor

                    font.pixelSize: 7
                    font.bold: true
                }


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text:
                        gpsAvailable &&
                        !isNaN(gpsHdop)

                            ? "HDOP " + gpsHdop.toFixed(1)

                            : "HDOP --"

                    color: labelColor

                    font.pixelSize: 7
                }
            }
        }


        // =====================================================
        // CENTRAL FLIGHT STATUS
        //
        // GREEN  = FLYING
        // ORANGE = ARMED
        // BLUE   = READY
        // GREY   = DISCONNECTED
        // =====================================================

        Rectangle {
            id: flightStatusPanel

            Layout.fillHeight: true
            Layout.fillWidth: true

            Layout.minimumWidth: 260

            radius: 7


            color:
                Qt.rgba(
                    statusColor.r,
                    statusColor.g,
                    statusColor.b,
                    vehicleFlying
                        ? 0.22
                        : vehicleArmed
                            ? 0.16
                            : 0.11
                )


            border.width: 1

            border.color:
                Qt.rgba(
                    statusColor.r,
                    statusColor.g,
                    statusColor.b,
                    vehicleFlying
                        ? 0.70
                        : 0.40
                )


            // -------------------------------------------------
            // VERY SUBTLE GLASS REFLECTION
            // -------------------------------------------------

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top

                height: parent.height * 0.45

                radius: 7

                color: "#FFFFFF"

                opacity: 0.025
            }


            // -------------------------------------------------
            // STATUS CONTENT
            // -------------------------------------------------

            Column {
                anchors.centerIn: parent

                spacing: 0


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: flightStatusText

                    color: "#FFFFFF"

                    font.pixelSize: 16
                    font.bold: true
                }


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: flightSubStatus

                    color: statusTextColor

                    font.pixelSize: 9
                    font.bold: true
                }
            }
        }


        // =====================================================
        // RC
        // =====================================================

        Rectangle {
            id: rcPanel

            Layout.fillHeight: true
            Layout.preferredWidth: 78

            radius: 6

            color: panelColor

            border.width: 1
            border.color: panelBorder


            Column {
                anchors.centerIn: parent

                spacing: 0


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: "RC"

                    color: labelColor

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

                            color:
                                "#53DDF4"
                        }
                    }
                }
            }
        }


        // =====================================================
        // HD
        // =====================================================

        Rectangle {
            id: hdPanel

            Layout.fillHeight: true
            Layout.preferredWidth: 78

            radius: 6

            color: panelColor

            border.width: 1
            border.color: panelBorder


            Column {
                anchors.centerIn: parent

                spacing: 0


                Text {
                    anchors.horizontalCenter: parent.horizontalCenter

                    text: "HD"

                    color: labelColor

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

                            color:
                                "#53DDF4"
                        }
                    }
                }
            }
        }


        // =====================================================
        // BATTERY
        // =====================================================

        Rectangle {
            id: batteryPanel

            Layout.fillHeight: true
            Layout.preferredWidth: 92

            radius: 6

            color: panelColor

            border.width: 1
            border.color: panelBorder


            Row {
                anchors.centerIn: parent

                spacing: 5


                Text {
                    text: "▣"

                    color:

                        !batteryAvailable
                            ? "#777777"

                            : batteryPercent <= 20
                                ? "#FF4D55"

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

                    color: valueColor

                    font.pixelSize: 15
                    font.bold: true
                }
            }
        }


        // =====================================================
        // SETTINGS
        //
        // THIS BUTTON ONLY OPENS THE TOOL/SUBMENU DIALOG.
        //
        // IT DOES NOT OPEN HOME.
        // =====================================================

        Rectangle {
            id: settingsPanel

            Layout.fillHeight: true
            Layout.preferredWidth: 48

            radius: 6

            color: panelColor

            border.width: 1
            border.color: panelBorder


            Text {
                id: settingsIcon

                anchors.centerIn: parent

                text: "⚙"

                color: "#EAF8FF"

                font.pixelSize: 21
            }


            MouseArea {
                id: settingsMouseArea

                anchors.fill: parent

                hoverEnabled: true

                cursorShape: Qt.PointingHandCursor


                onClicked: {
                    mainWindow.showToolSelectDialog()
                }
            }


            Rectangle {
                anchors.fill: parent

                radius: 6

                color: "#FFFFFF"

                opacity:
                    settingsMouseArea.containsMouse
                        ? 0.08
                        : 0

                z: 10
            }
        }
    }


    // =========================================================
    // DOWNLOAD PROGRESS
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

        opacity: 0.60

        z: 20
    }
}
