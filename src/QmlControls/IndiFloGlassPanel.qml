import QtQuick
import QGroundControl

Rectangle {
    id: root

    property alias content: contentItem

    radius: 14
    color: "transparent"

    border.width: 1
    border.color: "#55FFFFFF"

    clip: true

    // =========================================================
    // LIQUID GLASS BACKGROUND
    // =========================================================

    Rectangle {
        anchors.fill: parent

        radius: parent.radius

        color: "transparent"

        gradient: Gradient {
            orientation: Gradient.Vertical

            GradientStop {
                position: 0.0
                color: "#20FFFFFF"
            }

            GradientStop {
                position: 0.35
                color: "#0DFFFFFF"
            }

            GradientStop {
                position: 0.70
                color: "#08FFFFFF"
            }

            GradientStop {
                position: 1.0
                color: "#15FFFFFF"
            }
        }
    }

    // =========================================================
    // TOP GLASS REFLECTION
    // =========================================================

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: 1

        color: "#80FFFFFF"

        opacity: 0.45
    }

    // =========================================================
    // CONTENT
    // =========================================================

    Item {
        id: contentItem

        anchors.fill: parent
    }
}
