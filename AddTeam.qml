import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2


Item {

    width: parent.width
    height: parent.height

    Background{}

    ToolBar
    {
        id: addTeamToolbar
        width: parent.width
        height: parent.height / 14
        opacity: 0.65
        Label
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            font.bold: true
            text: "Προσθήκη ομάδας"
        }
        BackButton{}
    }

    Column
    {
        anchors.top: addTeamToolbar.bottom
        width: parent.width
        height: parent.height *13/14
        spacing: parent.width/20
        anchors.margins: width/20

        Row{
            x: parent.width / 20
            width: parent.width
            height: parent.height / 12
            spacing: parent.width / 20

            Text{
                height: parent.height
                width: parent.width /5
                font.pointSize: 17
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Όνομα"
            }

            TextField{
                id:name
                font.pointSize: 17
                height: parent.height
                width: parent.width  *3/5
                placeholderText: "Ομάδα Α"
            }
        }

        Row{
            x: parent.width / 20
            width: parent.width
            height: parent.height / 12
            spacing: parent.width / 20

            Text{
                height: parent.height
                width: parent.width /5
                font.pointSize: 17
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "URL"
            }

            TextField{
                id:url
                font.pointSize: 17
                height: parent.height
                width: parent.width  *3/5
                placeholderText: "www.example.com"
            }
        }

        Item{
            width: parent.width
            height: 200

            ToolButton{

                anchors.horizontalCenter: parent.horizontalCenter
                height: parent.height
                width: height
                Image{
                    id: preview
                    anchors.fill: parent
                    source: "qrc:/images/camera.png"
                }
                onClicked: {
                    fileDialog.open()
                }

            }
        }

        FileDialog{
            id: fileDialog

            nameFilters:["Image files (*.jpg *.png)"]
            title: "Επιλέξτε εικόνα"
            folder: shortcuts.pictures
            selectFolder: false
            selectMultiple: false
            selectExisting: true
            onAccepted:{
                console.log("Επέλεξες : "+ fileDialog.fileUrls)
                preview.source = fileDialog.fileUrl
                fileDialog.close()
            }
            onRejected: {
                console.log("Canceled")
                fileDialog.close()
            }
            Component.onCompleted: visible = false

        }
    }

    ToolButton{
        anchors.bottomMargin: height * 2/3
        height: parent.height / 8
        width: height
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        Image
        {
            source: "qrc:/images/saved.png"
            anchors.fill: parent
            anchors.margins: 1
        }
        onClicked:
        {
            mediator.addTeam(name.text, preview.source.toString(), url.text, 0, 0)
            mediator.teams(myModel)
            stack.pop()
        }
    }


}
