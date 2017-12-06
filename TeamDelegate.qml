import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1

Item{
    x: parent.width / 10
    y: parent.width / 10
    width: gridView.cellWidth
    height: width
    MouseArea{
        anchors.fill: parent
        onClicked:
        {
            mediator.teamInfo(myModel2, name)
            mediator.teamPlayers(myModel3, name)
            stack.push({item:teamInfo, properties:{teamName:name, teamUrl:url, teamImage: image, teamWins: wins, teamLoses: loses}})
        }
    }
    Image
    {
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: image
    }
}
