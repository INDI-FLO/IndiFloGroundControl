/****************************************************************************
 *
 * IndiFlo Ground Control
 *
 * Professional Glass Attitude + Heading Panel
 *
 ****************************************************************************/

import QtQuick

import QGroundControl
import QGroundControl.Vehicle
import QGroundControl.Controls

Item {
    id: root

    /*
     * ------------------------------------------------------------
     * PANEL SIZE
     * ------------------------------------------------------------
     *
     * This is approximately the 65% scale you requested.
     *
     */

    width: 310
    height: 650

    property var activeVehicle:
        QGroundControl.multiVehicleManager.activeVehicle

    /*
     * ------------------------------------------------------------
     * LIVE FLIGHT DATA
     * ------------------------------------------------------------
     */

    property real rollAngle: activeVehicle
                           ? activeVehicle.roll.rawValue
                           : 0

    property real pitchAngle: activeVehicle
                            ? activeVehicle.pitch.rawValue
                            : 0

    property real yawAngle: activeVehicle
                          ? activeVehicle.heading.rawValue
                          : 0

    /*
     * ------------------------------------------------------------
     * COLLAPSE
     * ------------------------------------------------------------
     */

    property bool collapsed: false

    /*
     * ------------------------------------------------------------
     * GLASS COLORS
     * ------------------------------------------------------------
     */

    readonly property color glassColor: "#18101820"
    readonly property color glassBorder: "#70FFFFFF"
    readonly property color innerBorder: "#25FFFFFF"

    readonly property color textColor: "#FFFFFF"
    readonly property color accentColor: "#FFD23F"

    /*
     * ------------------------------------------------------------
     * COLLAPSED WIDTH
     * ------------------------------------------------------------
     */

    Behavior on width {
        NumberAnimation {
            duration: 250
            easing.type: Easing.OutCubic
        }
    }

    Behavior on opacity {
        NumberAnimation {
            duration: 200
        }
    }

    /*
     * ============================================================
     * MAIN GLASS PANEL
     * ============================================================
     */

    Rectangle {
        id: glassPanel

        anchors.fill: parent

        radius: 22

        color: root.glassColor

        border.width: 1
        border.color: root.glassBorder

        antialiasing: true

        /*
         * INNER GLASS BORDER
         */

        Rectangle {
            anchors.fill: parent
            anchors.margins: 6

            radius: 17

            color: "transparent"

            border.width: 1
            border.color: root.innerBorder
        }

        /*
         * --------------------------------------------------------
         * HEADER
         * --------------------------------------------------------
         */

        Rectangle {
            id: header

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right

            height: 58

            radius: 21

            color: "#121FFFFFF"

            border.width: 1
            border.color: "#35FFFFFF"

            Text {
                anchors.centerIn: parent

                text: "ARTIFICIAL HORIZON"

                color: root.textColor

                font.pixelSize: 17
                font.bold: true
                font.letterSpacing: 0.5
            }

            Text {
                anchors.right: parent.right
                anchors.rightMargin: 18

                anchors.verticalCenter: parent.verticalCenter

                text: "AH"

                color: "#55CFFF"

                font.pixelSize: 14
                font.bold: true
            }
        }

        /*
         * ========================================================
         * ARTIFICIAL HORIZON
         * ========================================================
         */

        Item {
            id: horizon

            anchors.top: header.bottom
            anchors.horizontalCenter: parent.horizontalCenter

            width: parent.width * 0.88
            height: width

            /*
             * ----------------------------------------------------
             * HORIZON CIRCLE
             * ----------------------------------------------------
             */

            Rectangle {
                id: horizonClip

                anchors.fill: parent

                radius: width / 2

                clip: true

                color: "transparent"

                /*
                 * ------------------------------------------------
                 * SKY
                 * ------------------------------------------------
                 */

                Rectangle {
                    id: sky

                    width: horizon.width * 2.4
                    height: horizon.height * 2.4

                    x: horizon.width / 2 - width / 2

                    y: horizon.height / 2
                       - height * 0.25
                       + root.pitchAngle * 2.1

                    color: "#165B91"

                    antialiasing: true

                    transform: Rotation {
                        origin.x: sky.width / 2
                        origin.y: sky.height / 2

                        angle: -root.rollAngle
                    }
                }

                /*
                 * ------------------------------------------------
                 * GROUND
                 * ------------------------------------------------
                 */

                Rectangle {
                    id: ground

                    width: horizon.width * 2.4
                    height: horizon.height * 2.4

                    x: horizon.width / 2 - width / 2

                    y: horizon.height / 2
                       + root.pitchAngle * 2.1

                    color: "#5B4A36"

                    antialiasing: true

                    transform: Rotation {
                        origin.x: ground.width / 2
                        origin.y: ground.height / 2

                        angle: -root.rollAngle
                    }
                }

                /*
                 * ------------------------------------------------
                 * HORIZON LINE
                 * ------------------------------------------------
                 */

                Rectangle {
                    anchors.centerIn: parent

                    width: parent.width * 1.8

                    height: 2

                    color: "#FFFFFF"

                    rotation: -root.rollAngle

                    y: root.pitchAngle * 2.1
                }

                /*
                 * ------------------------------------------------
                 * PITCH LADDER
                 * ------------------------------------------------
                 */

                Item {
                    anchors.fill: parent

                    rotation: -root.rollAngle

                    y: root.pitchAngle * 2.1

                    /*
                     * +20
                     */

                    Rectangle {
                        width: 70
                        height: 2

                        anchors.horizontalCenter: parent.horizontalCenter

                        y: parent.height * 0.23

                        color: "#FFFFFF"
                    }

                    Text {
                        text: "20"

                        x: parent.width / 2 - 60

                        y: parent.height * 0.23 - 10

                        color: "#FFFFFF"

                        font.pixelSize: 12
                        font.bold: true
                    }

                    Text {
                        text: "20"

                        x: parent.width / 2 + 48

                        y: parent.height * 0.23 - 10

                        color: "#FFFFFF"

                        font.pixelSize: 12
                        font.bold: true
                    }

                    /*
                     * +10
                     */

                    Rectangle {
                        width: 70
                        height: 2

                        anchors.horizontalCenter: parent.horizontalCenter

                        y: parent.height * 0.36

                        color: "#FFFFFF"
                    }

                    Text {
                        text: "10"

                        x: parent.width / 2 - 60

                        y: parent.height * 0.36 - 10

                        color: "#FFFFFF"

                        font.pixelSize: 12
                    }

                    Text {
                        text: "10"

                        x: parent.width / 2 + 48

                        y: parent.height * 0.36 - 10

                        color: "#FFFFFF"

                        font.pixelSize: 12
                    }

                    /*
                     * -10
                     */

                    Rectangle {
                        width: 70
                        height: 2

                        anchors.horizontalCenter: parent.horizontalCenter

                        y: parent.height * 0.64

                        color: "#FFFFFF"
                    }

                    Text {
                        text: "10"

                        x: parent.width / 2 - 60

                        y: parent.height * 0.64 - 10

                        color: "#FFFFFF"

                        font.pixelSize: 12
                    }

                    Text {
                        text: "10"

                        x: parent.width / 2 + 48

                        y: parent.height * 0.64 - 10

                        color: "#FFFFFF"

                        font.pixelSize: 12
                    }

                    /*
                     * -20
                     */

                    Rectangle {
                        width: 70
                        height: 2

                        anchors.horizontalCenter: parent.horizontalCenter

                        y: parent.height * 0.77

                        color: "#FFFFFF"
                    }

                    Text {
                        text: "20"

                        x: parent.width / 2 - 60

                        y: parent.height * 0.77 - 10

                        color: "#FFFFFF"

                        font.pixelSize: 12
                    }

                    Text {
                        text: "20"

                        x: parent.width / 2 + 48

                        y: parent.height * 0.77 - 10

                        color: "#FFFFFF"

                        font.pixelSize: 12
                    }
                }

                /*
                 * ------------------------------------------------
                 * OUTER COMPASS RING
                 * ------------------------------------------------
                 */

                Item {
                    anchors.fill: parent

                    rotation: -root.yawAngle

                    /*
                     * OUTER RING
                     */

                    Rectangle {
                        anchors.centerIn: parent

                        width: parent.width * 0.98
                        height: width

                        radius: width / 2

                        color: "transparent"

                        border.width: 1

                        border.color: "#DFFFFFFF"
                    }

                    /*
                     * INNER RING
                     */

                    Rectangle {
                        anchors.centerIn: parent

                        width: parent.width * 0.90
                        height: width

                        radius: width / 2

                        color: "transparent"

                        border.width: 1

                        border.color: "#45FFFFFF"
                    }

                    /*
                     * ------------------------------------------------
                     * 36 COMPASS TICKS
                     * ------------------------------------------------
                     */

                    Repeater {
                        model: 36

                        delegate: Rectangle {
                            required property int index

                            width: index % 9 === 0 ? 3 : 1

                            height: index % 9 === 0 ? 14 : 7

                            color: index % 9 === 0
                                   ? root.accentColor
                                   : "#FFFFFF"

                            x: parent.width / 2 - width / 2

                            y: parent.height * 0.015

                            transformOrigin: Item.Bottom

                            rotation: index * 10
                        }
                    }

                    /*
                     * ------------------------------------------------
                     * CARDINAL DIRECTIONS
                     * ------------------------------------------------
                     */

                    Text {
                        text: "N"

                        anchors.horizontalCenter: parent.horizontalCenter

                        y: parent.height * 0.045

                        color: "#FFFFFF"

                        font.pixelSize: 15
                        font.bold: true

                        rotation: root.yawAngle
                    }

                    Text {
                        text: "E"

                        x: parent.width * 0.91

                        anchors.verticalCenter: parent.verticalCenter

                        color: "#FFFFFF"

                        font.pixelSize: 15
                        font.bold: true

                        rotation: root.yawAngle
                    }

                    Text {
                        text: "S"

                        anchors.horizontalCenter: parent.horizontalCenter

                        y: parent.height * 0.88

                        color: "#FFFFFF"

                        font.pixelSize: 15
                        font.bold: true

                        rotation: root.yawAngle
                    }

                    Text {
                        text: "W"

                        x: parent.width * 0.04

                        anchors.verticalCenter: parent.verticalCenter

                        color: "#FFFFFF"

                        font.pixelSize: 15
                        font.bold: true

                        rotation: root.yawAngle
                    }
                }
            }

            /*
             * --------------------------------------------------------
             * FIXED AIRCRAFT REFERENCE
             * --------------------------------------------------------
             */

            Canvas {
                anchors.fill: parent

                onPaint: {
                    var ctx = getContext("2d")

                    ctx.reset()

                    var cx = width / 2
                    var cy = height / 2

                    /*
                     * LEFT WING
                     */

                    ctx.beginPath()

                    ctx.moveTo(cx - 42, cy)
                    ctx.lineTo(cx - 8, cy)

                    ctx.lineWidth = 6

                    ctx.strokeStyle = "#FFD23F"

                    ctx.stroke()

                    /*
                     * RIGHT WING
                     */

                    ctx.beginPath()

                    ctx.moveTo(cx + 8, cy)
                    ctx.lineTo(cx + 42, cy)

                    ctx.lineWidth = 6

                    ctx.strokeStyle = "#FFD23F"

                    ctx.stroke()

                    /*
                     * CENTER
                     */

                    ctx.beginPath()

                    ctx.arc(cx, cy, 7, 0, Math.PI * 2)

                    ctx.fillStyle = "#FFD23F"

                    ctx.fill()

                    ctx.lineWidth = 2

                    ctx.strokeStyle = "#FFFFFF"

                    ctx.stroke()

                    /*
                     * CENTER POINTER
                     */

                    ctx.beginPath()

                    ctx.moveTo(cx, cy)
                    ctx.lineTo(cx, cy + 25)

                    ctx.lineWidth = 4

                    ctx.strokeStyle = "#FFD23F"

                    ctx.stroke()
                }
            }

            /*
             * --------------------------------------------------------
             * TOP AIRCRAFT TRIANGLE
             * --------------------------------------------------------
             */

            Canvas {
                anchors.fill: parent

                onPaint: {
                    var ctx = getContext("2d")

                    ctx.reset()

                    var cx = width / 2

                    ctx.beginPath()

                    ctx.moveTo(cx, 9)

                    ctx.lineTo(cx - 9, 25)

                    ctx.lineTo(cx + 9, 25)

                    ctx.closePath()

                    ctx.fillStyle = "#FFD23F"

                    ctx.fill()

                    ctx.lineWidth = 1

                    ctx.strokeStyle = "#FFFFFF"

                    ctx.stroke()
                }
            }
        }

        /*
         * ============================================================
         * YAW / HEADING COMPASS
         * ============================================================
         */

        Item {
            id: yawCompass

            anchors.top: horizon.bottom

            anchors.horizontalCenter: parent.horizontalCenter

            anchors.topMargin: 12

            width: parent.width * 0.72
            height: width

            /*
             * GLASS CIRCLE
             */

            Rectangle {
                anchors.fill: parent

                radius: width / 2

                color: "#10101820"

                border.width: 1

                border.color: "#65FFFFFF"
            }

            /*
             * ROTATING COMPASS
             */

            Item {
                anchors.fill: parent

                rotation: -root.yawAngle

                /*
                 * OUTER CIRCLE
                 */

                Rectangle {
                    anchors.fill: parent

                    radius: width / 2

                    color: "transparent"

                    border.width: 1

                    border.color: "#DFFFFFFF"
                }

                /*
                 * INNER CIRCLE
                 */

                Rectangle {
                    anchors.centerIn: parent

                    width: parent.width * 0.72

                    height: width

                    radius: width / 2

                    color: "transparent"

                    border.width: 1

                    border.color: "#35FFFFFF"
                }

                /*
                 * 36 TICKS
                 */

                Repeater {
                    model: 36

                    delegate: Rectangle {
                        required property int index

                        width: index % 9 === 0 ? 3 : 1

                        height: index % 9 === 0 ? 12 : 6

                        color: index % 9 === 0
                               ? root.accentColor
                               : "#FFFFFF"

                        x: parent.width / 2 - width / 2

                        y: 4

                        transformOrigin: Item.Bottom

                        rotation: index * 10
                    }
                }

                /*
                 * HEADING NUMBERS
                 */

                Text {
                    text: "330"

                    x: parent.width * 0.16

                    y: parent.height * 0.17

                    color: "#FFFFFF"

                    font.pixelSize: 10

                    rotation: root.yawAngle
                }

                Text {
                    text: "030"

                    x: parent.width * 0.68

                    y: parent.height * 0.17

                    color: "#FFFFFF"

                    font.pixelSize: 10

                    rotation: root.yawAngle
                }

                Text {
                    text: "060"

                    x: parent.width * 0.82

                    y: parent.height * 0.35

                    color: "#FFFFFF"

                    font.pixelSize: 10

                    rotation: root.yawAngle
                }

                Text {
                    text: "120"

                    x: parent.width * 0.82

                    y: parent.height * 0.62

                    color: "#FFFFFF"

                    font.pixelSize: 10

                    rotation: root.yawAngle
                }

                Text {
                    text: "150"

                    x: parent.width * 0.64

                    y: parent.height * 0.80

                    color: "#FFFFFF"

                    font.pixelSize: 10

                    rotation: root.yawAngle
                }

                Text {
                    text: "210"

                    x: parent.width * 0.18

                    y: parent.height * 0.80

                    color: "#FFFFFF"

                    font.pixelSize: 10

                    rotation: root.yawAngle
                }

                Text {
                    text: "240"

                    x: parent.width * 0.03

                    y: parent.height * 0.62

                    color: "#FFFFFF"

                    font.pixelSize: 10

                    rotation: root.yawAngle
                }

                Text {
                    text: "300"

                    x: parent.width * 0.03

                    y: parent.height * 0.35

                    color: "#FFFFFF"

                    font.pixelSize: 10

                    rotation: root.yawAngle
                }

                /*
                 * CARDINAL LETTERS
                 */

                Text {
                    text: "N"

                    anchors.horizontalCenter: parent.horizontalCenter

                    y: 20

                    color: "#FF5555"

                    font.pixelSize: 15
                    font.bold: true

                    rotation: root.yawAngle
                }

                Text {
                    text: "E"

                    x: parent.width - 30

                    anchors.verticalCenter: parent.verticalCenter

                    color: "#FFFFFF"

                    font.pixelSize: 15
                    font.bold: true

                    rotation: root.yawAngle
                }

                Text {
                    text: "S"

                    anchors.horizontalCenter: parent.horizontalCenter

                    y: parent.height - 38

                    color: "#FFFFFF"

                    font.pixelSize: 15
                    font.bold: true

                    rotation: root.yawAngle
                }

                Text {
                    text: "W"

                    x: 15

                    anchors.verticalCenter: parent.verticalCenter

                    color: "#FFFFFF"

                    font.pixelSize: 15
                    font.bold: true

                    rotation: root.yawAngle
                }
            }

            /*
             * --------------------------------------------------------
             * FIXED AIRCRAFT SILHOUETTE
             * --------------------------------------------------------
             */

            Canvas {
                anchors.fill: parent

                onPaint: {
                    var ctx = getContext("2d")

                    ctx.reset()

                    var cx = width / 2
                    var cy = height / 2

                    ctx.beginPath()

                    /*
                     * aircraft nose
                     */

                    ctx.moveTo(cx, cy - 42)

                    /*
                     * right side
                     */

                    ctx.lineTo(cx + 7, cy - 25)

                    ctx.lineTo(cx + 32, cy - 7)

                    ctx.lineTo(cx + 32, cy + 2)

                    ctx.lineTo(cx + 8, cy - 5)

                    /*
                     * fuselage
                     */

                    ctx.lineTo(cx + 8, cy + 35)

                    ctx.lineTo(cx + 16, cy + 42)

                    ctx.lineTo(cx + 16, cy + 48)

                    ctx.lineTo(cx, cy + 43)

                    /*
                     * left side
                     */

                    ctx.lineTo(cx - 16, cy + 48)

                    ctx.lineTo(cx - 16, cy + 42)

                    ctx.lineTo(cx - 8, cy + 35)

                    ctx.lineTo(cx - 8, cy - 5)

                    ctx.lineTo(cx - 32, cy + 2)

                    ctx.lineTo(cx - 32, cy - 7)

                    ctx.lineTo(cx - 7, cy - 25)

                    ctx.closePath()

                    ctx.fillStyle = "#151A20"

                    ctx.fill()

                    ctx.lineWidth = 2

                    ctx.strokeStyle = "#FFFFFF"

                    ctx.stroke()
                }
            }

            /*
             * FIXED TOP POINTER
             */

            Canvas {
                anchors.fill: parent

                onPaint: {
                    var ctx = getContext("2d")

                    ctx.reset()

                    var cx = width / 2

                    ctx.beginPath()

                    ctx.moveTo(cx, 9)

                    ctx.lineTo(cx - 8, 24)

                    ctx.lineTo(cx + 8, 24)

                    ctx.closePath()

                    ctx.fillStyle = "#FFD23F"

                    ctx.fill()

                    ctx.lineWidth = 1

                    ctx.strokeStyle = "#FFFFFF"

                    ctx.stroke()
                }
            }

            /*
             * HEADING VALUE
             */

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter

                y: parent.height * 0.72

                width: 75
                height: 27

                radius: 13

                color: "#35101820"

                border.width: 1

                border.color: "#55FFFFFF"

                Text {
                    anchors.centerIn: parent

                    text: Math.round(root.yawAngle) + "°"

                    color: root.accentColor

                    font.pixelSize: 15

                    font.bold: true
                }
            }
        }

        /*
         * ============================================================
         * RP Y DATA
         * ============================================================
         */

        Rectangle {
            id: rpyPanel

            anchors.left: parent.left
            anchors.right: parent.right

            anchors.leftMargin: 32
            anchors.rightMargin: 32

            anchors.bottom: parent.bottom

            anchors.bottomMargin: 18

            height: 44

            radius: 12

            color: "#15101820"

            border.width: 1

            border.color: "#45FFFFFF"

            Row {
                anchors.centerIn: parent

                spacing: 20

                Text {
                    text: "R"

                    color: root.accentColor

                    font.pixelSize: 13
                    font.bold: true
                }

                Text {
                    text: root.rollAngle.toFixed(1) + "°"

                    color: "#FFFFFF"

                    font.pixelSize: 13
                }

                Text {
                    text: "P"

                    color: "#55CFFF"

                    font.pixelSize: 13
                    font.bold: true
                }

                Text {
                    text: root.pitchAngle.toFixed(1) + "°"

                    color: "#FFFFFF"

                    font.pixelSize: 13
                }

                Text {
                    text: "Y"

                    color: "#FFD23F"

                    font.pixelSize: 13
                    font.bold: true
                }

                Text {
                    text: root.yawAngle.toFixed(1) + "°"

                    color: "#FFFFFF"

                    font.pixelSize: 13
                }
            }
        }
    }

    /*
     * ============================================================
     * COLLAPSE HANDLE
     * ============================================================
     */

    Rectangle {
        id: collapseHandle

        anchors.right: parent.right

        anchors.verticalCenter: parent.verticalCenter

        width: 34
        height: 74

        radius: 16

        color: "#25101820"

        border.width: 1

        border.color: "#55FFFFFF"

        z: 100

        Text {
            anchors.centerIn: parent

            text: root.collapsed ? ">" : "<"

            color: "#FFFFFF"

            font.pixelSize: 25

            font.bold: true
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                root.collapsed = !root.collapsed
            }
        }
    }

    /*
     * ============================================================
     * COLLAPSE BEHAVIOUR
     * ============================================================
     */

    states: [
        State {
            name: "collapsed"

            when: root.collapsed

            PropertyChanges {
                target: root

                width: 42
            }

            PropertyChanges {
                target: glassPanel

                opacity: 0.0
            }

            PropertyChanges {
                target: collapseHandle

                anchors.rightMargin: 0
            }
        }
    ]
}
