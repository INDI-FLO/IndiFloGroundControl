/****************************************************************************
 *
 * (c) 2009-2025 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * IndiFlo Ground Control
 *
 * Reusable Glassmorphism Panel
 *
 ****************************************************************************/

import QtQuick
import QtQuick.Effects

import QGroundControl

Rectangle {
    id: root

    /*
     * Main glass properties
     */
    property color glassColor: "#101820"
    property real glassOpacity: 0.38

    property color glassBorderColor: "#FFFFFF"
    property real glassBorderOpacity: 0.32

    property real glassRadius: 16
    property real glassBorderWidth: 1

    /*
     * Optional visual effects
     */
    property bool glassShadowEnabled: true
    property bool glassHighlightEnabled: true

    /*
     * Converts the requested RGB color into a translucent color.
     */
    color: Qt.rgba(
        Qt.color(glassColor).r,
        Qt.color(glassColor).g,
        Qt.color(glassColor).b,
        glassOpacity
    )

    radius: glassRadius

    border.width: glassBorderWidth

    border.color: Qt.rgba(
        Qt.color(glassBorderColor).r,
        Qt.color(glassBorderColor).g,
        Qt.color(glassBorderColor).b,
        glassBorderOpacity
    )

    /*
     * Keep the glass above the map and other controls.
     */
    clip: true

    /*
     * Subtle shadow.
     */
    layer.enabled: glassShadowEnabled

    layer.effect: MultiEffect {
        shadowEnabled: true
        shadowBlur: 0.45
        shadowOpacity: 0.28
        shadowHorizontalOffset: 0
        shadowVerticalOffset: 3
    }

    /*
     * Inner glass highlight.
     */
    Rectangle {
        id: innerBorder

        anchors.fill: parent
        anchors.margins: 1

        radius: Math.max(0, root.glassRadius - 1)

        color: "transparent"

        border.width: 1
        border.color: root.glassHighlightEnabled
                      ? "#22FFFFFF"
                      : "transparent"

        visible: root.glassHighlightEnabled
    }

    /*
     * Top reflective highlight.
     */
    Rectangle {
        id: topHighlight

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: 2

        height: 1

        radius: 1

        color: root.glassHighlightEnabled
               ? "#35FFFFFF"
               : "transparent"

        visible: root.glassHighlightEnabled
    }

    /*
     * Very subtle lower shade.
     */
    Rectangle {
        id: bottomShade

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        height: Math.min(14, parent.height * 0.12)

        radius: root.glassRadius

        color: "#10000000"

        opacity: root.glassHighlightEnabled ? 1.0 : 0.0
    }
}
