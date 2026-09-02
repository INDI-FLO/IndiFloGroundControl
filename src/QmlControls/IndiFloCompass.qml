/****************************************************************************
 *
 * IndiFlo Ground Control
 *
 * Custom Transparent Glass Compass
 *
 ****************************************************************************/

import QtQuick
import QGroundControl
import QGroundControl.Controls
import QGroundControl.Palette

Item {
    id: root

    width: 150
    height: 150

    property var vehicle: QGroundControl.multiVehicleManager.activeVehicle

    property real heading: vehicle ? vehicle.heading.rawValue : 0

    property bool showHeadingValue: true

    property color glassColor: "#25101820"
    property color glassLineColor: "#65FFFFFF"
    property color glassTextColor: "#FFFFFFFF"
    property color accentColor: "#FFFFFF"

    property real compassRadius: Math.min(width, height) * 0.43

    // ---------------------------------------------------------
    // Transparent glass background
    // ---------------------------------------------------------

    Rectangle {
        anchors.fill: parent

        color: root.glassColor

        radius: width / 2

        border.width: 1
        border.color: "#35FFFFFF"

        antialiasing: true
    }

    // ---------------------------------------------------------
    // Subtle glass highlight
    // ---------------------------------------------------------

    Rectangle {
        anchors.fill: parent

        color: "transparent"

        radius: width / 2

        border.width: 1
        border.color: "#18FFFFFF"

        antialiasing: true
    }

    // ---------------------------------------------------------
    // Compass rotating section
    // ---------------------------------------------------------

    Item {
        id: compassDial

        anchors.fill: parent

        rotation: -root.heading

        // -----------------------------------------------------
        // Outer compass ring
        // -----------------------------------------------------

        Rectangle {
            anchors.centerIn: parent

            width: root.compassRadius * 2
            height: width

            radius: width / 2

            color: "transparent"

            border.width: 1
            border.color: root.glassLineColor

            antialiasing: true
        }

        // -----------------------------------------------------
        // Inner compass ring
        // -----------------------------------------------------

        Rectangle {
            anchors.centerIn: parent

            width: root.compassRadius * 1.65
            height: width

            radius: width / 2

            color: "transparent"

            border.width: 1
            border.color: "#30FFFFFF"

            antialiasing: true
        }

        // -----------------------------------------------------
        // Compass tick marks
        // -----------------------------------------------------

        Repeater {
            model: 72

            delegate: Rectangle {
                property real angle: index * 5

                width: index % 6 === 0 ? 2 : 1
                height: index % 6 === 0 ? 10 : 5

                radius: 1

                color: index % 18 === 0
                       ? root.accentColor
                       : "#BFFFFFFF"

                antialiasing: true

                x: root.width / 2
                   + Math.sin(angle * Math.PI / 180)
                     * root.compassRadius
                   - width / 2

                y: root.height / 2
                   - Math.cos(angle * Math.PI / 180)
                     * root.compassRadius
                   - height / 2

                rotation: angle
            }
        }

        // -----------------------------------------------------
        // North
        // -----------------------------------------------------

        Text {
            text: "N"

            color: "#FFFFFF"

            font.pixelSize: 13
            font.bold: true

            anchors.horizontalCenter: parent.horizontalCenter

            y: root.height / 2 - root.compassRadius + 16

            rotation: root.heading

            renderType: Text.NativeRendering
        }

        // -----------------------------------------------------
        // East
        // -----------------------------------------------------

        Text {
            text: "E"

            color: "#FFFFFF"

            font.pixelSize: 12
            font.bold: true

            x: root.width / 2 + root.compassRadius - 20
            y: root.height / 2 - 6

            rotation: root.heading

            renderType: Text.NativeRendering
        }

        // -----------------------------------------------------
        // South
        // -----------------------------------------------------

        Text {
            text: "S"

            color: "#FFFFFF"

            font.pixelSize: 12
            font.bold: true

            anchors.horizontalCenter: parent.horizontalCenter

            y: root.height / 2 + root.compassRadius - 28

            rotation: root.heading

            renderType: Text.NativeRendering
        }

        // -----------------------------------------------------
        // West
        // -----------------------------------------------------

        Text {
            text: "W"

            color: "#FFFFFF"

            font.pixelSize: 12
            font.bold: true

            x: root.width / 2 - root.compassRadius + 12
            y: root.height / 2 - 6

            rotation: root.heading

            renderType: Text.NativeRendering
        }
    }

    // ---------------------------------------------------------
    // Fixed aircraft heading marker
    // ---------------------------------------------------------


    // ---------------------------------------------------------
    // Fixed top heading triangle
    // ---------------------------------------------------------

    Canvas {
        id: headingMarker

        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")

            ctx.reset()

            ctx.beginPath()

            ctx.moveTo(root.width / 2, root.height / 2 - root.compassRadius - 2)
            ctx.lineTo(root.width / 2 - 7,
                       root.height / 2 - root.compassRadius + 10)
            ctx.lineTo(root.width / 2 + 7,
                       root.height / 2 - root.compassRadius + 10)

            ctx.closePath()

            ctx.fillStyle = "#FFFFFF"

            ctx.fill()
        }
    }

    // ---------------------------------------------------------
    // Center aircraft indicator
    // ---------------------------------------------------------

    Canvas {
        id: centerAircraft

        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")

            ctx.reset()

            var cx = root.width / 2
            var cy = root.height / 2

            ctx.beginPath()

            ctx.moveTo(cx, cy - 14)
            ctx.lineTo(cx - 10, cy + 8)
            ctx.lineTo(cx, cy + 3)
            ctx.lineTo(cx + 10, cy + 8)

            ctx.closePath()

            ctx.strokeStyle = "#FFFFFF"
            ctx.lineWidth = 2

            ctx.stroke()
        }
    }

    // ---------------------------------------------------------
    // Heading value
    // ---------------------------------------------------------

    Text {
        visible: root.showHeadingValue

        anchors.horizontalCenter: parent.horizontalCenter

        y: root.height * 0.72

        text: root.heading.toFixed(0) + "°"

        color: "#FFFFFF"

        font.pixelSize: 12
        font.bold: true

        renderType: Text.NativeRendering

        Rectangle {
            anchors.centerIn: parent

            width: parent.width + 18
            height: parent.height + 7

            radius: height / 2

            color: "#30101820"

            border.width: 1
            border.color: "#30FFFFFF"

            z: -1
        }
    }
}
