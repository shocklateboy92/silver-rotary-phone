import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    visible: true
    width: Math.min(Screen.desktopAvailableWidth, Screen.width)
    height: Math.min(Screen.desktopAvailableHeight, Screen.height)
    title: qsTr("Hello World")
    color: "red"

    Rectangle {
        property int effectiveWidth: parent.width / 2

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }

        width: effectiveWidth
        height: effectiveWidth

        radius: effectiveWidth / 2
        border.color: "white"
        border.width: 12
        color: "red"
    }

    Text {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        width: parent.width / 2

        text: "Unfinished Tasks"
        font.pixelSize: 100
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
    }
}
