import Felgo 3.0
import Felgo 3.0 as Felgo
import QtQuick 2.13

EntityBase {
    id: player

    entityType: "player"

    width: 100
    height: 100

    property int variation: 1

    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x
//    property alias playerForce: collider.force

    property var maxSpeed: 100

    function moveRight() {
        collider.moveRight()
    }

    SpriteSequence {
        id: image

        width: 232
        height: 139

        anchors.horizontalCenter: parent.horizontalCenter
        interpolate: false

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
            frameDuration: 100
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

      onLinearVelocityChanged: {
        if(linearVelocity.x > maxSpeed) linearVelocity.x = maxSpeed
        if(linearVelocity.x < -maxSpeed) linearVelocity.x = -maxSpeed
      }

      Timer {
        repeat: true
        running: true
        interval: 10 // for 30 updates per second
        onTriggered: {
            console.log('move')
          // apply a force towards the world position 100/0 every 33ms
          collider.body.applyForce(Qt.point(controller.xAxis*170*32,0), collider.body.getWorldCenter() );
        }
      }
    }
}
