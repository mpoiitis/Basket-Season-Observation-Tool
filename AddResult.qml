import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2


Item {

    width: parent.width
    height: parent.height

    Background{}

    ToolBar
    {
        id: addResultToolbar
        width: parent.width
        height: parent.height / 14
        opacity: 0.65
        Label
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20
            font.bold: true
            text: "Προσθήκη αγώνα"
        }
        BackButton{}
    }

    Column
    {
        anchors.top: addResultToolbar.bottom
        width: parent.width
        height: parent.height *13/14
        spacing: parent.height/30



        Row{
            x: parent.width / 20
            width: parent.width
            height: parent.height / 12
            spacing: parent.width / 12
            Text{
                height: parent.height
                width: parent.width *2/3
                font.pointSize: 17
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                text: "Ομάδα"
            }
            Text{
                height: parent.height
                width: parent.width / 6
                font.pointSize: 17
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                text: "Πόντοι"
            }
        }



        Row{
            x: parent.width / 20
            width: parent.width
            height: parent.height / 12
            spacing: parent.width / 12

            TextField{
                id:team1
                font.pointSize: 17
                height: parent.height
                width: parent.width  *2/3
                placeholderText: "Ομάδα Α"
            }
            TextField{
                id: points1
                font.pointSize: 17
                height: parent.height
                width: parent.width / 6
            }
        }

        Row{
            x: parent.width / 20
            width: parent.width
            height: parent.height / 12
            spacing: parent.width / 12

            TextField{
                id: team2
                font.pointSize: 17
                height: parent.height
                width: parent.width *2/3
                placeholderText: "Ομάδα Β"
            }
            TextField{
                id: points2
                font.pointSize: 17
                height: parent.height
                width: parent.width / 6
            }
        }

        Row{
            x: parent.width / 20
            spacing: parent.width / 12
            width: parent.width
            height: parent.height / 12

            SpinBox {
                width: parent.width / 6
                height: parent.height
                font.pointSize: 17
                id: addSpinBox
                minimumValue: 1
                maximumValue: 82
            }

            Text{
                height: parent.height
                width: parent.width / 3
                font.pointSize: 17
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "Αγωνιστική"
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
            mediator.addResult(team1.text, team2.text, parseInt(points1.text), parseInt(points2.text), addSpinBox.value);
            mediator.results(myModel)
            stack.pop();
        }
    }
}
