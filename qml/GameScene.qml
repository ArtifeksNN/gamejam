import Felgo 3.0
import QtQuick 2.13

import "entities"
import "common"

Scene {
    id: gameScene

    property bool isSlowMode: true

    width: 960
    height: 640
    gridSize: 64

    EntityManager {
      id: entityManager
    }

    FarBackground {
        id: farBackground

        anchors.fill: parent
        isFocusMode: isSlowMode
    }

    PhysicsWorld {
      id: physicsWorld

      gravity.y: 9.81
      debugDrawVisible: true

      updatesPerSecondForPhysics: 60
    }

    Ground {
        anchors {
            bottom: gameScene.bottom
            left: gameScene.left
            right: gameScene.right
        }
        height: 150
    }

    Player {
        id: player

        x: 20
        y: 20
//        playerForce: gameScene.isSlowMode ? Qt.point(controller.xAxis*17*8,0) :
//                                            Qt.point(controller.xAxis*170*32,0)

//        maxSpeed: gameScene.isSlowMode ? 10 : 100


    }

    Keys.forwardTo: controller

    Keys.onPressed: {
        if (event.key === Qt.Key_Space) {
            console.log("space click")
            gameScene.isSlowMode = !gameScene.isSlowMode
        }
    }

    TwoAxisController {
      id: controller

      onInputActionPressed: {
        console.debug("key pressed actionName " + actionName)
        if(actionName == "up") {
//          player.jump()
            console.debug("up")
        }
      }
    }
}
