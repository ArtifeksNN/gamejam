import Felgo 3.0
import QtQuick 2.13
import "entities"

Scene {
    id: gameScene

    width: 480
    height: 320
    gridSize: 32

    EntityManager {
      id: entityManager
    }

    PhysicsWorld {
      id: physicsWorld
      gravity.y: 9.81 // make the objects fall faster
      debugDrawVisible: true

      updatesPerSecondForPhysics: 60
    }

    Ground {
        anchors {
            bottom: gameScene.bottom
            left: gameScene.left
            right: gameScene.right
        }
        height: 15
    }
}
