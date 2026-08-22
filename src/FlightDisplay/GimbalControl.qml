import QtQuick
import QtQuick.Controls
import QGroundControl

Rectangle {
    id: root

    // =========================================================
    // COMPACT GIMBAL PANEL
    // =========================================================

    width: 163
    height: 215

    color: "#88000000"
    radius: 18

    border.width: 1
    border.color: "#777777"

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
    // BUTTON STEP SETTINGS
    // =========================================================

    // Requested movement for every button click.
    property real buttonStepDegrees: 5.0

    // Duration for one discrete button command.
    //
    // This is intentionally short. The actual angular response
    // depends on the gimbal controller's configured rate.
    property int buttonCommandDuration: 150

    property bool buttonCommandActive: false

    // =========================================================
    // GIMBAL CONTROLLER
    // =========================================================

    function gimbalController() {

        if (!_activeVehicle) {
            console.log("CUSTOM GIMBAL: no active vehicle")
            return null
        }

        if (!_activeVehicle.gimbalController) {
            console.log("CUSTOM GIMBAL: no gimbal controller")
            return null
        }

        return _activeVehicle.gimbalController
    }

    // =========================================================
    // NORMAL JOYSTICK COMMAND
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
            false,  // clickAndPoint
            true,   // clickAndDrag
            true,   // rateControl
            false,  // retract
            false,  // neutral
            false   // yawlock
        )
    }

    // =========================================================
    // STOP JOYSTICK COMMAND
    // =========================================================

    function stopGimbal() {

        var controller = gimbalController()

        if (!controller) {
            return
        }

        controller.gimbalOnScreenControl(
            0,
            0,
            false,  // clickAndPoint
            true,   // clickAndDrag
            true,   // rateControl
            false,  // retract
            false,  // neutral
            false   // yawlock
        )
    }

    // =========================================================
    // DISCRETE 5 DEGREE BUTTON COMMAND
    // =========================================================
    //
    // direction:
    //
    //   +1 = right / up
    //   -1 = left / down
    //
    // Because the current QGC interface is rate based, a button
    // click is implemented as a short rate command followed by
    // a stop command.
    //
    // buttonStepDegrees is kept explicit here so the requested
    // 5-degree step is easy to change later.
    // =========================================================

    function buttonStep(panDirection, tiltDirection) {

        if (buttonCommandActive) {
            return
        }

        var controller = gimbalController()

        if (!controller) {
            return
        }

        buttonCommandActive = true

        console.log(
            "CUSTOM GIMBAL BUTTON STEP:",
            buttonStepDegrees,
            "degrees",
            "pan =", panDirection,
            "tilt =", tiltDirection
        )

        controller.gimbalOnScreenControl(
            panDirection,
            tiltDirection,
            false,  // clickAndPoint
            true,   // clickAndDrag
            true,   // rateControl
            false,  // retract
            false,  // neutral
            false   // yawlock
        )

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

            root.stopGimbal()

            root.buttonCommandActive = false

            console.log(
                "CUSTOM GIMBAL BUTTON STEP COMPLETE:",
                root.buttonStepDegrees,
                "degrees"
            )
        }
    }

    // =========================================================
    // JOYSTICK MOVEMENT
    // =========================================================

    function moveJoystick(mouseX, mouseY) {

        var centerX = circle.width / 2
        var centerY = circle.height / 2

        var dx = mouseX - centerX
        var dy = mouseY - centerY

        var distance = Math.sqrt(
            dx * dx +
            dy * dy
        )

        if (distance > root.stickDistance && distance > 0) {

            dx =
                dx / distance *
                root.stickDistance

            dy =
                dy / distance *
                root.stickDistance
        }

        root.stickX = dx
        root.stickY = dy

        // =====================================================
        // NORMAL JOYSTICK COMMAND
        // =====================================================

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
    // TITLE
    // =========================================================

    Text {
        id: title

        text: qsTr("GIMBAL CONTROL")

        color: "white"

        font.pixelSize: 12
        font.bold: true

        anchors.top: parent.top
        anchors.topMargin: 7

        anchors.horizontalCenter:
            parent.horizontalCenter
    }

    // =========================================================
    // GIMBAL PAD
    // =========================================================

    Item {
        id: gimbalPad

        width: 145
        height: 145

        anchors.horizontalCenter:
            parent.horizontalCenter

        anchors.top:
            title.bottom

        anchors.topMargin: 28

        // =====================================================
        // OUTER JOYSTICK CIRCLE
        // =====================================================

        Rectangle {
            id: circle

            width: 125
            height: 125

            anchors.centerIn: parent

            radius: width / 2

            color: "#22000000"

            border.width: 2
            border.color: "#cccccc"

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

                onPositionChanged: function(mouse) {

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

            width: 38
            height: 38

            anchors.centerIn: circle

            radius: width / 2

            color: "#4488ff"

            border.width: 2
            border.color: "white"

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
        }

        // =====================================================
        // UP BUTTON
        // =====================================================

        RoundButton {
            id: upButton

            width: 34
            height: 34

            anchors.horizontalCenter:
                circle.horizontalCenter

            anchors.bottom:
                circle.top

            anchors.bottomMargin: -10

            text: "▲"

            z: 10

            background: Rectangle {

                radius: width / 2

                color:
                    upButton.pressed
                    ? "#6699ff"
                    : "#555555"

                border.width: 1
                border.color: "#dddddd"
            }

            contentItem: Text {

                text: upButton.text

                color: "white"

                font.pixelSize: 15

                horizontalAlignment:
                    Text.AlignHCenter

                verticalAlignment:
                    Text.AlignVCenter
            }

            onClicked: {

                root.joystickDragging = false

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

            width: 34
            height: 34

            anchors.horizontalCenter:
                circle.horizontalCenter

            anchors.top:
                circle.bottom

            anchors.topMargin: -10

            text: "▼"

            z: 10

            background: Rectangle {

                radius: width / 2

                color:
                    downButton.pressed
                    ? "#6699ff"
                    : "#555555"

                border.width: 1
                border.color: "#dddddd"
            }

            contentItem: Text {

                text: downButton.text

                color: "white"

                font.pixelSize: 15

                horizontalAlignment:
                    Text.AlignHCenter

                verticalAlignment:
                    Text.AlignVCenter
            }

            onClicked: {

                root.joystickDragging = false

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

            width: 34
            height: 34

            anchors.verticalCenter:
                circle.verticalCenter

            anchors.right:
                circle.left

            anchors.rightMargin: -10

            text: "◀"

            z: 10

            background: Rectangle {

                radius: width / 2

                color:
                    leftButton.pressed
                    ? "#6699ff"
                    : "#555555"

                border.width: 1
                border.color: "#dddddd"
            }

            contentItem: Text {

                text: leftButton.text

                color: "white"

                font.pixelSize: 15

                horizontalAlignment:
                    Text.AlignHCenter

                verticalAlignment:
                    Text.AlignVCenter
            }

            onClicked: {

                root.joystickDragging = false

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

            width: 34
            height: 34

            anchors.verticalCenter:
                circle.verticalCenter

            anchors.left:
                circle.right

            anchors.leftMargin: -10

            text: "▶"

            z: 10

            background: Rectangle {

                radius: width / 2

                color:
                    rightButton.pressed
                    ? "#6699ff"
                    : "#555555"

                border.width: 1
                border.color: "#dddddd"
            }

            contentItem: Text {

                text: rightButton.text

                color: "white"

                font.pixelSize: 15

                horizontalAlignment:
                    Text.AlignHCenter

                verticalAlignment:
                    Text.AlignVCenter
            }

            onClicked: {

                root.joystickDragging = false

                root.buttonStep(
                    1,
                    0
                )
            }
        }
    }
}
