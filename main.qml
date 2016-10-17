import QtQuick 2.7
import QtQuick.Window 2.2

import "font-awesome-qml" as FontAwesomeQml
import "font-awesome-qml/controls" as FontAwesomeControls

Window {
    visible: true
    width: Math.min(Screen.desktopAvailableWidth, Screen.width)
    height: Math.min(Screen.desktopAvailableHeight, Screen.height)
    title: qsTr("Hello World")
    color: "red"

    FontAwesomeQml.FontAwesome {
        id: fa
        resource: "http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/fonts/fontawesome-webfont.ttf"
    }

    Rectangle {
        property int effectiveWidth: Math.min(parent.width, parent.height)

        anchors.centerIn: parent

        width: effectiveWidth
        height: effectiveWidth

        radius: effectiveWidth / 2
        color: "red"
        border.color: "white"
        border.width: 12

    Text {
        color: "white"
        font.pixelSize: parent.effectiveWidth * 0.9
        font.family: fa.family
        renderType: Text.NativeRendering
        text: fa.loaded ? fa.icons.fa_check : ""
    }
    }
}
