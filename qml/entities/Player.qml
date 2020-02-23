import Felgo 3.0
import Felgo 3.0 as Felgo
import QtQuick 2.13

import "../common"

EntityBase {
    id: player

    entityType: "player"

    width: 232
    height: 139
    transformOrigin: Item.BottomLeft

    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x

    property var maxSpeed: 100
    property int contacts: 0

    property bool isFocusMode: false

    onContactsChanged: {
        console.log("contact changed", contacts)
    }

    function checkContacts(){
        if (contacts == 0) {
            console.log("contacts zero")
            collider.force = Qt.point(0, 0)
            collider.linearVelocity.y = 0
        }
    }

    property bool isMoveRight: true

    function moveRight() {
        isMoveRight = true
        sideAnimation.startAnimation()
    }

    function moveLeft() {
        isMoveRight = false
        sideAnimation.startAnimation()
    }

    function moveUp() {
        if (contacts > 0) {
            collider.linearVelocity.y = -100
//            rotation -= 90
        }
    }

    function moveDown() {
        if (contacts > 0) {
//            collider.linearVelocity.y = -100
//            rotation += 90
        }
    }

    Timer {
        id: stickForce

        repeat: true
        interval: 75
        onTriggered:{
//            collider.linearVelocity.y = -25

            var localForwardVector = collider.body.toWorldVector(Qt.point(0,90));
            collider.body.applyLinearImpulse(localForwardVector, collider.body.getWorldCenter());
        }
    }

    function stickTrajectory(center) {
        console.log("stick traj", center)

        if (!stickForce.running) stickForce.start()
        else stickForce.stop()
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

        bodyType: Body.Dynamic
        bullet: true
        sleepingAllowed: false
        friction: 1.0

        onLinearVelocityChanged: {
            if (linearVelocity.x > maxSpeed) linearVelocity.x = maxSpeed
            if (linearVelocity.x < -maxSpeed) linearVelocity.x = -maxSpeed
        }
    }
}
