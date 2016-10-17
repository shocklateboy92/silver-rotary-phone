import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    color: "red"

    Rectangle {
        property int effectiveWidth: Math.min(parent.width, parent.height)
        anchors.centerIn: parent
        border.color: "white"
        border.width: 12
        color: "red"
        radius: effectiveWidth / 2
        width: effectiveWidth
        height: effectiveWidth
    }
}
