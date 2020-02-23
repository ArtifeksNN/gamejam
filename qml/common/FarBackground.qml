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

        onRotationChanged: {
            if (rotation > 180) {
                gameScene.isNight = false
            } else {
                gameScene.isNight = true
            }
        }

        Behavior on rotation { NumberAnimation { duration: 10 } }

        MultiResolutionImage {
            anchors.fill: parent
            source: "../../assets/sky_06.jpg"
        }

        Rectangle {
            id: sun

            anchors {
                left: parent.left
                top: parent.top
                leftMargin: 1280
                topMargin: 720
            }

            width: 200
            height: width
            radius: width / 2
            color: "red"
        }


        Rectangle {
            id: moon

            anchors {
                horizontalCenter: parent.horizontalCenter
            }

            width: 40
            height: width
            radius: width / 2
            color: "blue"
        }
    }

    MultiResolutionImage {
        anchors {
            horizontalCenter: parent.horizontalCenter
            //            left: parent.left
            //            right: parent.right
            bottom: parent.bottom
            bottomMargin: -80
        }

        fillMode: Image.TileHorizontally
        source: "../../assets/mountain_project_01.png"
    }

    Timer {
        id: fastTimer

        interval: 16
        repeat: true
        running: !isFocusMode
        onTriggered:{
            if (skyRect.rotation > 360.0) {
                skyRect.rotation = 0
            } else {
                skyRect.rotation = skyRect.rotation + 2
            }
        }
    }

    Timer {
        id: lowTimer

        interval: 16
        repeat: true
        running: isFocusMode
        onTriggered: {
            if (skyRect.rotation > 360.0) {
                skyRect.rotation = 0
            } else {
                skyRect.rotation = skyRect.rotation + 0.01
            }
        }
    }
}
