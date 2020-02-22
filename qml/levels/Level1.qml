import Felgo 3.0
import QtQuick 2.13

import "../entities"
import "." as Levels

Item {
    height: gameScene.gridSize * 20 // 32 * 10 = 320

    width: 84 * gameScene.gridSize

    Ground {
        row: 0
        column: 0
        size: 6
    }

    Ground {
        row: 8
        column: 0
        size: 500
    }
}
