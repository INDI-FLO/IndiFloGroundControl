import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QGroundControl
import QGroundControl.Controls
import QGroundControl.Palette
import QGroundControl.ScreenTools

Rectangle {
    id: root

    // =========================================================
    // COMPACT GIMBAL PANEL
    // =========================================================

    width: 165
    height: 215

    radius: 14

    color: "#70101822"

    border.width: 1
    border.color: "#70FFFFFF"

    clip: true

    // =========================================================
    // ACTIVE VEHICLE
    // =========================================================

    property var _activeVehicle:
        QGroundControl.multiVehicleManager.activeVehicle

    // =========================================================
    // JOYSTICK SETTINGS
    // =========================================================

    // Continuous joystick speed.
    // This is NOT the 5-degree button movement.
    property real commandSpeed: 10.0

    property real stickX: 0
    property real stickY: 0

    property real stickDistance: 30

    // =========================================================
    // BUTTON STEP
    // ONE CLICK = 5 DEGREES
    // =========================================================

    property real buttonStep: 5.0

    // =========================================================
    // GIMBAL COMMAND
    // =========================================================

    function gimbalController() {
        if (!_activeVehicle) {
            return null
        }

        return _activeVehicle.gimbalController
    }

    function moveGimbal(pan, tilt) {
        if (!_activeVehicle) {
            return
        }

        _activeVehicle.sendGimbalCommand(pan, tilt)
    }

    // =========================================================
    // STOP CONTINUOUS JOYSTICK COMMAND
    // =========================================================

    function stopGimbal() {
        moveGimbal(0, 0)
    }

    // =========================================================
    // 5 DEGREE BUTTON COMMANDS
    // =========================================================

    function movePanStep(direction) {
        if (!_activeVehicle) {
            return
        }

        // direction:
        // -1 = left
        // +1 = right

        moveGimbal(direction * buttonStep, 0)
    }

    function moveTiltStep(direction) {
        if (!_activeVehicle) {
            return
        }

        // direction:
        // -1 = up
        // +1 = down

        moveGimbal(0, direction * buttonStep)
    }

    // =========================================================
    // GLASS HIGHLIGHT
    // =========================================================

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: parent.height * 0.28

        radius: root.radius

        color: "#FFFFFF"

        opacity: 0.035

        z: 0
    }

    // =========================================================
    // TITLE
    // =========================================================

    Text {
        id: titleText

        anchors.top: parent.top
        anchors.topMargin: 8

        anchors.horizontalCenter: parent.horizontalCenter

        text: qsTr("GIMBAL CONTROL")

        color: "#FFFFFF"

        font.pixelSize: 16
        font.bold: true

        z: 10
    }

    // =========================================================
    // GIMBAL JOYSTICK AREA
    // =========================================================

    Item {
        id: gimbalPad

        width: 145
        height: 145

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: titleText.bottom
        anchors.topMargin: 5

        z: 5

        // =====================================================
        // OUTER JOYSTICK CIRCLE
        // =====================================================

        Rectangle {
            id: joystickCircle

            width: 125
            height: 125

            anchors.centerIn: parent

            radius: width / 2

            color: "#12000000"

            border.width: 2

            border.color: "#C0FFFFFF"
        }

        // =====================================================
        // CENTER JOYSTICK
        // =====================================================

        Rectangle {
            id: centerStick

            width: 45
            height: 45

            x: (gimbalPad.width - width) / 2 + root.stickX
            y: (gimbalPad.height - height) / 2 + root.stickY

            radius: width / 2

            color: "#4085F5"

            border.width: 2

            border.color: "#E8FFFFFF"

            z: 20

            Behavior on x {
                NumberAnimation {
                    duration: 80
                }
            }

            Behavior on y {
                NumberAnimation {
                    duration: 80
                }
            }

            // =================================================
            // JOYSTICK TOUCH AREA
            // =================================================

            MouseArea {
                anchors.fill: parent

                drag.target: parent

                drag.minimumX:
                    (gimbalPad.width - centerStick.width) / 2
                    - root.stickDistance

                drag.maximumX:
                    (gimbalPad.width - centerStick.width) / 2
                    + root.stickDistance

                drag.minimumY:
                    (gimbalPad.height - centerStick.height) / 2
                    - root.stickDistance

                drag.maximumY:
                    (gimbalPad.height - centerStick.height) / 2
                    + root.stickDistance

                onPositionChanged: {

                    var centerX =
                        (gimbalPad.width - centerStick.width) / 2

                    var centerY =
                        (gimbalPad.height - centerStick.height) / 2

                    root.stickX =
                        centerStick.x - centerX

                    root.stickY =
                        centerStick.y - centerY

                    // =========================================
                    // NORMAL CONTINUOUS JOYSTICK OPERATION
                    // =========================================

                    var pan =
                        (root.stickX / root.stickDistance)
                        * root.commandSpeed

                    var tilt =
                        -(root.stickY / root.stickDistance)
                        * root.commandSpeed

                    root.moveGimbal(pan, tilt)
                }

                onReleased: {

                    root.stickX = 0
                    root.stickY = 0

                    centerStick.x =
                        (gimbalPad.width - centerStick.width) / 2

                    centerStick.y =
                        (gimbalPad.height - centerStick.height) / 2

                    root.stopGimbal()
                }
            }
        }

        // =====================================================
        // UP BUTTON
        // ONE CLICK = 5 DEGREE TILT
        // =====================================================

        RoundButton {
            id: upButton

            width: 42
            height: 42

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top

            text: "▲"

            font.pixelSize: 17

            contentItem: Text {
                text: upButton.text

                color: "#FFFFFF"

                font.pixelSize: 17
                font.bold: true

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {

                radius: width / 2

                color:
                    upButton.pressed
                        ? "#70707070"
                        : "#50505050"

                border.width: 1

                border.color: "#D0FFFFFF"
            }

            onClicked: {
                root.moveTiltStep(-1)
            }
        }

        // =====================================================
        // DOWN BUTTON
        // ONE CLICK = 5 DEGREE TILT
        // =====================================================

        RoundButton {
            id: downButton

            width: 42
            height: 42

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            text: "▼"

            font.pixelSize: 17

            contentItem: Text {
                text: downButton.text

                color: "#FFFFFF"

                font.pixelSize: 17
                font.bold: true

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {

                radius: width / 2

                color:
                    downButton.pressed
                        ? "#70707070"
                        : "#50505050"

                border.width: 1

                border.color: "#D0FFFFFF"
            }

            onClicked: {
                root.moveTiltStep(1)
            }
        }

        // =====================================================
        // LEFT BUTTON
        // ONE CLICK = 5 DEGREE PAN
        // =====================================================

        RoundButton {
            id: leftButton

            width: 42
            height: 42

            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            text: "◀"

            font.pixelSize: 17

            contentItem: Text {
                text: leftButton.text

                color: "#FFFFFF"

                font.pixelSize: 17
                font.bold: true

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {

                radius: width / 2

                color:
                    leftButton.pressed
                        ? "#70707070"
                        : "#50505050"

                border.width: 1

                border.color: "#D0FFFFFF"
            }

            onClicked: {
                root.movePanStep(-1)
            }
        }

        // =====================================================
        // RIGHT BUTTON
        // ONE CLICK = 5 DEGREE PAN
        // =====================================================

        RoundButton {
            id: rightButton

            width: 42
            height: 42

            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            text: "▶"

            font.pixelSize: 17

            contentItem: Text {
                text: rightButton.text

                color: "#FFFFFF"

                font.pixelSize: 17
                font.bold: true

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {

                radius: width / 2

                color:
                    rightButton.pressed
                        ? "#70707070"
                        : "#50505050"

                border.width: 1

                border.color: "#D0FFFFFF"
            }

            onClicked: {
                root.movePanStep(1)
            }
        }
    }

    // =========================================================
    // BOTTOM GLASS HIGHLIGHT
    // =========================================================

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        height: 1

        color: "#80FFFFFF"

        opacity: 0.25

        z: 50
    }
}
