import QtQuick

Rectangle {
    id: root

    property color glassColor: "#66111C2A"
    property color glassBorderColor: "#80FFFFFF"
    property real glassRadius: 14
    property real glassOpacity: 1.0

    radius: glassRadius

    color: Qt.rgba(
        Qt.color(root.glassColor).r,
        Qt.color(root.glassColor).g,
        Qt.color(root.glassColor).b,
        Qt.color(root.glassColor).a * root.glassOpacity
    )

    border.width: 1
    border.color: glassBorderColor

    clip: true

    // ---------------------------------------------------------
    // Soft glass highlight
    // ---------------------------------------------------------

    Rectangle {
        anchors.fill: parent

        radius: parent.radius

        color: "transparent"

        border.width: 1
        border.color: "#35FFFFFF"

        opacity: 0.8
    }

    // ---------------------------------------------------------
    // Top glass reflection
    // ---------------------------------------------------------

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: parent.height * 0.38

        radius: parent.radius

        gradient: Gradient {

            GradientStop {
                position: 0.0
                color: "#35FFFFFF"
            }

            GradientStop {
                position: 0.45
                color: "#12FFFFFF"
            }

            GradientStop {
                position: 1.0
                color: "#00FFFFFF"
            }
        }

        opacity: 0.65
    }

    // ---------------------------------------------------------
    // Bottom dark glass layer
    // ---------------------------------------------------------

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        height: parent.height * 0.45

        radius: parent.radius

        color: "#18000000"
    }
}
