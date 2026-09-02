/****************************************************************************
 *
 *   (c) 2009-2016 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick
import QtQuick.Layouts

import QGroundControl
import QGroundControl.ScreenTools
import QGroundControl.Vehicle
import QGroundControl.Controls
import QGroundControl.Palette

Item {
    id: control

    implicitWidth: mainLayout.width + (_toolsMargin * 2)
    implicitHeight: mainLayout.height + (_toolsMargin * 2)

    property real extraWidth: 0

    property alias factValueGrid: factValueGrid
    property alias settingsGroup: factValueGrid.settingsGroup
    property alias specificVehicleForCard: factValueGrid.specificVehicleForCard


    // ============================================================
    // GLASS BACKGROUND
    // ============================================================

    Rectangle {
        id: backgroundRect

        anchors.fill: parent

        radius: 14

        // Transparent glass
        color: "#30101820"

        border.width: 1
        border.color: "#40FFFFFF"
    }


    // ============================================================
    // GLASS INNER HIGHLIGHT
    // ============================================================

    Rectangle {
        anchors.fill: backgroundRect

        anchors.margins: 1

        radius: 13

        color: "transparent"

        border.width: 1
        border.color: "#18FFFFFF"
    }


    // ============================================================
    // TOP GLASS REFLECTION
    // ============================================================

    Rectangle {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        anchors.leftMargin: 10
        anchors.rightMargin: 10

        height: 1

        radius: 1

        color: "#70FFFFFF"

        opacity: 0.25
    }


    // ============================================================
    // TELEMETRY CONTENT
    // ============================================================

    ColumnLayout {
        id: mainLayout

        anchors.margins: _toolsMargin

        anchors.bottom: parent.bottom
        anchors.left: parent.left


        RowLayout {
            visible: factValueGrid.settingsUnlocked

            QGCColoredImage {
                source: "qrc:/InstrumentValueIcons/lock-open.svg"

                mipmap: true

                width: ScreenTools.minTouchPixels * 0.75
                height: width

                sourceSize.width: width

                color: qgcPal.text

                fillMode: Image.PreserveAspectFit

                QGCMouseArea {
                    anchors.fill: parent

                    onClicked: {
                        factValueGrid.settingsUnlocked = false
                    }
                }
            }
        }


        // ========================================================
        // EXISTING TELEMETRY GRID
        // ========================================================

        HorizontalFactValueGrid {
            id: factValueGrid
        }
    }


    // ============================================================
    // MOUSE AREA
    // ============================================================

    QGCMouseArea {
        id: mouseArea

        x: mainLayout.x
        y: mainLayout.y

        width: mainLayout.width
        height: mainLayout.height

        acceptedButtons:
            Qt.LeftButton | Qt.RightButton

        propagateComposedEvents:
            true

        visible:
            !factValueGrid.settingsUnlocked


        onClicked: (mouse) => {

            if (!ScreenTools.isMobile &&
                mouse.button === Qt.RightButton) {

                factValueGrid.settingsUnlocked = true

                mouse.accepted = true
            }
        }


        onPressAndHold: {

            factValueGrid.settingsUnlocked = true

            mouse.accepted = true
        }
    }
}
