import QtQuick 2.13

Item {
    id: root

    property alias popupText: text.text
    property alias popupPicture: picture.source

    visible: false
    enabled: visible
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.25
    }

    Rectangle {
        anchors.centerIn: parent

        width: 400
        height: 200
        color: "lightblue"
        radius: 20
        visible: root.visible
        border.color: "darkblue"
        border.width: 1

        Text {
            id: text

            anchors {
                left: parent.left
                leftMargin: 15
                verticalCenter: parent.verticalCenter
            }

            font.pointSize: 24
        }

        Image{
            id: picture

            anchors {
                right: parent.right
                rightMargin: 15
                verticalCenter: parent.verticalCenter
            }
        }
    }
}
