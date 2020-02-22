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

//    Wall {
//        row: 5
//        column: 3
//        size: 3
//    }

    Platforma {
        row: 5
        column: 4
        size: 7
    }

    Water {
        row: 6
        column: 0
        size: 4
    }

    Ground {
        row: 10
        column: 0
        size: 300
    }
}
