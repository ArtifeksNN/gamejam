import Felgo 3.0
import QtQuick 2.13

TiledEntityBase {
    id: root

    entityType: "platform"

    Rectangle {
        id: rectangle

        color: "#252933"
        anchors.fill: parent
    }

    BoxCollider {
        id: collider

        anchors.fill: parent
        bodyType: Body.Static

        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if (otherEntity.entityType === "player") {
                console.log("platform check player")
                otherEntity.contacts++
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
