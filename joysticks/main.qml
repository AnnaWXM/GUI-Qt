import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Joystick usage")

    Rectangle{
        id: background
        anchors.fill: parent
        Image {
            id: backgroundimage
            source: "/Users/annnwu/Desktop/github/GUI-Qt/joysticks/lake3.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle{             // Circle
        x: 490
        y: 330
        id: js_cpoint

        width:150
        height: 150
        //color: "grey"
        radius: width/2


    }

    Canvas{
        id:canvas
        x: 490
        y: 330
        width:150
        height: 150

        property color

        onPaint:{
            var ctx= canvas.getContext("2d")
            ctx.linWidth = 1;
            ctx.strokeStyle="black"
            ctx.beginPath();
            ctx.fillSytle = "cyan";
            ctx.arc(30,30,20,0,Math.PI*2,false);
            ctx.fill();
            ctx.stroke();

            ctx.beginPath();
            ctx.arc(center.x,center.y,2,0,2*Math.PI);
            ctx.fillSytle = strokeColor;
            ctx.fill();
        }
    }

}
