import Felgo 3.0
import QtQuick 2.13

TiledEntityBase {
  id: root

  entityType: "ground"

  Rectangle {
    id: rectangle
    color: "#f5e98d"
    anchors.fill: parent
  }

  BoxCollider {
    id: collider

    anchors.fill: parent
    bodyType: Body.Static
  }
}
