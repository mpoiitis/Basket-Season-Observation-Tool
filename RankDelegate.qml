import QtQuick 2.5

Rectangle
{
    id: rankDelegate
    opacity: 0.8
    width: rankDelegate.ListView.view.width
    height: rankDelegate.ListView.view.width /10
    Row
    {

        width: parent.width
        height: parent.height


        Item
        {
            height: parent.height
            width: parent.width* 7/9
            Row
            {
                spacing : parent.width/12
                anchors.fill: parent
                Image
                {
                    id: icon
                    sourceSize.height: parent.height
                    sourceSize.width: parent.height
                    source: image
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
        }


        Text
        {
            width: parent.width /9
            height: parent.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            text: wins
        }

        Text
        {
            width: parent.width /9
            height: parent.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            text: loses
        }

    }

}




