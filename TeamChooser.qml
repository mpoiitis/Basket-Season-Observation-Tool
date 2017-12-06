import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2

Item {
    width: parent.width
    height: parent.height

    Background{}

    Component
    {
        id:teamInfo
        TeamInfo{}
    }

    Component{
        id: addTeam
        AddTeam{}
    }

    ToolBar
    {
        id: teamToolbar
        width: parent.width
        height: parent.height / 14
        opacity: 0.65
        Label
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            font.bold: true
            text: "Ομάδες"
        }
        BackButton{}

        ToolButton
        {
            anchors.right: parent.right
            anchors.top: parent.top
            width: parent.height
            height:width
            Image
            {
                source: "qrc:/images/add.png"
                anchors.fill: parent
                anchors.margins: 1
            }
            onClicked:
            {
                stack.push(addTeam);
            }
        }
    }

    GridView
    {
        id: gridView
        anchors.top: teamToolbar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: parent.width / 20

        model: myModel
        cellWidth: 120
        cellHeight: cellWidth
        delegate:TeamDelegate{}

    }
}

