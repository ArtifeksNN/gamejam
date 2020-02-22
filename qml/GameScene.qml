import Felgo 3.0
import QtQuick 2.13

Scene {
    id: gameScene

    width: 480
    height: 320
    gridSize: 32

    EntityManager {
      id: entityManager
    }
}
