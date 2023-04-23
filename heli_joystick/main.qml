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
    //bool for gameover
    property bool gameOver: false
    property int fall_Speed:200



    Image {
        id: backSky
        anchors.fill: parent
        source: "skyGrass.jpg"
        z: -1

    }

    Item{
        id: heli_to_go
        x: xpos
        y: ypos
        width:75
        height:75

        Image
        {
            width:75
            height:75
            id: heli_to_go_image
            source:"fighter.png"
            //transform: Rotation { origin.x: 210; origin.y: 63; axis { x: 0; y: 1; z: 0 } angle: rot }

        }

    }



    Item {
        id: obs1
        width: 80
        height: 80
        x: Math.random() * (parent.width - width)
        y: -height

        Timer {
            id: obs1_timer

            interval: fall_Speed
            running: false
            repeat: true
            onTriggered: {

                obs1.y += 10 // move down 10 pixels
                if (obs1.y >= 770) {
                    obs1.y = -obs1.height // start from top again
                    obs1.x = Math.random() * 1880 // randomize x position
                    console.log("1:"+obs1.x)

                }

                obs2_timer.start()

            }
        }
        Image
        {
            width: 80
            height: 80
            id: apple_1
            source:"apple.png"

        }

    }

    Item {
        id: obs2
        width: 80
        height: 80
        x: Math.random() * (parent.width - width)
        y: -height

        Timer {
            id: obs2_timer

            interval: fall_Speed
            running: false
            repeat: true
            onTriggered: {

                obs2.y += 10 // move down 10 pixels
                if (obs2.y >= 770) {
                    obs2.y = -obs2.height // start from top again
                    obs2.x = Math.random() * 1880 // randomize x position
                    console.log("2:"+obs2.x)

                }

                obs3_timer.start(10000)

            }
        }
        Image
        {
            width: 80
            height: 80
            id: apple_2
            source:"apple.png"

        }

    }

    Item {
        id: obs3
        width: 80
        height: 80
        x: Math.random() * (parent.width - width)
        y: -height

        Timer {
            id: obs3_timer

            interval: fall_Speed
            running: false
            repeat: true
            onTriggered: {
                obs3.y += 10 // move down 10 pixels
                if (obs3.y >= 770) {
                    obs3.y = -obs3.height // start from top again
                    obs3.x = Math.random() * 1880 // randomize x position
                }

            }
        }
        Image
        {
            width: 80
            height: 80
            id: apple_3
            source:"apple.png"

        }

    }

    Item {
        id: obs4
        width: 80
        height: 80
        x: Math.random() * (parent.width - width)
        y: -height

        Timer {
            id: obs4_timer

            interval: fall_Speed
            running: false
            repeat: true
            onTriggered: {
                obs4.y += 10 // move down 10 pixels
                if (obs4.y >= 770) {
                    obs4.y = -obs4.height // start from top again
                    obs4.x = Math.random() * 1880 // randomize x position
                }
            }
        }
        Image
        {
            width: 80
            height: 80
            id: apple_4
            source:"apple.png"

        }
    }

    Item {
        id: obs5
        width: 80
        height: 80
        x: Math.random() * (parent.width - width)
        y: -height

        Timer {
            id: obs5_timer
            interval: fall_Speed
            running: false
            repeat: true
            onTriggered: {
                obs5.y += 10 // move down 10 pixels
                if (obs5.y >= 770) {
                    obs5.y = -obs5.height // start from top again
                    obs5.x = Math.random() * 1880 // randomize x position
                }
            }
        }
        Image
        {
            width: 80
            height: 80
            id: apple_5
            source:"apple.png"

        }

    }
    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            if (heli_to_go.collidesWith(obs1) || heli_to_go.collidesWith(obs2)||
                    heli_to_go.collidesWith(obs3)|| heli_to_go.collidesWith(obs4)|| heli_to_go.collidesWith(obs5))
            {
                console.log("Overlap detected!")
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
                    heli_joystick.flyingT()
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

                    console.log("x: "+ move_target.x + " y: "+move_target.y)
                    console.log("speedX: "+ speedX + " speedY: "+speedY)
                    console.log("xpos: "+ xpos + " ypos: "+ypos)

                }
            }


        }

        Button {
            text: "Start"
            onClicked: {
                trigger_sequence.start()
                trigger_sequence.repeat=true

            }
        }

        Button {
            text: "Pause"
            onClicked: {
                obs1_timer.stop()
                obs2_timer.stop(1000)
                obs3_timer.stop(2000)
                obs4_timer.stop(3000)
                obs5_timer.stop(4000)
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

                rectangleCount = 0
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

