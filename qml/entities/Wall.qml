import Felgo 3.0
import QtQuick 2.13

TiledEntityBase {
    id: root

    entityType: "wall"

    width: gameScene.gridSize
    height: gameScene.gridSize * size

    Rectangle {
        id: rectangle
        color: "brown"
        anchors.fill: parent
    }

    BoxCollider {
        id: collider

        anchors.fill: parent
        bodyType: Body.Static
        categories: Box.Category3

        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if (otherEntity.entityType === "player") {
                console.log("wall check player")
                otherEntity.contacts++
//                otherEntity.stickTrajectory(collider.body.getWorldCenter())
            }
        }

        fixture.onEndContact: {
            var otherEntity = other.getBody().target
            if (otherEntity.entityType === "player") {
                otherEntity.contacts--
                otherEntity.checkContacts()
            }
        }
    }
}
