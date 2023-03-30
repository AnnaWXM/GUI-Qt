import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3



Window {
    width: 900
    height: 900
    visible: true
    title: qsTr("Colors and Graphs")

    property int xpos:40
    property int ypos:50
    property int rot:0


    Rectangle
    {
        x:10
        y:10

        id: rect1
        width: 200
        height:200
        color:"blue"
    }

    Rectangle
    {
        x:30
        y:30

        id: circle1
        width: 150
        height: 150
        color:"grey"
        radius: width / 2
    }

    Canvas
    {
        id: canvas1
        width: 200
        height: 200
        x: 10
        y: 350

        onPaint:
        {
            var ctx = getContext("2d")

            ctx.fillStyle= "pink"
            ctx.fillRect(0,0, 150 ,150)

            ctx.lineWidth = 2
            ctx.strokeStyle = "red"

            ctx.beginPath()

            ctx.moveTo(10, 140)
            ctx.lineTo(10, 10)
            ctx.lineTo(140, 140)
            ctx.lineTo(10, 140)
            ctx.stroke()


        }
    }

    Canvas
    {
        id: canvas2
        width: 200
        height: 200
        x: 230
        y: 350

        onPaint:
        {
            var ctx = getContext("2d")

            ctx.fillStyle= "pink"
            ctx.fillRect(0,0, 150 ,150)

            ctx.lineWidth = 2
            ctx.strokeStyle = "red"

            ctx.beginPath()
            ctx.fillStyle = "light blue"
            ctx.arc(75, 75, 50, 0, Math.PI*2, false);
            ctx.fill();
            ctx.stroke()


        }
    }


    Canvas
    {
        id: canvas3
        width: 200
        height: 200
        x: 450
        y: 350
        onPaint:
        {
            var ctx = getContext("2d")

            ctx.fillStyle= "pink"
            ctx.fillRect(0,0, 150 ,150);
        }


        Rectangle
        {
            x: xpos
            y: ypos

            id: block_rect
            width: 70
            height: 10
            color:"blue"
            rotation: rot
        }

        Button
        {
            id: butt_hori
            text: qsTr("<<<")
            x: 15
            y: 120
            width: 55
            height: 20

            onClicked:
            {
                xpos=xpos-5
            }

        }

        Button
        {
            id: butt_rot
            text: qsTr("rot")
            x: 80
            y: 120
            width: 55
            height: 20

            onClicked:
            {
                rot+=5
            }

        }
    }

    Canvas
    {
        id: canvas4
        width: 200
        height: 200
        x: 670
        y: 350

        onPaint:
        {
            var ctx = getContext("2d")

            ctx.fillStyle= "pink"
            ctx.fillRect(0,0, 150 ,150)
        }

        Rectangle
        {
            x: 40
            y: 60

            id: rect_ani
            width: 70
            height: 10
            color:"blue"

            NumberAnimation
            {
                running: true
                loops: Animation.Infinite
                id: ra1
                target: rect_ani
                property: "rotation"
                duration: 2000
                from:0
                to: 360
            }

        }
    }

    Canvas
  {
        id: canvas5
        width: 200
        height: 200
        x: 670
        y: 600

        onPaint:
        {
            var ctx = getContext("2d")

            ctx.fillStyle= "pink"
            ctx.fillRect(0,0, 150 ,150)
        }


        Rectangle
        {
            x:20
            y:20

            id: circle2
            width: 110
            height: 110
            radius: width / 2

            gradient: Gradient
            {
                GradientStop
                {
                    position: 0.0
                    SequentialAnimation on color
                    {
                        loops: Animation.Infinite

                        ColorAnimation {
                            from: "#eaddcf"
                            to: "#716040"
                            duration: 5000
                        }
                        ColorAnimation {
                            from: "#716040"
                            to: "#eaddcf"
                            duration: 5000
                        }
                    }
                }
            }

        }
    }

    Connections
    {
        target:color_graph
        ignoreUnknownSignals: true
        function onSendMess_res(text_box_str){
            txt_box_res.text = text_box_str
        }
        function onSendMess_volt(text_box_str2){
            txt_box_volt.text = text_box_str2
        }
        function onSendMess_amps(text_box_str3){
            txt_box_amps.text = text_box_str3
        }
    }
}



