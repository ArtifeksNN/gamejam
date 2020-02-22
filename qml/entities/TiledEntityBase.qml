import Felgo 3.0
import QtQuick 2.0

EntityBase {
  id: tiledEntity
  property int column: 0
  property int row: 0
  property int size // gets set in Platform.qml and Ground.qml

  // instead of directly modifying the x and y values of your tiles, we introduced rows and columns for easier positioning, have a look at Level1.qml on how they are used
  x: row*gameScene.gridSize
  y: level.height - (column+1)*gameScene.gridSize
  width: gameScene.gridSize * size
  height: gameScene.gridSize
}

