import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3


Window {
    width: Screen.width
    height: Screen.height
    maximumHeight: Screen.height * 0.9
    visible: true
    title: qsTr("Helicopter Flying with Joy Stick!")

    //postition variable for the moving object

    property double xpos:Screen.width/2
    property double ypos:Screen.height/2 *0.9
    property int rot:0

    //initializing the speed porportion variable
    property double speedX: 0
    property double speedY: 0
    //controlling the max speed of movement
    property double speed_var:80

    //for the obsticle creation
    property int rectangleCount:0
    //bool for hitting target
    property bool catchedApple:false

    //property bool gameOver: false
    property int fall_Speed:100
    property int fall_distance:5

    //score accumulator
    property int scoreA:0
    property int lifeLeft:5
    property int levelInt:1
    property int levelUp:0


    //for overlap detection
    function detectCollision(item1, item2) {
        return item1.x < item2.x + item2.width &&
                item1.x + item1.width > item2.x &&
                item1.y < item2.y + item2.height &&
                item1.y + item1.height > item2.y
    }


    Image {
        id: backSky
        anchors.fill: parent
        source: "skyGrass.jpg"
        z: -1

    }

    Image{
        id: heli_to_go
        x: xpos
        y: ypos
        width:75
        height:75
        source:"fighter.png"

    }

    Image{
        id: lifeInt
        x: 50
        y: 50
        width:30
        height:30
        source:"heart.png"

    }
    Rectangle{
        id: lifeIntText
        x: 100
        y: 50
        width:80
        height:30
        border.width: 1
        border.color: "black"
        Text {
            anchors.centerIn: parent
            text: lifeLeft
            color: "black"
            font.family: "Arial"
            font.pixelSize: 20
            font.bold: true
        }
    }
    Image{
        id: scoreTotal
        x: 200
        y: 50
        width:30
        height:30
        source:"coin.png"

    }
    Rectangle{
        id: scoreTotalText
        x: 250
        y: 50
        width:80
        height:30
        border.width: 1
        border.color: "black"
        Text {
            anchors.centerIn: parent
            text: scoreA
            color: "black"
            font.family: "Arial"
            font.pixelSize: 20
            font.bold: true
        }
    }
    Image{
        id: levelIntImage
        x: 340
        y: 50
        width:50
        height:30
        source:"level_c.png"

    }
    Rectangle{
        id: levelIntText
        x: 410
        y: 50
        width:80
        height:30
        border.width: 1
        border.color: "black"
        Text {
            anchors.centerIn: parent
            text: levelInt
            color: "black"
            font.family: "Arial"
            font.pixelSize: 20
            font.bold: true
        }    }

    Image {
        id: obs1
        width: 80
        height: 80
        x: Math.random() * (parent.width - width)
        y: -height
        source:"apple.png"

        Timer {
            id: obs1_timer

            interval: fall_Speed
            running: false
            repeat: true
            onTriggered: {

                obs1.y += fall_distance // move down distance
                if (obs1.y >= 770|| detectCollision(heli_to_go, obs1)) {
                    if (detectCollision(heli_to_go, obs1)){
                        scoreA+=1
                        levelUp+=1
                        console.log("scoreA:"+scoreA)

                    }
                    else{
                    lifeLeft-=1
                        console.log("lifeLeft:"+lifeLeft)
                    }
                    obs1.y = -obs1.height // start from top again
                    obs1.x = Math.random() * 1880 // randomize x position

                }
            }
        }


    }

    Image {
        id: obs2
        width: 80
        height: 80
        x: Math.random() * (parent.width - width)
        y: -height
        source:"apple.png"

        Timer {
            id: obs2_timer

            interval: fall_Speed
            running: false
            repeat: true
            onTriggered: {

                obs2.y += fall_distance // move down distance
                if (obs2.y >= 770|| detectCollision(heli_to_go, obs2)) {
                    if (detectCollision(heli_to_go, obs2)){
                        scoreA+=1
                        levelUp+=1
                        console.log("scoreA:"+scoreA)

                    }
                    else{
                    lifeLeft-=1
                        console.log("lifeLeft:"+lifeLeft)
                    }
                    obs2.y = -obs2.height // start from top again
                    obs2.x = Math.random() * 1880 // randomize x position
                }
            }
        }


    }

    Image {
        id: obs3
        width: 80
        height: 80
        x: Math.random() * (parent.width - width)
        y: -height
        source:"apple.png"

        Timer {
            id: obs3_timer

            interval: fall_Speed
            running: false
            repeat: true
            onTriggered: {
                obs3.y += fall_distance // move down distance
                if (obs3.y >= 770|| detectCollision(heli_to_go, obs3)) {
                    if (detectCollision(heli_to_go, obs3)){
                        scoreA+=1
                        levelUp+=1
                        console.log("scoreA:"+scoreA)

                    }
                    else{
                    lifeLeft-=1
                        console.log("lifeLeft:"+lifeLeft)
                    }
                    obs3.y = -obs3.height // start from top again
                    obs3.x = Math.random() * 1880 // randomize x position
                }

            }
        }


    }

    Image {
        id: obs4
        width: 80
        height: 80
        x: Math.random() * (parent.width - width)
        y: -height
        source:"apple.png"

        Timer {
            id: obs4_timer

            interval: fall_Speed
            running: false
            repeat: true
            onTriggered: {
                obs4.y += fall_distance // move down distance
                if (obs4.y >= 770 || detectCollision(heli_to_go, obs4)) {
                    if (detectCollision(heli_to_go, obs4)){
                        scoreA+=1
                        levelUp+=1
                        console.log("scoreA:"+scoreA)

                    }
                     else{
                    lifeLeft-=1
                        console.log("lifeLeft:"+lifeLeft)
                    }
                    obs4.y = -obs4.height // start from top again
                    obs4.x = Math.random() * 1880 // randomize x position
                }
            }
        }

    }

    Image {
        id: obs5
        width: 80
        height: 80
        x: Math.random() * (parent.width - width)
        y: -height
        source:"apple.png"

        Timer {
            id: obs5_timer
            interval: fall_Speed
            running: false
            repeat: true
            onTriggered: {
                obs5.y += fall_distance // move down distance
                if (obs5.y >= 770 || detectCollision(heli_to_go, obs5)) {
                    if (detectCollision(heli_to_go, obs5)){
                        scoreA+=1
                        levelUp+=1
                        console.log("scoreA:"+scoreA)

                    }
                    else{
                    lifeLeft-=1
                        console.log("lifeLeft:"+lifeLeft)
                    }
                    obs5.y = -obs5.height // start from top again
                    obs5.x = Math.random() * 1880 // randomize x position
                }
            }
        }


    }



    //checking for level up or game over
    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            if (levelUp>=10){
                levelUp=0;
                levelInt+=1;
                //adding distance to the fall == moving faster
                fall_distance+=5;
                console.log("Level UP!")

            }

            if(lifeLeft<=0)
            {
                backSky.source="game_over.png"
                obs1_timer.stop()
                obs2_timer.stop()
                obs3_timer.stop()
                obs4_timer.stop()
                obs5_timer.stop()
                obs1.y = -obs1.height
                obs2.y = -obs2.height
                obs3.y = -obs3.height
                obs4.y = -obs4.height
                obs5.y = -obs5.height
                console.log("Game Over!")
            }
        }
    }

    Timer{
        id: trigger_sequence
        interval: 2000
        running:false
        repeat: true
        property int i : 0
        onTriggered: {
            if (i === 0) {
                obs1_timer.start();
            } else if (i === 1) {
                obs2_timer.start();
            } else if (i === 2) {
                obs3_timer.start();
            } else if (i === 3) {
                obs4_timer.start();
            } else if (i === 4) {
                obs5_timer.start();
            }
            else {
                trigger_sequence.repeat=false;
                trigger_sequence.running=false;
                i=-1;
            }
            i++;

        }
    }

    // Buttons to start, pause, and stop the generation of rectangles
    Row {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10


        Rectangle{

            id:joystick_area


            width:150
            height:width
            radius: width/2


            Rectangle{
                width:16
                height:width
                radius: width/2
                color: "#8bd3dd"
                anchors.horizontalCenter: joystick_area.horizontalCenter
                anchors.verticalCenter: joystick_area.verticalCenter
            }

            Timer{
                id: speedTime
                interval: 100
                running: true
                repeat: true
                onTriggered: {
                    xpos+=(speed_var*speedX)
                    if (xpos>1880){
                        xpos=1880;
                    }
                    else if (xpos<0){
                        xpos=0;
                    }
                    ypos+=(speed_var*speedY)
                    if (ypos>720){
                        ypos=720;
                    }
                    else if (ypos<0){
                        ypos=0;
                    }
                }
            }

            Rectangle{
                id: move_target
                x:70
                y:70
                width:10
                height:width
                radius: width/2
                color: "#f582ae"
            }
            MouseArea
            {
                id:joystick_con
                anchors.fill:parent
                drag.target: move_target
                drag.axis: Drag.XAndYAxis
                drag.minimumX: 0
                drag.maximumX: joystick_area.width - move_target.width
                drag.minimumY: 0
                drag.maximumY: joystick_area.height - move_target.width
                drag
                {
                    target: move_target
                    axis: Drag.XAndYAxis
                    minimumX: joystick_area.x - move_target.width / 2
                    maximumX: joystick_area.x + joystick_area.width - move_target.width / 2
                    minimumY: joystick_area.y - move_target.height / 2
                    maximumY: joystick_area.y + joystick_area.height - move_target.height / 2
                }

                onPressed: {
                    move_target.anchors.undefined
                    heli_joystick.flying()
                    speedTime.start()
                }
                onReleased:  {
                    heli_joystick.stopping()
                    move_target.x=70
                    move_target.y=70
                    speedX=0
                    speedY=0

                }

                onPositionChanged:
                {
                    speedX=(move_target.x-70)/70
                    speedY=(move_target.y-70)/70

                }
            }


        }

        Button {
            text: "Start"
            onClicked: {
                trigger_sequence.start()
                trigger_sequence.repeat=true
                backSky.source=skyGrass.jpg

            }
        }

        Button {
            text: "Pause"
            onClicked: {
                obs1_timer.stop()
                obs2_timer.stop()
                obs3_timer.stop()
                obs4_timer.stop()
                obs5_timer.stop()
                console.log("pausing")

            }
        }

        Button {
            text: "Stop"
            onClicked: {
                obs1_timer.stop()
                obs2_timer.stop()
                obs3_timer.stop()
                obs4_timer.stop()
                obs5_timer.stop()
                obs1.y = -obs1.height
                obs2.y = -obs2.height
                obs3.y = -obs3.height
                obs4.y = -obs4.height
                obs5.y = -obs5.height

                console.log("stopping")
                //resetting score
                scoreA = 0
            }
        }
    }



    Connections
    {
        target:heli_joystick
        ignoreUnknownSignals: true
        //if statements to avoid the heli gos off the boundary
        function onSendMessMove(x_value, y_value){
            xpos=xpos+x_value;
            if (xpos>1920){
                xpos=1920;
            }
            else if (xpos<0){
                xpos=0;
            }

            ypos=ypos+y_value;
            if (ypos>972){
                ypos=1920;
            }
            else if (xpos<0){
                ypos=0;
            }
        }



    }
}

