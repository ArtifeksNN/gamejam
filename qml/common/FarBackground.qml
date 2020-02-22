import Felgo 3.0
import QtQuick 2.13

Item {
    id: root

    property bool isFocusMode: false

    Rectangle {
        id: skyRect

        width: parent.width * 2
        height: parent.width * 2

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.bottom
        }

        radius: width / 2

        Behavior on rotation { NumberAnimation { duration: 10 } }

        MultiResolutionImage {
            anchors.fill: parent
            source: "../../assets/sky_06.jpg"
        }
    }

    MultiResolutionImage {
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: -80
        }

        fillMode: Image.PreserveAspectFit
        source: "../../assets/mountain_project_01.png"
    }

    Timer {
        id: fastTimer

        interval: 16
        repeat: true
        running: !isFocusMode
        onTriggered: skyRect.rotation = skyRect.rotation + 2
    }

    Timer {
        id: lowTimer

        interval: 16
        repeat: true
        running: isFocusMode
        onTriggered: skyRect.rotation = skyRect.rotation + 0.01
    }
}
