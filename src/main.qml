import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    title: "Dashboard Mock"
    property string currTime: "00:00:00"

    Image {
        id: background
        source: "images/OldScreen.png"
    }
    Image {
        id: wheel
        anchors.centerIn: parent
        source: "images/pinwheel.png"
        Behavior on rotation {
            NumberAnimation {
                duration: 250
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            wheel.rotation += 90
        }
    }
    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Text {
            anchors.top: parent.top
            anchors.topMargin: 12
            text: "Mock Dashboard" 
            font.pixelSize: 36
            color: "White"
        }
    }
    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Text {
            anchors.top: parent.top
            anchors.topMargin: 48
            text: currTime 
            font.pixelSize: 24
            color: "White"
        }
    }

    visible: true
    width: background.width
    height: background.height
    flags: Qt.FramelessWindowHint | Qt.Window
}