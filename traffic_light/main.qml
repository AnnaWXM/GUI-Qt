import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Traffic Light")

    Canvas
    {
        id: canvasall

        anchors.fill: parent

        onPaint:
        {
            var ctx = getContext("2d")

            ctx.fillStyle= "light grey"
            ctx.fillRect(0,0, 640 ,480)

        }

        Button
        {
            id: norm_mode
            text: qsTr("normal mode")
            x: 15
            y: 15
            width: 130
            height: 30
            background: Rectangle
            {
                color:norm_mode.enabled? "#f582ae" :"#f3d2c1"
                radius: 5
                implicitHeight:50
                implicitWidth:100
            }
            onClicked:
            {
                norm_mode.enabled= false;
                night_mode.enabled= true;
                normal_traffic.running = true;
                night_traffic.running=false;

            }

        }

        Button
        {
            id: night_mode
            text: qsTr("night mode")
            x: 150
            y: 15
            width: 130
            height: 30
            background: Rectangle
            {
                color:night_mode.enabled? "#8bd3dd" :"#f3d2c1"
                radius: 5
                implicitHeight:50
                implicitWidth:100
            }
            onClicked:
            {
                norm_mode.enabled=true;
                night_mode.enabled=false ;
                night_traffic.running=true;
                normal_traffic.running = false;

            }

        }

        Rectangle
        {
            id: hori_road
            x: 0
            y: 230
            width: 640
            height: 20
            color:"dark grey"
            border.color:"#172c66"



        }

        Rectangle
        {
            id: verti_road
            x: 300
            y: 0
            width: 20
            height: 640
            color:"dark grey"
            border.color:"#172c66"



        }

        Canvas
        {
            id: traf_hori
            width: 100
            height: 30
            x: 350
            y: 180

            onPaint:
            {
                var lit = getContext("2d")

                lit.fillStyle= "dark grey"
                lit.fillRect(0,0, 300 ,100)

            }

            Rectangle
            {
                x:5
                y:2.5

                id: hori_r
                width: 25
                height: 25
                radius: width / 2
                color:"black"

            }
            Rectangle
            {
                x:38
                y:2.5

                id: hori_y
                width: 25
                height: 25
                radius: width / 2
                color:"black"

            }
            Rectangle
            {
                x:70
                y:2.5

                id: hori_g
                width: 25
                height: 25
                radius: width / 2
                color:"green"

            }
        }

        Canvas
        {
            id: traf_verti
            width: 30
            height:100
            x: 350
            y: 270

            onPaint:
            {
                var lit = getContext("2d")

                lit.fillStyle= "dark grey"
                lit.fillRect(0,0, 300 ,100)

            }
            Rectangle
            {
                x:2.5
                y:5

                id: vert_r
                width: 25
                height: 25
                radius: width / 2
                color:"red"

            }
            Rectangle
            {
                x:2.5
                y:38

                id: vert_y
                width: 25
                height: 25
                radius: width / 2
                color:"black"

            }
            Rectangle
            {
                x:2.5
                y:70

                id: vert_g
                width: 25
                height: 25
                radius: width / 2
                color:"black"

            }
        }

        SequentialAnimation {
            id: normal_traffic
            running: false
            loops: Animation.Infinite

            //changing from green to yellow for horizontal light
            ParallelAnimation {
                PropertyAnimation { target: hori_g; property: "color"; to: "black"; duration: 100 }
                PauseAnimation { duration: 1000 }
                PropertyAnimation { target: hori_y; property: "color"; to: "yellow"; duration: 100 }
            }

            //changing from yellow to red for horizontal light
            ParallelAnimation {
                PropertyAnimation { target: hori_y; property: "color"; to: "black"; duration: 100 }
                PauseAnimation { duration: 1000 }
                PropertyAnimation { target: hori_r; property: "color"; to: "red"; duration: 100 }
            }
            PauseAnimation { duration: 1000 }

            //making the vertical yellow turn on aswell
            PropertyAnimation { target: vert_y; property: "color"; to: "yellow"; duration: 100 }

            PauseAnimation { duration: 1000 }

            //yellow light is on before the vertical traffic light turns green (both red and yellow is on)
            ParallelAnimation {
                PropertyAnimation { target: vert_y; property: "color"; to: "black"; duration: 100 }
                PropertyAnimation { target: vert_r; property: "color"; to: "black"; duration: 100 }
                PropertyAnimation { target: vert_g; property: "color"; to: "green"; duration: 100 }

            }

            PauseAnimation { duration: 1000 }

            //changing from green to yellow for vertical light
            ParallelAnimation {
                PropertyAnimation { target: vert_g; property: "color"; to: "black"; duration: 100 }
                PauseAnimation { duration: 1000 }
                PropertyAnimation { target: vert_y; property: "color"; to: "yellow"; duration: 100 }
            }

            //changing from yellow to red for horizontal light
            ParallelAnimation {
                PropertyAnimation { target: vert_y; property: "color"; to: "black"; duration: 100 }
                PauseAnimation { duration: 1000 }
                PropertyAnimation { target: vert_r; property: "color"; to: "red"; duration: 100 }
            }

            PauseAnimation { duration: 1000 }

            //making the horizontal yellow turn on aswell
            PropertyAnimation { target: hori_y; property: "color"; to: "yellow"; duration: 100 }


            PauseAnimation { duration: 1000 }


            //yellow light is on before the vertical traffic light turns green (both red and yellow is on)
            ParallelAnimation {
                PropertyAnimation { target: hori_y; property: "color"; to: "black"; duration: 100 }
                PropertyAnimation { target: hori_r; property: "color"; to: "black"; duration: 100 }
                PropertyAnimation { target: hori_g; property: "color"; to: "green"; duration: 100 }

            }

            PauseAnimation { duration: 1000 }


        }

        //night mode, which both only the yellow light is blinking
        SequentialAnimation {
            id: night_traffic
            running: false
            loops: Animation.Infinite
            //off for all the green and red lights
            PropertyAnimation { target: hori_g; property: "color"; to: "black"; duration: 100 }
            PropertyAnimation { target: hori_r; property: "color"; to: "black"; duration: 100 }
            PropertyAnimation { target: vert_g; property: "color"; to: "black"; duration: 100 }
            PropertyAnimation { target: vert_r; property: "color"; to: "black"; duration: 100 }

            ParallelAnimation {
                PropertyAnimation { target: hori_y; property: "color"; to: "black"; duration: 100 }
                PropertyAnimation { target: vert_y; property: "color"; to: "black"; duration: 100 }

            }
            PauseAnimation { duration: 1000 }

            ParallelAnimation {
                PropertyAnimation { target: hori_y; property: "color"; to: "yellow"; duration: 100 }
                PropertyAnimation { target: vert_y; property: "color"; to: "yellow"; duration: 100 }

            }



        }


    }


}
