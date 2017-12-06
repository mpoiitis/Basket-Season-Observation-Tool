import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2

Rectangle
{
    id: playerDelegate
    opacity: 0.8
    width: playerDelegate.ListView.view.width
    height: playerDelegate.ListView.view.width /8
    Row
    {

        width: parent.width
        height: parent.height

        Row
        {
            height: parent.height
            width: parent.width* 2/3
            ToolButton
            {
                height: parent.height
                width: parent.width / 7
                Image{
                    anchors.fill: parent
                    source: "qrc:/images/delete.png"
                    fillMode: Image.Stretch
                }
                onClicked: {
                    mediator.deletePlayer(name)
                    mediator.teamPlayers(myModel3, team)
                }
            }
            Text
            {
                height: parent.height
                width: parent.width
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 17
                text: name
                clip: true
            }
        }


        Text
        {
            width: parent.width *1.5/9
            height: parent.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            text: ftHeight
        }

        Text
        {
            width: parent.width * 1.5/9
            height: parent.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            text: position
        }

    }

}
