import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2


Item {

    width: parent.width
    height: parent.height

    Background{}

    Column
    {
        anchors.fill: parent

        ToolBar
        {
            id:backToolbar
            width: parent.width
            height: parent.height / 14
            opacity: 0.65
            Label
            {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                font.bold: true
                text: "Κατάταξη"
            }
            BackButton{}
        }

        Rectangle
        {
            width: parent.width
            height: parent.height /18
            color: "black"

            Row
            {
                anchors.topMargin: 5
                id:infoRow
                anchors.fill: parent

                Text
                {
                    id: nameInfo
                    width: parent.width* 7/9
                    height: parent.height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    font.pointSize: 17
                    text: "Όνομα"
                }

                Text
                {
                    id: winInfo
                    width: parent.width /9
                    height: parent.height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    font.pointSize: 17
                    text: "Ν"
                }
                Text
                {
                    id: loseInfo
                    width: parent.width /9
                    height: parent.height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "white"
                    font.pointSize: 17
                    text: "Ή"
                }
            }
        }



        Item{
            width: parent.width
            height: parent.height *12/14

            ListView
            {
                width: parent.width
                height: parent.height
                spacing: parent.height / 50
                model: myModel
                delegate: RankDelegate{}

            }
        }
    }
}
