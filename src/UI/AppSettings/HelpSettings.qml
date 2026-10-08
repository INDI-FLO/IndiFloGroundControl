/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import QGroundControl
import QGroundControl.Controls
import QGroundControl.Palette
import QGroundControl.ScreenTools

SettingsPage {
    id: root

    QGCPalette {
        id: qgcPal
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: ScreenTools.defaultFontPixelWidth
        spacing: ScreenTools.defaultFontPixelHeight

        GridLayout {
            id: grid
            columns: 2
            columnSpacing: ScreenTools.defaultFontPixelWidth * 2
            rowSpacing: ScreenTools.defaultFontPixelHeight

            // =========================================================
            // IndiFlo Ground Control User Guide
            // =========================================================

            QGCLabel {
                text: qsTr("IndiFlo Ground Control User Guide")
            }

            Rectangle {
                Layout.fillWidth: true
                height: ScreenTools.defaultFontPixelHeight * 1.5
                color: "transparent"

                QGCLabel {
                    anchors.fill: parent
                    text: qsTr("Open IndiFlo User Guide")
                    color: qgcPal.text
                    verticalAlignment: Text.AlignVCenter

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            Qt.openUrlExternally(
                                "https://github.com/INDI-FLO/IndiFloGroundControl/blob/v1/docs/USER_GUIDE.md"
                            )
                        }
                    }
                }
            }

            // =========================================================
            // IndiFlo PX4 Guide
            // =========================================================

            QGCLabel {
                text: qsTr("IndiFlo PX4 Guide")
            }

            Rectangle {
                Layout.fillWidth: true
                height: ScreenTools.defaultFontPixelHeight * 1.5
                color: "transparent"

                QGCLabel {
                    anchors.fill: parent
                    text: qsTr("Open IndiFlo PX4 Guide")
                    color: qgcPal.text
                    verticalAlignment: Text.AlignVCenter

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            Qt.openUrlExternally(
                                "https://github.com/INDI-FLO/IndiFloGroundControl/blob/v1/docs/PX4_GUIDE.md"
                            )
                        }
                    }
                }
            }

            // =========================================================
            // IndiFlo Gazebo Guide
            // =========================================================

            QGCLabel {
                text: qsTr("IndiFlo Gazebo Guide")
            }

            Rectangle {
                Layout.fillWidth: true
                height: ScreenTools.defaultFontPixelHeight * 1.5
                color: "transparent"

                QGCLabel {
                    anchors.fill: parent
                    text: qsTr("Open IndiFlo Gazebo Guide")
                    color: qgcPal.text
                    verticalAlignment: Text.AlignVCenter

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            Qt.openUrlExternally(
                                "https://github.com/INDI-FLO/IndiFloGroundControl/blob/v1/docs/GAZEBO_GUIDE.md"
                            )
                        }
                    }
                }
            }

            // =========================================================
            // IndiFlo Documentation
            // =========================================================

            QGCLabel {
                text: qsTr("IndiFlo Documentation")
            }

            Rectangle {
                Layout.fillWidth: true
                height: ScreenTools.defaultFontPixelHeight * 1.5
                color: "transparent"

                QGCLabel {
                    anchors.fill: parent
                    text: qsTr("Open IndiFlo Documentation")
                    color: qgcPal.text
                    verticalAlignment: Text.AlignVCenter

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            Qt.openUrlExternally(
                                "https://github.com/INDI-FLO/IndiFloGroundControl/blob/v1/docs/index.md"
                            )
                        }
                    }
                }
            }
        }
    }
}
