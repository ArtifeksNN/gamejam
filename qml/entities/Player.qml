import Felgo 3.0
import Felgo 3.0 as Felgo
import QtQuick 2.13

EntityBase {
    id: player

    entityType: "player"

    width: 232
    height: 139

    property int variation: 1

    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x

    property var maxSpeed: 100

    function moveRight() {
        collider.moveRight()
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
