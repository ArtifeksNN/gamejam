import Felgo 3.0
import QtQuick 2.13

TiledEntityBase {
    id: root

    entityType: "levelEnd"

    width: 1
    height: level.height

    BoxCollider {
        id: collider

        anchors.fill: parent
        bodyType: Body.Static

        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if (otherEntity.entityType === "player") {
                gameScene.showWinPopup()
            }
        }
    }
}
