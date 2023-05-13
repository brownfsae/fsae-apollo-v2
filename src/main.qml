import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    title: "Dashboard Mock"
    property string currTime: "00:00:00"
    property string coolantTemp: "0.00"
    property string oilPressure: "0.00"
    property string batteryVoltage: "0.00"
    property string lambdaValue: "0.00"
    property string engineSpeed: "0.00"
    property string gear: "0"

    Image {
        id: background
        source: "images/Dashboard .png"
    }
    /* Image {
        id: wheel
        anchors.centerIn: parent
        source: "images/pinwheel.png"
        Behavior on rotation {
            NumberAnimation {
                duration: 250
            }
        }
    } */
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
    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Text{
            // text for gear number
            x: 325
            y: 40
            font.family: "Helvetica"
            text: "2"
            font.pixelSize: 240
            color: "White"
        }
    }
    Rectangle {
        x: 375
        y: 10
        color: "transparent"

        Text {
        text: "27"
        font.pixelSize: 48
        color: "white"
        }
    }
    Rectangle {
        // RPM
        x: 325
        y: 380
        color: "transparent"

        Text {
        text: engineSpeed
        font.pixelSize: 56
        color: "white"
        }
    }
    Rectangle {
        // Voltage
        x: 650
        y: 300
        color: "transparent"

        Text {
        text: batterVoltage
        font.pixelSize: 56
        color: "white"
        }
    }
    Rectangle {
        // Oil Pressure
        x: 650
        y: 100
        color: "transparent"

        Text {
        text: oilPressure
        font.pixelSize: 56
        color: "white"
        }
    }
    Rectangle {
        // Water Temperature
        x: 50
        y: 100
        color: "transparent"

        Text {
        text: coolantTemp
        font.pixelSize: 56
        color: "white"
        }
    }
    Rectangle {
        // Lambda
        x: 50
        y: 300
        color: "transparent"

        Text {
        text: lambdaValue
        font.pixelSize: 56
        color: "white"
        }
    }
    visible: true
    width: background.width
    height: background.height
    flags: Qt.FramelessWindowHint | Qt.Window
}