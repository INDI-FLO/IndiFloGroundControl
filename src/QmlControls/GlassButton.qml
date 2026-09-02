/****************************************************************************
 *
 * IndiFlo Ground Control
 *
 * Glassmorphism Button
 *
 ****************************************************************************/

import QtQuick
import QtQuick.Controls

import QGroundControl

Item {
    id: root

    property string text: ""
    property string iconSource: ""

    property bool enabled: true
    property bool checked: false

    property real radius: 10

    signal clicked()

    implicitWidth: 52
    implicitHeight: 42

    opacity: enabled ? 1.0 : 0.45

    GlassPanel {
        id: background

        anchors.fill: parent

        glassColor: root.checked
                     ? "#3A76C9"
                     : "#101820"

        glassOpacity: root.checked
                      ? 0.42
                      : (mouseArea.containsMouse ? 0.44 : 0.30)

        glassBorderColor: "#FFFFFF"

        glassBorderOpacity: root.checked
                            ? 0.58
                            : (mouseArea.containsMouse ? 0.42 : 0.25)

        glassRadius: root.radius

        glassShadowEnabled: true
        glassHighlightEnabled: true
    }

    Row {
        anchors.centerIn: parent

        spacing: 5

        Image {
            id: icon

            width: root.iconSource !== "" ? 18 : 0
            height: root.iconSource !== "" ? 18 : 0

            source: root.iconSource

            fillMode: Image.PreserveAspectFit

            visible: root.iconSource !== ""
        }

        Text {
            text: root.text

            color: "#FFFFFF"

            font.pixelSize: 12
            font.weight: Font.DemiBold

            verticalAlignment: Text.AlignVCenter

            visible: root.text !== ""
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        enabled: root.enabled

        hoverEnabled: true

        cursorShape: Qt.PointingHandCursor

        onClicked: root.clicked()
    }

    Behavior on scale {
        NumberAnimation {
            duration: 100
        }
    }
}
