import Felgo 3.0
import QtQuick 2.13

TiledEntityBase {
    id: root

    entityType: "levelBegin"

    width: 1
    height: level.height

    BoxCollider {
        id: collider

        anchors.fill: parent
        bodyType: Body.Static
        categories: Box.Category3
    }
}

