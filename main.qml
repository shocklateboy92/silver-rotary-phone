import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    visible: true
    width: Math.min(Screen.desktopAvailableWidth, Screen.width)
    height: Math.min(Screen.desktopAvailableHeight, Screen.height)
    title: qsTr("Hello World")
    color: "red"

    Rectangle {
        property int effectiveWidth: Math.min(parent.width, parent.height)

        anchors.centerIn: parent

        width: effectiveWidth
        height: effectiveWidth

        radius: effectiveWidth / 2
        color: "red"
        border.color: "white"
        border.width: 12
    }
}
