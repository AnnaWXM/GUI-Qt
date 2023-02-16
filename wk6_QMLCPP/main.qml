import QtQuick 2.15
import QtQuick.Window 2.15

import QtQuick.Controls 2.3

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("wk 6 Timer Exercise!")

    TextField
    {
        id:txt_box
        text: "Start display"
        anchors.verticalCenterOffset: -190
        anchors.horizontalCenterOffset: -200
        anchors.centerIn: parent
        background: Rectangle{
            border.color: "#dcdcdc"
            radius: 5
            implicitHeight:50
            implicitWidth:100
        }

    }
    TextField
    {
        id:txt_box_timer
        text: "timer off"
        anchors.verticalCenterOffset: -50
        anchors.horizontalCenterOffset: -200
        anchors.centerIn: parent
        background: Rectangle{
            border.color: "#dcdcdc"
            radius: 5
            implicitHeight:50
            implicitWidth:100

        }

    }

    TextField
    {
        id:txt_box_extra
        text: "Deactivated"
        anchors.verticalCenterOffset: 20
        anchors.horizontalCenterOffset: -125
        anchors.centerIn: parent
        background: Rectangle{
            border.color: "#dcdcdc"
            radius: 5
            implicitHeight:50
            implicitWidth:250

        }

    }
    Button
    {
        id: btn_on
        text: qsTr("on")
        anchors.verticalCenterOffset: -120
        anchors.horizontalCenterOffset: -200
        anchors.centerIn: parent
        enabled:true
        background: Rectangle
        {
            color: btn_on.enabled ? "#adff2f": "#dcdcdc"
            border.color:"#c0c0c0"
            radius: 5
            implicitHeight:50
            implicitWidth:100
        }

        onClicked:
        {
           myapp.func_btn_clk_on()
           btn_on.enabled=false;
           btn_off.enabled= true;
            myapp.timer_show()
            timer1.restart()

        }
    }
    Button
    {
        id: btn_off
        text: qsTr("off")
        anchors.verticalCenterOffset: -118
        anchors.horizontalCenterOffset: -60
        anchors.centerIn: parent
        enabled:false
        background: Rectangle
        {
            color: btn_off.enabled ? "#ff69b4" : "#dcdcdc"
            border.color:"#c0c0c0"
            radius: 5
            implicitHeight:50
            implicitWidth:100
        }

        onClicked:
        {
            myapp.func_btn_clk_off()
            btn_off.enabled=false;
            btn_on.enabled=true;
            timer1.stop()
        }
    }

    Item{
        Timer{
            id: timer1
            interval:1000; running: false; repeat :true
            onTriggered:
            {
                myapp.timer_counter()
                myapp.timer_show()
                myapp.timer_extra()
            }

        }
    }
    Connections
    {
        target:myapp
        ignoreUnknownSignals: true
        function onSendMess(text_box_str){
            txt_box.text = text_box_str
        }
        function onSendMess2(text_box_str2){
            txt_box_timer.text = text_box_str2
        }
        function onSendMess3(text_box_str3){
            txt_box_extra.text = text_box_str3
        }
    }
    }
