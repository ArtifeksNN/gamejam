import Felgo 3.0
import QtQuick 2.13

TiledEntityBase {
  id: root

  entityType: "water"

  Rectangle {
    id: rectangle
    color: "blue"
    anchors.fill: parent
  }

//  BoxCollider {
//    id: collider

//    anchors.fill: parent
//    bodyType: Body.Static
//  }
}
