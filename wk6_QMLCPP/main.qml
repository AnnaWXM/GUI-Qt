import QtQuick 2.15
import QtQuick.Window 2.15

import QtQuick.Controls 2.3

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text
    {
        id:txt_box
        text: "Start display"
        anchors.verticalCenterOffset: -170
        anchors.horizontalCenterOffset: -204
        anchors.centerIn: parent

    }

    Button
    {
        id: btn_on
        text: qsTr("on")
        anchors.verticalCenterOffset: -118
        anchors.horizontalCenterOffset: -192
        anchors.centerIn: parent

//        background: Rectangle
//        {
//            color: btn_on.pressed ? "grey" : "grey"
//        }
        onClicked:
        {
            myapp.func_btn_clk_on()

            btn_on.enabled=true;
            btn_on.bgColor= "green"
            btn_off.enabled=false;
//            btn_off.bgColor= "grey"

        }
    }
    Button
    {
        id: btn_off
        text: qsTr("off")
        anchors.verticalCenterOffset: -118
        anchors.horizontalCenterOffset: -50
        anchors.centerIn: parent
//        background: Rectangle
//        {
//            color: btn_off.pressed ? "grey" : "red"
//        }

        onClicked:
        {
            myapp.func_btn_clk_off()

            btn_off.enabled=true;
            btn_off.bgColor= "green"
            btn_on.enabled=false;
//            btn_on.bgColor= "grey"

        }
    }
    Connections
    {
        target:myapp
        ignoreUnknownSignals: true
        function onSendMess(text_box_str){
            txt_box.text = text_box_str
        }
    }
    }
