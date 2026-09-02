/****************************************************************************
 *
 * IndiFlo Ground Control
 *
 * IndiFlo Yaw / Heading Indicator
 *
 ****************************************************************************/

import QtQuick
import QGroundControl
import QGroundControl.Vehicle
import QGroundControl.Controls

Item {
    id: root

    width: 210
    height: 210

    property var activeVehicle: QGroundControl.multiVehicleManager.activeVehicle

    property real aircraftHeading: {
        if (!activeVehicle) {
            return 0
        }

        if (activeVehicle.heading) {
            return activeVehicle.heading.rawValue
        }

        return 0
    }

    // ---------------------------------------------------------------------
    // GLASS OUTER PANEL
    // ---------------------------------------------------------------------

    Rectangle {
        id: glassPanel

        anchors.fill: parent

        radius: width / 2

        color: "#18151B22"

        border.width: 1
        border.color: "#65FFFFFF"

        antialiasing: true

        // subtle inner glass highlight
        Rectangle {
            anchors.fill: parent
            anchors.margins: 5

            radius: width / 2

            color: "transparent"

            border.width: 1
            border.color: "#20FFFFFF"
        }
    }

    // ---------------------------------------------------------------------
    // COMPASS DIAL
    // ---------------------------------------------------------------------

    Item {
        id: compass

        anchors.fill: parent

        rotation: -root.aircraftHeading

        // -------------------------------------------------------------
        // OUTER RING
        // -------------------------------------------------------------

        Rectangle {
            anchors.centerIn: parent

            width: parent.width * 0.84
            height: width

            radius: width / 2

            color: "transparent"

            border.width: 1
            border.color: "#80FFFFFF"
        }

        // -------------------------------------------------------------
        // INNER RING
        // -------------------------------------------------------------

        Rectangle {
            anchors.centerIn: parent

            width: parent.width * 0.68
            height: width

            radius: width / 2

            color: "transparent"

            border.width: 1
            border.color: "#35FFFFFF"
        }

        // -------------------------------------------------------------
        // COMPASS TICKS
        // -------------------------------------------------------------

        Repeater {
            model: 36

            delegate: Rectangle {
                required property int index

                width: index % 9 === 0 ? 2 : 1
                height: index % 9 === 0 ? 12 : 7

                radius: 1

                color: "#DFFFFFFF"

                x: compass.width / 2 - width / 2

                y: compass.height * 0.08

                transformOrigin: Item.Bottom

                rotation: index * 10
            }
        }

        // -------------------------------------------------------------
        // CARDINAL DIRECTIONS
        // -------------------------------------------------------------

        Text {
            text: "N"

            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.14

            color: "#FFFFFF"

            font.pixelSize: 16
            font.bold: true

            rotation: root.aircraftHeading
        }

        Text {
            text: "E"

            x: parent.width * 0.77
            anchors.verticalCenter: parent.verticalCenter

            color: "#FFFFFF"

            font.pixelSize: 15
            font.bold: true

            rotation: root.aircraftHeading
        }

        Text {
            text: "S"

            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.78

            color: "#FFFFFF"

            font.pixelSize: 15
            font.bold: true

            rotation: root.aircraftHeading
        }

        Text {
            text: "W"

            x: parent.width * 0.17
            anchors.verticalCenter: parent.verticalCenter

            color: "#FFFFFF"

            font.pixelSize: 15
            font.bold: true

            rotation: root.aircraftHeading
        }
    }

    // ---------------------------------------------------------------------
    // FIXED AIRCRAFT HEADING POINTER
    // ---------------------------------------------------------------------

    Item {
        id: aircraftPointer

        anchors.centerIn: parent

        width: parent.width
        height: parent.height

        // fixed yellow aircraft marker at top

        Canvas {
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d")

                ctx.reset()

                ctx.beginPath()

                ctx.moveTo(width / 2, height * 0.08)
                ctx.lineTo(width / 2 - 10, height * 0.20)
                ctx.lineTo(width / 2 + 10, height * 0.20)
                ctx.closePath()

                ctx.fillStyle = "#FFD23F"
                ctx.fill()

                ctx.lineWidth = 1
                ctx.strokeStyle = "#FFFFFFFF"
                ctx.stroke()
            }
        }
    }

    // ---------------------------------------------------------------------
    // CENTER AIRCRAFT SYMBOL
    // ---------------------------------------------------------------------

    Canvas {
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")

            ctx.reset()

            var cx = width / 2
            var cy = height / 2

            // center circle

            ctx.beginPath()
            ctx.arc(cx, cy, 5, 0, Math.PI * 2)

            ctx.fillStyle = "#FFD23F"
            ctx.fill()

            ctx.lineWidth = 1
            ctx.strokeStyle = "#FFFFFFFF"
            ctx.stroke()

            // vertical heading reference

            ctx.beginPath()
            ctx.moveTo(cx, cy - 12)
            ctx.lineTo(cx, cy + 12)

            ctx.lineWidth = 1
            ctx.strokeStyle = "#80FFFFFF"
            ctx.stroke()
        }
    }

    // ---------------------------------------------------------------------
    // HEADING VALUE
    // ---------------------------------------------------------------------

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter

        y: parent.height * 0.84

        width: 78
        height: 25

        radius: 12

        color: "#25101820"

        border.width: 1
        border.color: "#45FFFFFF"

        Text {
            anchors.centerIn: parent

            text: Math.round(root.aircraftHeading) + "°"

            color: "#FFFFFF"

            font.pixelSize: 14
            font.bold: true
        }
    }

    // ---------------------------------------------------------------------
    // LABEL
    // ---------------------------------------------------------------------

    Text {
        anchors.horizontalCenter: parent.horizontalCenter

        y: -24

        text: "YAW / HDG"

        color: "#FFFFFF"

        font.pixelSize: 11
        font.bold: true

        opacity: 0.9
    }
}
