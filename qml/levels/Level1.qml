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
        column: 3
        size: 10
    }


    Water {
        row: 11
        column: 0
        size: 6
    }


    Ground {
        row: 17
        column: 0
        size: 4
    }

    Wall {
        row: 19
        column: 6
        size: 6
    }


    Platforma {
        row: 19
        column: 6
        size: 6
    }

    Wall {
        row: 31
        column: 5
        size: 6
    }

    Platforma {
        row: 29
        column: 4
        size: 2
    }

    Wall {
        row: 34
        column: 8
        size: 4
    }

    Platforma {
        row: 31
        column: 9
        size: 4
    }

    Platforma {
        row: 35
        column: 1
        size: 3
    }

    Ground {
        row: 35
        column: 0
        size: 8
    }

    Wall {
        row: 43
        column: 7
        size: 8
    }

    Platforma {
        row: 44
        column: 7
        size: 14
    }

    LevelEnd {
        row: 49
        column: 8
        size: 1
    }

    Wall {
        row: 45
        column: 5
        size: 5
    }

    Wall {
        row: 46
        column: 4
        size: 1
    }

    Wall {
        row: 47
        column: 3
        size: 1
    }

    Wall {
        row: 48
        column: 5
        size: 5
    }

    Wall {
        row: 50
        column: 5
        size: 5
    }

    Wall {
        row: 52
        column: 5
        size: 5
    }

    Wall {
        row: 53
        column: 5
        size: 1
    }

    Wall {
        row: 53
        column: 1
        size: 1
    }

    Wall {
        row: 55
        column: 5
        size: 5
    }

    Wall {
        row: 56
        column: 5
        size: 1
    }

    Wall {
        row: 56
        column: 3
        size: 1
    }

    Wall {
        row: 56
        column: 1
        size: 1
    }

}
