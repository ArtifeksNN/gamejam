import Felgo 3.0
import QtQuick 2.13

EntityBase {
  id: root

  entityType: "ground"

  Rectangle {
    id: rectangle
    color: "green"
    anchors.fill: parent
  }

  BoxCollider {
    id: collider
    anchors.fill: parent
    bodyType: Body.Static // the body shouldnt move
  }
}
