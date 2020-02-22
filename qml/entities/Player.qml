import Felgo 3.0
import Felgo 3.0 as Felgo
import QtQuick 2.13

import "../common"

EntityBase {
    id: player

    entityType: "player"

    width: 232
    height: 139

    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x

    property var maxSpeed: 100
    property int contacts: 0

    property bool isMoveRight: true

    function moveRight() {
        isMoveRight = true
        sideAnimation.startAnimation()
    }

    function moveLeft() {
        isMoveRight = false
        sideAnimation.startAnimation()
    }

    MultiResolutionImage {
        id: idle

        source: "../../assets/ulitka_idle.png"
        visible: true
    }

    PlayerSideAnimation {
        id: sideAnimation

        anchors.horizontalCenter: parent.horizontalCenter
    }

    BoxCollider {
        id: collider

        height: player.height
        width: player.width

        anchors.horizontalCenter: parent.horizontalCenter

        bodyType: Body.Dynamic // this is the default value but I wanted to mention it ;)
        fixedRotation: true // we are running, not rolling...
        bullet: true // for super accurate collision detection, use this sparingly, because it's quite performance greedy
        sleepingAllowed: false
        friction: 1.0
        //      force: Qt.point(controller.xAxis*170*32,0)

        onLinearVelocityChanged: {
            if (linearVelocity.x > maxSpeed) linearVelocity.x = maxSpeed
            if (linearVelocity.x < -maxSpeed) linearVelocity.x = -maxSpeed
        }

        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "wall" || otherEntity.entityType === "platform") {
                console.debug("contact platform begin", otherEntity.y, otherEntity.height)

                // increase the number of active contacts the player has
                player.contacts++
            }
        }

        fixture.onEndContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "wall") {
                console.debug("contact platform end", otherEntity.y, otherEntity.height)

                // if the player leaves a platform, we decrease its number of active contacts
                player.contacts--
            }
        }
    }
}
