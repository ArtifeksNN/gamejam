import QtQuick 2.13

Item {
    id: root

    function startAnimation() {
        animation.start()
    }

    function stopAnimation() {
        animation.stop()
        night.visible = false
        day.visible = false

    }

    SequentialAnimation {
        id: animation

        ScriptAction {
            script: {
                if (gameScene.isNight) {
                    console.log("start")
                    night.visible = true
                    night.jumpTo("idle1");
                    night.goalSprite = "idle3";
                } else {
                    day.visible = true
                    day.jumpTo("idle1");
                    day.goalSprite = "idle8";
                }
            }
        }
        NumberAnimation { duration: 800; }
    }

    SpriteSequence {
        id: day

        width: 500
        height: 500

        visible: false
        anchors.centerIn: parent

//        anchors.horizontalCenter: parent.horizontalCenter
        interpolate: false

        Sprite {
            name: "idle1"
            source: "../../assets/day_enemy_f_idle/day_enemy_f_idle_01.png"
            frameCount: 1
            frameWidth: 500
            frameHeight: 500
            frameDuration: 50
            to: { "idle2":1 }
        }

        Sprite {
            name: "idle2"
            source: "../../assets/day_enemy_f_idle/day_enemy_f_idle_02.png"
            frameCount: 1
            frameWidth: 500
            frameHeight: 500
            frameDuration: 50
            to: { "idle3":1 }
        }

        Sprite {
            name: "idle3"
            source: "../../assets/day_enemy_f_idle/day_enemy_f_idle_03.png"
            frameCount: 1
            frameWidth: 500
            frameHeight: 500
            frameDuration: 50
            to: { "idle4":1 }
        }

        Sprite {
            name: "idle4"
            source: "../../assets/day_enemy_f_idle/day_enemy_f_idle_04.png"
            frameCount: 1
            frameWidth: 500
            frameHeight: 500
            frameDuration: 50
            to: { "idle5":1 }
        }

        Sprite {
            name: "idle5"
            source: "../../assets/day_enemy_f_idle/day_enemy_f_idle_05.png"
            frameCount: 1
            frameWidth: 500
            frameHeight: 500
            frameDuration: 50
            to: { "idle6":1 }
        }

        Sprite {
            name: "idle6"
            source: "../../assets/day_enemy_f_idle/day_enemy_f_idle_06.png"
            frameCount: 1
            frameWidth: 500
            frameHeight: 500
            frameDuration: 50
            to: { "idle7":1 }
        }

        Sprite {
            name: "idle7"
            source: "../../assets/day_enemy_f_idle/day_enemy_f_idle_07.png"
            frameCount: 1
            frameWidth: 500
            frameHeight: 500
            frameDuration: 50
            to: { "idle8":1 }
        }

        Sprite {
            name: "idle8"
            source: "../../assets/day_enemy_f_idle/day_enemy_f_idle_08.png"
            frameCount: 1
            frameWidth: 500
            frameHeight: 500
            frameDuration: 50
            to: { "idle1":1 }
        }
    }

    SpriteSequence {
        id: night

        width: 386
        height: 148

        visible: false

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -220

        interpolate: true

        Sprite {
            name: "idle1"
            source: "../../assets/day_enemy_f_sleep/day_enemy_f_sleep_light_01.png"
            frameCount: 1
            frameWidth: 386
            frameHeight: 148
            frameDuration: 300
            to: { "idle2":1 }
        }

        Sprite {
            name: "idle2"
            source: "../../assets/day_enemy_f_sleep/day_enemy_f_sleep_light_02.png"
            frameCount: 1
            frameWidth: 386
            frameHeight: 148
            frameDuration: 300
            to: { "idle1":1 }
        }
    }
}
