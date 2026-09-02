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

import QGroundControl.ScreenTools
import QGroundControl.Palette


Button {

    id: control


    //======================================================================
    // BASIC BUTTON SETTINGS
    //======================================================================

    width:
        contentLayoutItem.contentWidth +
        (contentMargins * 2)

    height: width

    hoverEnabled:
        !ScreenTools.isMobile

    enabled:
        toolStripAction.enabled

    visible:
        toolStripAction.visible


    imageSource:
        toolStripAction.showAlternateIcon
        ? modelData.alternateIconSource
        : modelData.iconSource


    text:
        toolStripAction.text


    checked:
        toolStripAction.checked


    checkable:
        toolStripAction.dropPanelComponent ||
        modelData.checkable


    property var toolStripAction:
        undefined

    property var dropPanel:
        undefined

    property alias radius:
        buttonBkRect.radius

    property alias fontPointSize:
        innerText.font.pointSize

    property alias imageSource:
        innerImage.source

    property alias contentWidth:
        innerText.contentWidth

    property bool forceImageScale11:
        false

    property real imageScale:
        forceImageScale11 && (text == "")
        ? 0.8
        : 0.6

    property real contentMargins:
        innerText.height * 0.1


    //======================================================================
    // GLASS COLORS
    //======================================================================

    property color _currentContentColor:

        (checked || pressed)
        ? "#FFFFFF"
        : "#FFFFFF"


    property color _currentContentColorSecondary:

        (checked || pressed)
        ? "#FFFFFF"
        : "#CFFFFFFF"


    signal dropped(int index)


    //======================================================================
    // ACTION STATE
    //======================================================================

    onCheckedChanged:

        toolStripAction.checked = checked


    onClicked: {

        if (mainWindow.allowViewSwitch()) {

            dropPanel.hide()


            if (!toolStripAction.dropPanelComponent) {

                toolStripAction.triggered(this)

            } else if (checked) {

                var panelEdgeTopPoint =
                    mapToItem(
                        _root,
                        width,
                        0
                    )

                dropPanel.show(
                    panelEdgeTopPoint,
                    toolStripAction.dropPanelComponent,
                    this
                )

                checked = true

                control.dropped(index)
            }

        } else if (checkable) {

            checked = !checked
        }
    }


    //======================================================================
    // PALETTE
    //======================================================================

    QGCPalette {

        id: qgcPal

        colorGroupEnabled:
            control.enabled
    }


    //======================================================================
    // CONTENT
    //======================================================================

    contentItem: Item {

        id: contentLayoutItem

        anchors.fill: parent

        anchors.margins:
            contentMargins


        Column {

            anchors.centerIn:
                parent

            spacing:
                contentMargins * 2


            //==============================================================
            // FULL COLOR ICON
            //==============================================================

            Image {

                id: innerImageColorful

                height:
                    contentLayoutItem.height *
                    imageScale

                width:
                    contentLayoutItem.width *
                    imageScale

                smooth: true

                mipmap: true

                fillMode:
                    Image.PreserveAspectFit

                antialiasing: true

                sourceSize.height:
                    height

                sourceSize.width:
                    width

                anchors.horizontalCenter:
                    parent.horizontalCenter

                source:
                    control.imageSource

                visible:
                    source != "" &&
                    modelData.fullColorIcon
            }


            //==============================================================
            // NORMAL ICON
            //==============================================================

            QGCColoredImage {

                id: innerImage

                height:
                    contentLayoutItem.height *
                    imageScale

                width:
                    contentLayoutItem.width *
                    imageScale

                smooth: true

                mipmap: true

                color:
                    _currentContentColor

                fillMode:
                    Image.PreserveAspectFit

                antialiasing: true

                sourceSize.height:
                    height

                sourceSize.width:
                    width

                anchors.horizontalCenter:
                    parent.horizontalCenter

                visible:
                    source != "" &&
                    !modelData.fullColorIcon


                //==========================================================
                // SECOND COLOR ICON
                //==========================================================

                QGCColoredImage {

                    id: innerImageSecondColor

                    source:
                        modelData.alternateIconSource

                    height:
                        contentLayoutItem.height *
                        imageScale

                    width:
                        contentLayoutItem.width *
                        imageScale

                    smooth: true

                    mipmap: true

                    color:
                        _currentContentColorSecondary

                    fillMode:
                        Image.PreserveAspectFit

                    antialiasing: true

                    sourceSize.height:
                        height

                    sourceSize.width:
                        width

                    anchors.horizontalCenter:
                        parent.horizontalCenter

                    visible:
                        source != "" &&
                        modelData.biColorIcon
                }
            }


            //==============================================================
            // BUTTON TEXT
            //==============================================================

            QGCLabel {

                id: innerText

                text:
                    control.text

                color:
                    _currentContentColor

                anchors.horizontalCenter:
                    parent.horizontalCenter

                font.bold:
                    !innerImage.visible &&
                    !innerImageColorful.visible

                opacity:
                    !innerImage.visible
                    ? 0.90
                    : 1.0
            }
        }
    }


    //======================================================================
    // GLASS BUTTON BACKGROUND
    //======================================================================

    background: Rectangle {

        id: buttonBkRect

        anchors.fill: parent

        radius:
            ScreenTools.defaultFontPixelWidth / 2


        /*
         * Normal glass
         */
        color:

            control.checked
            ? "#653A76C9"

            : control.pressed
            ? "#7065AFFF"

            : control.hovered
            ? "#501FFFFFFF"

            : "#18000000"


        /*
         * Glass border
         */
        border.width: 1

        border.color:

            control.checked
            ? "#90FFFFFF"

            : control.pressed
            ? "#B0FFFFFF"

            : control.hovered
            ? "#65FFFFFF"

            : "#30FFFFFF"


        /*
         * Smooth transitions.
         */
        Behavior on color {

            ColorAnimation {
                duration: 120
            }
        }


        Behavior on border.color {

            ColorAnimation {
                duration: 120
            }
        }


        //==============================================================
        // INNER GLASS BORDER
        //==============================================================

        Rectangle {

            anchors.fill: parent

            anchors.margins: 1

            radius:
                Math.max(
                    0,
                    buttonBkRect.radius - 1
                )

            color: "transparent"

            border.width: 1

            border.color:
                "#18FFFFFF"
        }


        //==============================================================
        // TOP REFLECTION
        //==============================================================

        Rectangle {

            anchors.left: parent.left

            anchors.right: parent.right

            anchors.top: parent.top

            anchors.leftMargin: 3

            anchors.rightMargin: 3

            anchors.topMargin: 2

            height: 1

            radius: 1

            color: "#45FFFFFF"
        }
    }
}
