import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2

Item
{
    width: parent.width
    height: parent.height

    Background{}

    Rectangle
    {
        anchors.top: parent.top
        anchors.right: parent.right
        width: parent.width
        height: parent.height /10
        opacity: 0.4
    }

    Text
    {
        anchors.top: parent.top
        anchors.right: parent.right
        font.bold: true
        width: parent.width
        height: parent.height /10
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: "Βοηθός Μπάσκετ"
        color: "black"
        font.pointSize: 26
    }

    Component
    {
        Rank{}
        id:rank
    }

    Component
    {
        Results{}
        id:results
    }

    Component
    {
        TeamChooser{}
        id: teamChooser

    }

    Column
    {
        spacing: 8
        width: parent.width
        height: parent.height/2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        Item
        {
            width: parent.width * 9 / 10
            height: parent.height / 5
            anchors.horizontalCenter: parent.horizontalCenter

            Button
            {
                anchors.fill: parent
                opacity: 0.65
                onClicked:
                {
                    mediator.rankings(myModel)
                    stack.push(rank)
                }
            }

            Text
            {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "black"
                font.pointSize: 26
                text: "Κατάταξη"
            }
        }

        Item
        {
            width: parent.width * 9/ 10
            height: parent.height / 5
            anchors.horizontalCenter: parent.horizontalCenter

            Button
            {
                anchors.fill: parent
                opacity: 0.65
                onClicked:
                {
                    mediator.results(myModel)
                    stack.push(results)
                }
            }

            Text
            {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "black"
                font.pointSize: 26
                text: "Αποτελέσματα"
            }
        }

        Item
        {
            width: parent.width * 9 / 10
            height: parent.height / 5
            anchors.horizontalCenter: parent.horizontalCenter

            Button
            {
                anchors.fill: parent
                opacity: 0.65
                onClicked:
                {
                    mediator.teams(myModel)
                    stack.push(teamChooser)
                }
            }

            Text
            {
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "black"
                font.pointSize: 26
                text: "Ομάδες"
            }
        }
    }



}
