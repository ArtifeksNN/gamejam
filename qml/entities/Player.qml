import Felgo 3.0
import Felgo 3.0 as Felgo
import QtQuick 2.13

EntityBase {
    id: player

    entityType: "player"

    width: 232
    height: 139

    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x

    property var maxSpeed: 100
    property int contacts: 0

    function moveRight() {
        moveAnimation.start()
    }

    MultiResolutionImage {
        id: idle

        source: "../../assets/ulitka_idle.png"
        visible: true
//        mirror: true

//        transform: Scale{ xScale: -1 }
    }

    SequentialAnimation {
        id: moveAnimation

        ScriptAction {
            script: {
                idle.visible = false
                seqImage.visible = true
                seqImage.jumpTo("forward1");
                seqImage.goalSprite = "forward3";
                collider.force = Qt.point(1500, 0)
            }
        }
        NumberAnimation { duration: 700; }
        ScriptAction {
            script: {
                seqImage.goalSprite = "";
                collider.force = Qt.point(0, 0)
                player.horizontalVelocity = 0
                seqImage.visible = false
                idle.visible = true
            }
        }
    }

    SpriteSequence {
        id: seqImage

        width: 232
        height: 139

        visible: false

        anchors.horizontalCenter: parent.horizontalCenter
        interpolate: false

        Sprite{
            name: "forward1"
            source: "../../assets/ulitka_forward_01.png"
            frameCount: 1
            frameWidth: 232
            frameHeight: 139
            frameDuration: 100
            to: { "forward2":1 }
        }

        Sprite{
            name: "forward2"
            source: "../../assets/ulitka_forward_02.png"
            frameCount: 1
            frameWidth: 232
            frameHeight: 139
            frameDuration: 300
            to: {"forward3":1}

        }

        Sprite{
            name: "forward3"
            source: "../../assets/ulitka_forward_03.png"
            frameCount: 1
            frameWidth: 232
            frameHeight: 139
            frameDuration: 200
            to: {"forward3":0}
        }
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
