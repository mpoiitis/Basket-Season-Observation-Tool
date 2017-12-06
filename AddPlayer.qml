import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2
import QtQuick.Dialogs 1.2


Item {

    property string playerTeam

    width: parent.width
    height: parent.height

    Background{}

    ToolBar
    {
        id: addPlayerToolbar
        width: parent.width
        height: parent.height / 14
        opacity: 0.65
        Label
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            font.bold: true
            text: "Προσθήκη παίκτη"
        }
        BackButton{}
    }

    Column
    {
        anchors.top: addPlayerToolbar.bottom
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
                placeholderText: "Παίκτης Α"
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
                text: "Ύψος"
            }

            TextField{
                id:playerH
                font.pointSize: 17
                height: parent.height
                width: parent.width  *3/5
                placeholderText: "5'11"
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
                text: "Θέση"
            }

            TextField{
                id:position
                font.pointSize: 17
                height: parent.height
                width: parent.width  *3/5
                placeholderText: "PG"
            }
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
            mediator.addPlayer(name.text, playerTeam ,playerH.text,position.text)
            mediator.teamPlayers(myModel3, playerTeam)
            stack.pop()
        }
    }


}
