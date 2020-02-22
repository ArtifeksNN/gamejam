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

    onContactsChanged: {
        console.log("contact sum", contacts)
        if (contacts === 0) {
            collider.linearVelocity.y = 0
            collider.linearVelocity.x = 0
        }
    }

    function moveUp() {
        collider.linearVelocity.y = -100
//        player.rotation = -90
    }

    SpriteSequence {
        id: image

        width: 232
        height: 139

        anchors.horizontalCenter: parent.horizontalCenter
        interpolate: true

        Sprite{
            name: "idle_begin"
            source: "../../assets/ulitka_idle.png"
            frameCount: 1
            frameWidth: 210
            frameHeight: 139
            frameDuration: 100
            to: {"forward1":1}
        }

        Sprite{
            name: "forward1"
            source: "../../assets/ulitka_forward_01.png"
            frameCount: 1
            frameWidth: 232
            frameHeight: 139
            frameDuration: 100
            to: {"forward2":1}

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
            frameDuration: 100
            to: {"idle_end":1}
        }

        Sprite{
            name: "idle_end"
            source: "../../assets/ulitka_idle.png"
            frameCount: 1
            frameWidth: 210
            frameHeight: 139
            frameDuration: 100
            to: {"idle_end":0, "idle_begin": 1}
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
      force: Qt.point(controller.xAxis*170*32,0)

      onLinearVelocityChanged: {
        if(linearVelocity.x > maxSpeed) linearVelocity.x = maxSpeed
        if(linearVelocity.x < -maxSpeed) linearVelocity.x = -maxSpeed
      }

      fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "ground") {
            console.debug("contact platform begin", otherEntity.y, otherEntity.height)

          // increase the number of active contacts the player has
          player.contacts++
        }
      }

      fixture.onEndContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "ground") {
          console.debug("contact platform end", otherEntity.y, otherEntity.height)

          // if the player leaves a platform, we decrease its number of active contacts
          player.contacts--
        }
      }

//      Timer {
//        repeat: true
//        running: true
//        interval: 100
//        onTriggered: {
//          collider.body.applyForceToCenter(Qt.point(200,0));
//        }
//      }
    }
}
