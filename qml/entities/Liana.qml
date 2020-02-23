import Felgo 3.0
import QtQuick 2.13

TiledEntityBase {
  id: root

  entityType: "liana"

  width: gameScene.gridSize
  height: gameScene.gridSize * size

  Rectangle {
    id: rectangle
    color: "#0d5803"
    anchors.fill: parent
  }

  BoxCollider {
    id: collider

    anchors.fill: parent
    bodyType: Body.Static
    categories: Box.Category3
  }
}
