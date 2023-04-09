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

    property int xpos:40
    property int ypos:50
    property int rot:0

    Image {
        id: backSky
        anchors.fill: parent
        source: "skyGrass.jpg"
        z: -1

    }

    Image
    {
        id: heli_to_go
        x: xpos
        y: ypos
        width:420
        height:126
        source:"heli_png.png"

        transform: Rotation { origin.x: 210; origin.y: 63; axis { x: 0; y: 1; z: 0 } angle: rot }


    }


    Button
    {
        id: butt_hori_back
        text: qsTr("<<<")
        width: 55
        height: 20

        onClicked:
        {
            xpos=xpos-5
        }

        anchors {
            left: parent.left
            leftMargin: 50
            bottom: parent.bottom
            bottomMargin: 110
        }

    }

    Button
    {
        id: butt_hori_forward
        text: qsTr(">>>")
        width: 55
        height: 20

        onClicked:
        {
            xpos=xpos+5
        }
        anchors {
            left: butt_rot.right
            leftMargin: 10
            bottom: parent.bottom
            bottomMargin: 110
        }

    }

    Button
    {
        id: butt_vert_up
        text: qsTr("<<<")
        x: 15
        y: 120
        width: 55
        height: 20
        rotation:90

        onClicked:
        {
            ypos=ypos-5
        }
        anchors {

            horizontalCenter: butt_rot.horizontalCenter
            bottom: butt_rot.top
            bottomMargin: 30
        }

    }

    Button
    {
        id: butt_vert_down
        text: qsTr("<<<")
        x: 15
        y: 120
        width: 55
        height: 20
        rotation:270

        onClicked:
        {
            ypos=ypos+5
        }
        anchors {

            horizontalCenter: butt_rot.horizontalCenter
            top: butt_rot.bottom
            topMargin: 30
        }

    }

    Button
    {
        id: butt_rot
        text: qsTr("Rot")
        x: 80
        y: 120
        width: 55
        height: 20

        onClicked:
        {
            rot+=5
        }
        anchors {
            left: butt_hori_back.right
            leftMargin: 10
            bottom: parent.bottom
            bottomMargin: 110
        }

    }

   Rectangle{

       id:joystick_area

       x:100
       y:400

       width:100
       height:width
       radius: width/2

       Rectangle{
           width:8
           height:width
           radius: width/2
           color: "green"
           anchors.horizontalCenter: joystick_area.horizontalCenter
           anchors.verticalCenter: joystick_area.verticalCenter


       }

       Rectangle{
           id: move_target
           width:4
           height:width
           radius: width/2
           color: "red"
           anchors.horizontalCenter: joystick_area.horizontalCenter
           anchors.verticalCenter: joystick_area.verticalCenter
           MouseArea
           {
               id:joystick_con
               anchors.fill:parent
               drag.target: move_target
               drag.minimumX: 0
               drag.maximumX: joystick_area.width - move_target.width
               drag.minimumY: 0
               drag.maximumY: joystick_area.height - move_target.width
               onPositionChanged:
               {
                   console.log("x: "+ mouse.x + "y: "+mouse.y)
               }
           }
       }


   }

}
