import Felgo 3.0
import QtQuick 2.13

import "../entities"
import "." as Levels

Item {
    height: gameScene.gridSize * 20 // 32 * 10 = 320

    width: 84 * gameScene.gridSize

    LevelBegin {
        row: 0
        column: 3
        size: 5
    }

    Ground {
        row: 0
        column: 0
        size: 12
    }

    Wall {
        row: 10
        column: 3
        size: 3
    }

    Platforma {
        row: 10
        column: 4
        size: 8
    }

    Water {
        row: 11
        column: 0
        size: 6
    }

    Ground {
        row: 17
        column: 0
        size: 20
    }

    LevelEnd {
        row: 37
        column: 3
        size: 1
    }
}
