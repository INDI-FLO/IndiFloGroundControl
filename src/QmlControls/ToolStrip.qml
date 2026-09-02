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

import QGroundControl
import QGroundControl.ScreenTools
import QGroundControl.Palette
import QGroundControl.Controls

Rectangle {
    id: _root


    //======================================================================
    // GLASS TOOLBAR
    //======================================================================

    width: ScreenTools.defaultFontPixelWidth * 8

    height: Math.min(
        maxHeight,
        toolStripColumn.height +
        (flickable.anchors.margins * 2)
    )

    radius: ScreenTools.defaultFontPixelWidth / 2


    /*
     * Transparent glass background.
     */
    gradient: Gradient {

        GradientStop {
            position: 0.0
            color: "#70101820"
        }

        GradientStop {
            position: 0.5
            color: "#55101820"
        }

        GradientStop {
            position: 1.0
            color: "#42101820"
        }
    }


    /*
     * Main glass border.
     */
    border.width: 1

    border.color: "#60FFFFFF"


    /*
     * Existing API
     */
    property alias model: repeater.model

    property real maxHeight

    property alias title: titleLabel.text

    property var fontSize:
        ScreenTools.smallFontPointSize


    /*
     * Existing drop panel access.
     */
    property var _dropPanel: dropPanel


    //======================================================================
    // GLASS HIGHLIGHT
    //======================================================================

    Rectangle {

        id: topGlassHighlight

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: 2

        height: 1

        radius: 1

        color: "#55FFFFFF"

        z: 10
    }


    //======================================================================
    // INNER BORDER
    //======================================================================

    Rectangle {

        id: innerGlassBorder

        anchors.fill: parent

        anchors.margins: 1

        radius:
            Math.max(
                0,
                _root.radius - 1
            )

        color: "transparent"

        border.width: 1

        border.color: "#18FFFFFF"

        z: 10
    }


    //======================================================================
    // EXISTING FUNCTION
    //======================================================================

    function simulateClick(buttonIndex) {

        buttonIndex = buttonIndex + 1

        var button =
            toolStripColumn.children[buttonIndex]

        if (button.checkable) {
            button.checked = !button.checked
        }

        button.clicked()
    }


    signal dropped(int index)


    //======================================================================
    // BLOCK MAP INPUT
    //======================================================================

    DeadMouseArea {
        anchors.fill: parent
    }


    //======================================================================
    // TOOL STRIP SCROLL AREA
    //======================================================================

    QGCFlickable {

        id: flickable

        anchors.margins:
            ScreenTools.defaultFontPixelWidth * 0.4

        anchors.top: parent.top

        anchors.left: parent.left

        anchors.right: parent.right

        height:
            parent.height -
            anchors.margins * 2

        contentHeight:
            toolStripColumn.height

        flickableDirection:
            Flickable.VerticalFlick

        clip: true


        //==============================================================
        // TOOL COLUMN
        //==============================================================

        Column {

            id: toolStripColumn

            anchors.left: parent.left

            anchors.right: parent.right

            spacing:
                ScreenTools.defaultFontPixelWidth * 0.25


            //==========================================================
            // TITLE
            //==========================================================

            QGCLabel {

                id: titleLabel

                anchors.left: parent.left

                anchors.right: parent.right

                horizontalAlignment:
                    Text.AlignHCenter

                font.pointSize:
                    ScreenTools.smallFontPointSize

                color: "#FFFFFF"

                visible:
                    title != ""
            }


            //==========================================================
            // ACTION BUTTONS
            //==========================================================

            Repeater {

                id: repeater


                ToolStripHoverButton {

                    id: buttonTemplate

                    anchors.left:
                        toolStripColumn.left

                    anchors.right:
                        toolStripColumn.right

                    height: width

                    radius:
                        ScreenTools.defaultFontPixelWidth / 2

                    fontPointSize:
                        _root.fontSize

                    toolStripAction:
                        modelData

                    dropPanel:
                        _dropPanel


                    onDropped: (index) => {

                        _root.dropped(index)
                    }


                    onCheckedChanged: {

                        /*
                         * Exclusive check state.
                         */
                        if (checked) {

                            for (
                                var i = 0;
                                i < repeater.count;
                                i++
                            ) {

                                if (i != index) {

                                    var button =
                                        repeater.itemAt(i)

                                    if (button &&
                                        button.checked) {

                                        button.checked = false
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }


    //======================================================================
    // DROP PANEL
    //======================================================================

    ToolStripDropPanel {

        id: dropPanel

        toolStrip: _root
    }
}
