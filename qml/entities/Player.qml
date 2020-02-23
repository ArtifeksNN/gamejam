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
    property int health: 3

    onContactsChanged: {
        console.log("contact changed", contacts)
    }

    function checkContacts(){
        if (contacts == 0) {
            console.log("contacts zero")
//            collider.force = Qt.point(0, 0)
//            collider.linearVelocity.y = 5
        }
    }

    property bool isMoveRight: true

    function moveRight() {
        isMoveRight = true
        if (!isFocusMode) sideAnimation.startAnimation()
        else focusModeMove()
    }

    function moveLeft() {
        isMoveRight = false
        if (!isFocusMode) sideAnimation.startAnimation()
        else focusModeMove()
    }

    function moveUp() {
        if (contacts > 0) {
            if (isFocusMode) collider.linearVelocity.y = -50
            else collider.linearVelocity.y = -110
        }
    }

    function moveDown() {
        if (contacts > 0) {
        }
    }

    function focusModeMove() {
        collider.force = isMoveRight ?
                    Qt.point(1500, 0) : Qt.point(-1500, 0)
    }

    Timer {
        id: stickForce

        repeat: true
        interval: 75
        onTriggered:{
            var localForwardVector = collider.body.toWorldVector(Qt.point(0,90));
            collider.body.applyLinearImpulse(localForwardVector, collider.body.getWorldCenter());
        }
    }

    function stickTrajectory(center) {
        if (!stickForce.running) stickForce.start()
        else stickForce.stop()
    }

    Image {
        id: idle

        anchors.fill: parent
        anchors.bottomMargin: -10
        source: isFocusMode ? "../../assets/snail_normal_idle.png" : "../../assets/ulitka_idle.png"
        visible: true
    }

    PlayerSideAnimation {
        id: sideAnimation

        anchors.horizontalCenter: parent.horizontalCenter
    }

    BoxCollider {
        id: collider

        height: player.height
        categories: Box.Category1
        collidesWith: Box.Category2 | Box.Category3

        anchors {
            right: player.right
            rightMargin: 40
            left: player.left
            leftMargin: 70
        }

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
