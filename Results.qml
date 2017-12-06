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
            id: resultToolbar
            width: parent.width
            height: parent.height / 14
            opacity: 0.65
            Label
            {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
                font.bold: true
                text: "Αποτελέσματα"
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
                    stack.push(addResult);
                }
            }

        }

        Item{
            width: parent.width
            height: parent.height *13/14

            ListView
            {
                width: parent.width
                height: parent.height
                spacing: parent.height / 50
                model: myModel
                delegate: ResultsDelegate{}

            }
        }
    }
    Component
    {
        AddResult{}
        id:addResult
    }

}
