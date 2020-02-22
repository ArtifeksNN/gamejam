import Felgo 3.0
import QtQuick 2.13

TiledEntityBase {
  id: root

  entityType: "platforma"

  Rectangle {
    id: rectangle

    color: "#252933"
    anchors.fill: parent
  }

  BoxCollider {
    id: collider

    anchors.fill: parent
    bodyType: Body.Static
  }
}
