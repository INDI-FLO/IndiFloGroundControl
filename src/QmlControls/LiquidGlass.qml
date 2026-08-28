import QtQuick

Rectangle {
    id: root

    property real glassOpacity: 0.72
    property real borderOpacity: 0.32
    property real highlightOpacity: 0.22
    property real cornerRadius: 14

    radius: cornerRadius

    color: Qt.rgba(8 / 255, 25 / 255, 42 / 255, glassOpacity)

    border.width: 1
    border.color: Qt.rgba(210 / 255, 235 / 255, 255 / 255, borderOpacity)

    // Main glass gradient
    Rectangle {
        anchors.fill: parent
        radius: root.radius

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: Qt.rgba(255 / 255, 255 / 255, 255 / 255, 0.12)
            }

            GradientStop {
                position: 0.22
                color: Qt.rgba(80 / 255, 170 / 255, 230 / 255, 0.08)
            }

            GradientStop {
                position: 0.55
                color: Qt.rgba(5 / 255, 30 / 255, 50 / 255, 0.18)
            }

            GradientStop {
                position: 1.0
                color: Qt.rgba(0 / 255, 8 / 255, 18 / 255, 0.30)
            }
        }
    }

    // Top glass reflection
    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: Math.max(2, parent.height * 0.16)

        radius: root.radius

        color: Qt.rgba(
            255 / 255,
            255 / 255,
            255 / 255,
            root.highlightOpacity
        )

        opacity: 0.7
    }

    // Inner glass border
    Rectangle {
        anchors.fill: parent

        anchors.margins: 1

        radius: Math.max(0, root.radius - 1)

        color: "transparent"

        border.width: 1

        border.color: Qt.rgba(
            255 / 255,
            255 / 255,
            255 / 255,
            0.08
        )
    }
}
