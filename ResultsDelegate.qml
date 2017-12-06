import QtQuick 2.5

Rectangle
{
    id: resultDelegate
    opacity: 0.8
    width: resultDelegate.ListView.view.width
    height: resultDelegate.ListView.view.width /6
    Item
    {
        anchors.margins: parent.height / 10
        anchors.fill: parent

        Row
        {
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height *2/ 3
            Text{
                font.pointSize: 17
                text: teamA + " : " + pointsA
                color: pointsA>pointsB? "green" : "red"
            }
            Text{
                font.pointSize: 17
                text: " - "
            }

            Text{
                font.pointSize: 17
                text: pointsB + " : " + teamB
                color: pointsB>pointsA? "green" : "red"
            }
        }

        Text
        {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            height: parent.height /3
            font.pointSize: 12
            text: "αγωνιστική : " + match
        }

    }

}
