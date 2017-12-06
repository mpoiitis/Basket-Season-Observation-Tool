import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2

Item{

    property string teamName
    property string teamUrl
    property string teamImage
    property int teamWins
    property int teamLoses

    Background{}

    ToolBar{

        id: teamInfoBar
        width: parent.width
        height: parent.height / 14
        opacity: 0.65
        Label
        {
            anchors.horizontalCenter : parent.horizontalCenter
            anchors.verticalCenter : parent.verticalCenter
            font.pixelSize: 20
            font.bold: true
            text: teamName
        }
        BackButton{}
    }

    TabView {
        width: parent.width
        anchors.bottom: parent.bottom
        anchors.top: teamInfoBar.bottom
        Tab {
            title: "Ομάδα"

            Item{
                Background{}

                Row{
                    id: firstRow
                    width: parent.width
                    height: 200
                    spacing: parent.width / 20
                    Image{
                        x: parent.width / 15
                        id: temp
                        width: height
                        height: parent.height
                        source: teamImage
                        fillMode: Image.PreserveAspectFit
                    }

                    Column{
                        y: height /10
                        height: parent.height
                        width: height
                        spacing: width / 10
                        ToolButton{
                            opacity: 0.8
                            id: textTemp
                            width: parent.width *3/5
                            style: ButtonStyle {
                                  label: Text {
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    font.pointSize: 14
                                    text: "Website"
                                  }
                                }
                            onClicked:{Qt.openUrlExternally(teamUrl)}
                        }

                        Text
                        {
                            width: parent.width
                            font.pointSize: 20
                            text: "Νίκες : " + teamWins
                        }

                        Text
                        {

                            width: parent.width
                            font.pointSize: 20
                            text: "Ήττες : " + teamLoses
                        }
                    }
                }
                Item{

                    width: parent.width
                    anchors.bottom: parent.bottom
                    anchors.top: firstRow.bottom
                    ListView
                    {
                        width: parent.width
                        height: parent.height
                        spacing: parent.height / 50
                        model: myModel2
                        delegate: ResultsDelegate{}

                    }
                }
            }
        }
        Tab {
            title: "Παίκτες"
            Item{

                Background{}

                Rectangle
                {
                    width: parent.width
                    height: parent.height /18
                    color: "black"

                    Row
                    {
                        id:infoRow
                        anchors.fill: parent

                        Text
                        {
                            id: nameInfo
                            width: parent.width* 2/3
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
                            width: parent.width *1.5 /9
                            height: parent.height
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            color: "white"
                            font.pointSize: 17
                            text: "Ύψος"
                        }
                        Text
                        {
                            id: loseInfo
                            width: parent.width *1.5/9
                            height: parent.height
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            color: "white"
                            font.pointSize: 17
                            text: "Θέση"
                        }
                    }
                }


                Button{
                    id: addPlayerButton
                    anchors.right: parent.right
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: parent.width * 4 / 5
                    height: parent.height / 14
                    style: ButtonStyle {
                          label: Text {
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pointSize: 17
                            text: "Προσθήκη παίκτη"
                          }
                        }
                    onClicked:{
                        stack.push({item:addPlayer, properties:{playerTeam:teamName}})
                    }
                }

                Component{
                    id: addPlayer
                    AddPlayer{}
                }

                ListView{
                    width: parent.width
                    anchors.top: parent.top
                    anchors.bottom: addPlayerButton.top
                    spacing: width / 30
                    anchors.margins: width / 12
                    model: myModel3
                    delegate:PlayerDelegate{}
                }

            }
        }
    }
}

