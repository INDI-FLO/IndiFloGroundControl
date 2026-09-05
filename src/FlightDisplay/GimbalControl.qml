import QtQuick
import QtQuick.Controls
import QGroundControl

Rectangle {
    id: root

    // =========================================================
    // GIMBAL PANEL
    // =========================================================

    width: 180
    height: 235

    color: "#B3000000"

    radius: 20
    clip: true

    border.width: 1
    border.color: "#55FFFFFF"


    // =========================================================
    // ACTIVE VEHICLE
    // =========================================================

    property var _activeVehicle:
        QGroundControl.multiVehicleManager.activeVehicle


    // =========================================================
    // JOYSTICK SETTINGS
    // =========================================================

    property real stickX: 0
    property real stickY: 0

    property real stickDistance: 42

    property bool joystickDragging: false


    // =========================================================
    // BUTTON SETTINGS
    // =========================================================

    // Amount of command applied by each button press.
    property real buttonStepDegrees: 5.0

    // How long the gimbal movement command is maintained.
    property int buttonCommandDuration: 300


    // =========================================================
    // GIMBAL CONTROLLER
    // =========================================================

    function gimbalController() {

        if (!_activeVehicle) {

            console.log(
                "CUSTOM GIMBAL: no active vehicle"
            )

            return null
        }

        if (!_activeVehicle.gimbalController) {

            console.log(
                "CUSTOM GIMBAL: no gimbal controller"
            )

            return null
        }

        return _activeVehicle.gimbalController
    }


    // =========================================================
    // NORMAL JOYSTICK COMMAND
    //
    // DO NOT CHANGE THIS LOGIC.
    //
    // LEFT  = negative pan
    // RIGHT = positive pan
    // UP    = positive tilt
    // DOWN  = negative tilt
    // =========================================================

    function moveGimbal(pan, tilt) {

        var controller = gimbalController()

        if (!controller) {
            return
        }

        console.log(
            "CUSTOM GIMBAL MOVE:",
            "pan =", pan,
            "tilt =", tilt
        )

        controller.gimbalOnScreenControl(
            pan,
            tilt,
            false,
            true,
            true,
            false,
            false,
            false
        )
    }


    // =========================================================
    // STOP GIMBAL
    // =========================================================

    function stopGimbal() {

        var controller = gimbalController()

        if (!controller) {
            return
        }

        controller.gimbalOnScreenControl(
            0,
            0,
            false,
            true,
            true,
            false,
            false,
            false
        )
    }


    // =========================================================
    // BUTTON COMMAND
    //
    // panDirection:
    //
    // LEFT  = -1
    // RIGHT = +1
    //
    // tiltDirection:
    //
    // DOWN = -1
    // UP   = +1
    // =========================================================

    function buttonStep(panDirection, tiltDirection) {

        var controller = gimbalController()

        if (!controller) {
            return
        }


        // -----------------------------------------------------
        // Stop any previous button timer.
        //
        // This prevents the previous command from interfering
        // with the next button press.
        // -----------------------------------------------------

        if (buttonTimer.running) {
            buttonTimer.stop()
        }


        // -----------------------------------------------------
        // Make sure joystick is not holding another command.
        // -----------------------------------------------------

        root.joystickDragging = false


        // -----------------------------------------------------
        // DEBUG
        // -----------------------------------------------------

        console.log(
            "========================================"
        )

        console.log(
            "CUSTOM GIMBAL BUTTON"
        )

        console.log(
            "PAN:",
            panDirection
        )

        console.log(
            "TILT:",
            tiltDirection
        )

        console.log(
            "DURATION:",
            buttonCommandDuration
        )

        console.log(
            "========================================"
        )


        // -----------------------------------------------------
        // SEND COMMAND
        //
        // IMPORTANT:
        //
        // Do NOT swap LEFT/RIGHT here.
        //
        // LEFT  = -1
        // RIGHT = +1
        //
        // UP    = +1
        // DOWN  = -1
        // -----------------------------------------------------

        controller.gimbalOnScreenControl(
            panDirection,
            tiltDirection,
            false,
            true,
            true,
            false,
            false,
            false
        )


        // -----------------------------------------------------
        // Start movement duration timer.
        // -----------------------------------------------------

        buttonTimer.restart()
    }


    // =========================================================
    // BUTTON COMMAND TIMER
    // =========================================================

    Timer {
        id: buttonTimer

        interval: root.buttonCommandDuration

        repeat: false

        onTriggered: {

            console.log(
                "CUSTOM GIMBAL BUTTON: STOP"
            )

            root.stopGimbal()
        }
    }


    // =========================================================
    // JOYSTICK MOVEMENT
    // =========================================================

    function moveJoystick(mouseX, mouseY) {

        var centerX =
            circle.width / 2

        var centerY =
            circle.height / 2


        var dx =
            mouseX - centerX

        var dy =
            mouseY - centerY


        var distance =
            Math.sqrt(
                dx * dx +
                dy * dy
            )


        // -----------------------------------------------------
        // Limit joystick to stickDistance.
        // -----------------------------------------------------

        if (
            distance > root.stickDistance &&
            distance > 0
        ) {

            dx =
                dx / distance *
                root.stickDistance

            dy =
                dy / distance *
                root.stickDistance
        }


        root.stickX = dx
        root.stickY = dy


        // -----------------------------------------------------
        // Convert joystick position into normalized command.
        //
        // LEFT  = negative pan
        // RIGHT = positive pan
        //
        // UP    = positive tilt
        // DOWN  = negative tilt
        // -----------------------------------------------------

        var panCommand =
            dx / root.stickDistance

        var tiltCommand =
            -(dy / root.stickDistance)


        root.moveGimbal(
            panCommand,
            tiltCommand
        )
    }


    // =========================================================
    // RESET JOYSTICK
    // =========================================================

    function resetJoystick() {

        root.stickX = 0
        root.stickY = 0

        root.stopGimbal()
    }


    // =========================================================
    // TITLE GLASS
    // =========================================================

    Rectangle {
        id: titlePanel

        width: parent.width - 24
        height: 32

        anchors.top: parent.top

        anchors.topMargin: 8

        anchors.horizontalCenter:
            parent.horizontalCenter

        radius: 9

        color: "#30000000"

        border.width: 1
        border.color: "#45FFFFFF"


        Text {
            anchors.centerIn: parent

            text: qsTr("GIMBAL CONTROL")

            color: "#F5FFFFFF"

            font.pixelSize: 11
            font.bold: true
            font.letterSpacing: 1.0
        }
    }


    // =========================================================
    // GIMBAL PAD
    // =========================================================

    Item {
        id: gimbalPad

        width: 155
        height: 155

        anchors.horizontalCenter:
            parent.horizontalCenter

        anchors.top:
            titlePanel.bottom

        anchors.topMargin: 12


        // =====================================================
        // OUTER JOYSTICK CIRCLE
        // =====================================================

        Rectangle {
            id: circle

            width: 125
            height: 125

            anchors.centerIn: parent

            radius: width / 2

            color: "#30000000"

            border.width: 1
            border.color: "#65FFFFFF"


            // =================================================
            // INNER GLASS RING
            // =================================================

            Rectangle {

                anchors.fill: parent

                anchors.margins: 7

                radius: width / 2

                color: "#18000000"

                border.width: 1
                border.color: "#35FFFFFF"
            }


            // =================================================
            // VERTICAL CENTER GUIDE
            // =================================================

            Rectangle {

                anchors.horizontalCenter:
                    parent.horizontalCenter

                anchors.top:
                    parent.top

                anchors.bottom:
                    parent.bottom

                width: 1

                color: "#35FFFFFF"
            }


            // =================================================
            // HORIZONTAL CENTER GUIDE
            // =================================================

            Rectangle {

                anchors.verticalCenter:
                    parent.verticalCenter

                anchors.left:
                    parent.left

                anchors.right:
                    parent.right

                height: 1

                color: "#35FFFFFF"
            }


            // =================================================
            // JOYSTICK DRAG AREA
            // =================================================

            MouseArea {
                id: joystickArea

                anchors.fill: parent

                hoverEnabled: true

                preventStealing: true


                onPressed: function(mouse) {

                    root.joystickDragging = true

                    root.moveJoystick(
                        mouse.x,
                        mouse.y
                    )
                }


                onPositionChanged:
                    function(mouse) {

                    if (root.joystickDragging) {

                        root.moveJoystick(
                            mouse.x,
                            mouse.y
                        )
                    }
                }


                onReleased: {

                    root.joystickDragging = false

                    root.resetJoystick()
                }


                onCanceled: {

                    root.joystickDragging = false

                    root.resetJoystick()
                }
            }
        }


        // =====================================================
        // MOVING JOYSTICK
        // =====================================================

        Rectangle {
            id: centerStick

            width: 42
            height: 42

            anchors.centerIn: circle

            radius: width / 2

            color: "#45FFFFFF"

            border.width: 1
            border.color: "#B0FFFFFF"

            z: 5


            transform: Translate {

                x: root.stickX
                y: root.stickY
            }


            Behavior on x {

                NumberAnimation {

                    duration:
                        root.joystickDragging
                        ? 0
                        : 120
                }
            }


            Behavior on y {

                NumberAnimation {

                    duration:
                        root.joystickDragging
                        ? 0
                        : 120
                }
            }


            // =================================================
            // INNER KNOB
            // =================================================

            Rectangle {

                anchors.centerIn: parent

                width: 12
                height: 12

                radius: 6

                color: "#E5FFFFFF"
            }


            // =================================================
            // KNOB INNER BORDER
            // =================================================

            Rectangle {

                anchors.fill: parent

                anchors.margins: 4

                radius: width / 2

                color: "transparent"

                border.width: 1
                border.color: "#40FFFFFF"
            }
        }


        // =====================================================
        // UP BUTTON
        // =====================================================

        RoundButton {
            id: upButton

            width: 32
            height: 32

            anchors.horizontalCenter:
                circle.horizontalCenter

            anchors.bottom:
                circle.top

            anchors.bottomMargin: -9

            text: "▲"

            z: 10


            background: Rectangle {

                radius: width / 2

                color:
                    upButton.pressed
                    ? "#55FFFFFF"
                    : "#25FFFFFF"

                border.width: 1

                border.color:
                    upButton.pressed
                    ? "#C0FFFFFF"
                    : "#65FFFFFF"
            }


            contentItem: Text {

                text: upButton.text

                color: "#F5FFFFFF"

                font.pixelSize: 13
                font.bold: true

                horizontalAlignment:
                    Text.AlignHCenter

                verticalAlignment:
                    Text.AlignVCenter
            }


            onClicked: {

                console.log(
                    "CUSTOM GIMBAL: UP BUTTON"
                )

                root.buttonStep(
                    0,
                    1
                )
            }
        }


        // =====================================================
        // DOWN BUTTON
        // =====================================================

        RoundButton {
            id: downButton

            width: 32
            height: 32

            anchors.horizontalCenter:
                circle.horizontalCenter

            anchors.top:
                circle.bottom

            anchors.topMargin: -9

            text: "▼"

            z: 10


            background: Rectangle {

                radius: width / 2

                color:
                    downButton.pressed
                    ? "#55FFFFFF"
                    : "#25FFFFFF"

                border.width: 1

                border.color:
                    downButton.pressed
                    ? "#C0FFFFFF"
                    : "#65FFFFFF
"
            }


            contentItem: Text {

                text: downButton.text

                color: "#F5FFFFFF"

                font.pixelSize: 13
                font.bold: true

                horizontalAlignment:
                    Text.AlignHCenter

                verticalAlignment:
                    Text.AlignVCenter
            }


            onClicked: {

                console.log(
                    "CUSTOM GIMBAL: DOWN BUTTON"
                )

                root.buttonStep(
                    0,
                    -1
                )
            }
        }


        // =====================================================
        // LEFT BUTTON
        // =====================================================

        RoundButton {
            id: leftButton

            width: 32
            height: 32

            anchors.verticalCenter:
                circle.verticalCenter

            anchors.right:
                circle.left

            anchors.rightMargin: -9

            text: "◀"

            z: 10


            background: Rectangle {

                radius: width / 2

                color:
                    leftButton.pressed
                    ? "#55FFFFFF"
                    : "#25FFFFFF"

                border.width: 1

                border.color:
                    leftButton.pressed
                    ? "#C0FFFFFF"
                    : "#65FFFFFF"
            }


            contentItem: Text {

                text: leftButton.text

                color: "#F5FFFFFF"

                font.pixelSize: 13
                font.bold: true

                horizontalAlignment:
                    Text.AlignHCenter

                verticalAlignment:
                    Text.AlignVCenter
            }


            onClicked: {

                console.log(
                    "CUSTOM GIMBAL: LEFT BUTTON"
                )

                root.buttonStep(
                    -1,
                    0
                )
            }
        }


        // =====================================================
        // RIGHT BUTTON
        // =====================================================

        RoundButton {
            id: rightButton

            width: 32
            height: 32

            anchors.verticalCenter:
                circle.verticalCenter

            anchors.left:
                circle.right

            anchors.leftMargin: -9

            text: "▶"

            z: 10


            background: Rectangle {

                radius: width / 2

                color:
                    rightButton.pressed
                    ? "#55FFFFFF"
                    : "#25FFFFFF"

                border.width: 1

                border.color:
                    rightButton.pressed
                    ? "#C0FFFFFF"
                    : "#65FFFFFF"
            }


            contentItem: Text {

                text: rightButton.text

                color: "#F5FFFFFF"

                font.pixelSize: 13
                font.bold: true

                horizontalAlignment:
                    Text.AlignHCenter

                verticalAlignment:
                    Text.AlignVCenter
            }


            onClicked: {

                console.log(
                    "CUSTOM GIMBAL: RIGHT BUTTON"
                )

                root.buttonStep(
                    1,
                    0
                )
            }
        }
    }
}
