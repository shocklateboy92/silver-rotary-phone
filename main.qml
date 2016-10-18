import QtQuick 2.7
import QtQuick.Window 2.2

import "font-awesome-qml" as FontAwesomeQml
import "font-awesome-qml/controls" as FontAwesomeControls

import "main.js" as Main
import "creds.js" as Creds

import "http://momentjs.com/downloads/moment.min.js" as Moment

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
            id: outputText
            anchors.centerIn: parent
            font.pixelSize: parent.effectiveWidth * 0.9

            renderType: Text.NativeRendering
            font.family: fa.family

            color: "white"
            text: ""
        }
    }

    Timer {
        interval: 30000
        repeat: true
        running: true

        function parseDate(date) {
            return Moment.moment(date, "ddd DD MMM YYYY HH:mm:ss ZZ");
        }

        triggeredOnStart: true;
        onTriggered: {
            const PROJECT_ID_ERRANDS = "133131598";
            const url = 'https://todoist.com/api/v7/sync?token={token}&sync_token=*&resource_types=["items"]';
            url = url.replace("{token}", Creds.AUTH_TOKEN);
            console.debug(url);

            var tonight = Moment.moment().endOf('day');

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = (function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        outputText.visible = true;
                        var response =  JSON.parse(xhr.responseText);
                        var hotTasks = response.items.filter(function(x) {
                            return x.project_id == PROJECT_ID_ERRANDS &&
                                    !x.checked &&
                                    parseDate(x.due_date_utc).isSameOrBefore(tonight);
                        });
                        var numTasks = hotTasks.length
                        console.log("Got " + numTasks + " tasks:");
                        for (var i = 0; i < hotTasks.length; i++){
                            console.log("\t" + JSON.stringify(hotTasks[i].due_date_utc));
                        }

                        outputText.text = numTasks === 0 ? fa.icons.fa_check : numTasks;

                    } else {
                        outputText.visible = false;
                    }
                }
            });

            xhr.open('GET', url, true);
            xhr.responseType = "json";
            xhr.send('');
        }
    }
}
