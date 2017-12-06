import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import Mediators 1.0

ApplicationWindow
{
    visible: true
    width: 400
    height: 640
    title: "Basket Assistant"
    Component
    {
        Home{}
        id:zero
    }

    Mediator
    {
        id:mediator
    }
    StackView
    {
        anchors.fill: parent
        initialItem: zero
        id: stack
    }


}
