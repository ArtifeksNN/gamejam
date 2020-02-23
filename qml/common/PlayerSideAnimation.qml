import QtQuick 2.13

Item {
    id: root

    function startAnimation() {
        moveAnimation.start()
    }

    SequentialAnimation {
        id: moveAnimation

        ScriptAction {
            script: {
                idle.visible = false
                if (isMoveRight) {
                    seqImage_r.visible = true
                    seqImage_r.jumpTo("forward1");
                    seqImage_r.goalSprite = "forward3";
                } else {
                    seqImage_l.visible = true
                    seqImage_l.jumpTo("forward1");
                    seqImage_l.goalSprite = "forward3";
                }

                collider.force = isMoveRight ?
                            Qt.point(2500, 0) : Qt.point(-2500, 0)
            }
        }
        NumberAnimation { duration: 700; }
        ScriptAction {
            script: {
                seqImage_r.goalSprite = "";
                seqImage_r.visible = false
                seqImage_l.goalSprite = "";
                seqImage_l.visible = false

                collider.force = Qt.point(0, 0)
                player.horizontalVelocity = 0
                idle.visible = true
            }
        }
    }

    SpriteSequence {
        id: seqImage_r

        width: 232
        height: 139

        visible: false

        anchors.horizontalCenter: parent.horizontalCenter
        interpolate: false

        Sprite {
            name: "forward1"
            source: "../../assets/snail_forward/ulitka_forward_01_r.png"
            frameCount: 1
            frameWidth: 232
            frameHeight: 139
            frameDuration: 100
            to: { "forward2":1 }
        }

        Sprite{
            name: "forward2"
            source: "../../assets/snail_forward/ulitka_forward_02_r.png"
            frameCount: 1
            frameWidth: 232
            frameHeight: 139
            frameDuration: 300
            to: {"forward3":1}

        }

        Sprite{
            name: "forward3"
            source: "../../assets/snail_forward/ulitka_forward_03_r.png"
            frameCount: 1
            frameWidth: 232
            frameHeight: 139
            frameDuration: 200
            to: {"forward3":0}
        }
    }

    SpriteSequence {
        id: seqImage_l

        width: 232
        height: 139

        visible: false

        anchors.horizontalCenter: parent.horizontalCenter
        interpolate: false

        Sprite{
            name: "forward1"
            source: "../../assets/snail_forward/ulitka_forward_01_l.png"
            frameCount: 1
            frameWidth: 232
            frameHeight: 139
            frameDuration: 100
            to: { "forward2":1 }
        }

        Sprite{
            name: "forward2"
            source: "../../assets/snail_forward/ulitka_forward_02_l.png"
            frameCount: 1
            frameWidth: 232
            frameHeight: 139
            frameDuration: 300
            to: {"forward3":1}

        }

        Sprite{
            name: "forward3"
            source: "../../assets/snail_forward/ulitka_forward_03_l.png"
            frameCount: 1
            frameWidth: 232
            frameHeight: 139
            frameDuration: 200
            to: {"forward3":0}
        }
    }
}
