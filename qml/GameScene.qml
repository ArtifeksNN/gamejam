import Felgo 3.0
import QtQuick 2.13

import "entities"
import "common"
import "levels"

Scene {
    id: gameScene

    property bool isFocusMode: true
    property int offsetBeforeScrollingStarts: 240
    property bool isNight: true

    Component.onCompleted: enemyAnimation.startAnimation()

    onIsNightChanged: {
        console.log("day night change", isNight)
        enemyAnimation.stopAnimation()
        enemyAnimation.startAnimation()
    }

    width: 960
    height: 640

    gridSize: 64

    function showGameOverPopup() {
        gameOverPopup.visible = true
    }

    function showWinPopup() {
        winPopup.visible = true
    }

    EntityManager {
        id: entityManager
    }

    FarBackground {
        id: farBackground

        anchors.fill: parent
        isFocusMode: gameScene.isFocusMode
    }

    Item {
        id: viewPort

        height: level.height
        width: level.width
        anchors.bottom: gameScene.gameWindowAnchorItem.bottom

        x: player.x > offsetBeforeScrollingStarts ?
               offsetBeforeScrollingStarts - player.x : 0

        PhysicsWorld {
            id: physicsWorld

            gravity.y: 9.81
            debugDrawVisible: false

            updatesPerSecondForPhysics: 1000
        }

        Level1 {
            id: level
        }

        Player {
            id: player

            x: 20
            y: 900

            isFocusMode: gameScene.isFocusMode

            maxSpeed: gameScene.isFocusMode ? 10 : 100

            function respawn() {
                player.x = 20
                player.y = 900
                player.health--;
            }
            onXChanged: console.log("x", x)

            onYChanged: {
                console.log("y",y)
                if (player.y >  level.height) {
                    respawn()
                }
            }
            onHealthChanged: {
                if (health === 0) {
                    showGameOverPopup
                }
                console.log("health", player.health)
            }
        }

        EntityBase {
            id: enemy

            x: 860
            y: 800

            entityType: "enemy"

            width: 500
            height: 500

            EnemyAnimation {
                id: enemyAnimation

                anchors.centerIn: parent

            }
            BoxCollider {
                id: enemyCollider

                height: enemy.height
                width: enemy.width

                categories: Box.Category2
                // collide with players
                collidesWith: !gameScene.isNight ? Box.Category1 | Box.Category3 : Box.Category3

                bodyType: Body.Dynamic
                friction: 1.0

                fixture.onBeginContact: {
                    if (!isNight) {
                        player.health--
                        player.respawn()
                    }
                }
            }
        }
    }


    Row {
        id: health

        anchors {
            left: parent.left
            bottom: parent.bottom
        }

        spacing: 10
        Repeater {
            model: player.health
            delegate: Rectangle {
                width: 40
                height: 40
                color: "red"

                Text {
                    text: "+"
                    anchors.centerIn: parent
                    font.pixelSize: 32
                    color: "white"
                }
            }
        }
    }

    Keys.onPressed: {
        hintMovePopup.visible = false
        if (event.key === Qt.Key_Space) {
            hintTransformPopup.visible = false
            gameScene.isFocusMode = !gameScene.isFocusMode
            console.log("focus mode", gameScene.isFocusMode)
        }

        if (event.key === Qt.Key_D) {
            player.moveRight()
        }

        if (event.key === Qt.Key_A) {
            player.moveLeft()
        }

        if (event.key === Qt.Key_W) {
            player.moveUp()
        }

        if (event.key === Qt.Key_S) {
            player.moveDown()
        }
    }

    Keys.onReleased: {

    }

    Popup {
        id: gameOverPopup

        popupText: "GAME OVER"
        popupPicture: "../assets/snail_f_death/snail_f_death.png"
    }

    Popup {
        id: winPopup

        popupText: "YOU WIN"
        popupPicture: "../assets/snail_f_hit/snail_f_hit.png"
    }

    Popup {
        id: hintMovePopup

        popupText: "Use'W', 'A' and 'D' to move"
        visible: true
        onVisibleChanged: if (visible === false) transformTimer.start()
    }

    Timer {
        id: transformTimer

        interval: 2000
        onTriggered: if (isFocusMode) hintTransformPopup.visible = true
    }

    Popup {
        id: hintTransformPopup

        popupText: "Use Key 'Space' to trasform"
    }
}
