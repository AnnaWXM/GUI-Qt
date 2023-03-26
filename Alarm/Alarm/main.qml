import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {

    property string arr_up: "file:/Users/annnwu/Desktop/github/GUI-Qt/Alarm/Alarm/images.png";

    width: 640
    height: 480
    visible: true
    title: qsTr("NIKKEI ALARM")

    Item {

        x:40
        y:40
        width:50
        height:30

        Button{
            id: up_button
            anchors.fill:parent
        }

        Image{
            anchors.fill:parent
            source:arr_up
        }
    }

    Button {
        id: snooze_button
        x: 100
        y: 30
        width: 200
        height: 50
        text: qsTr("Snooze-Light")
    }

    Item {

        x:310
        y:40
        width:50
        height:30
        Button{
            id: down_button
            anchors.fill:parent
        }

        Image{
            anchors.fill:parent
            source:arr_up
            rotation: 180
        }
    }

    RoundButton {
        id: alm_button
        x: 500
        y: 30
        width: 100
        height: 50
        radius:10
        text: qsTr("ALM SET")
        onClicked: {
            myapp.func_almset_btn_clk();
        }
    }

    RoundButton {
        id: set_button
        x: 500
        y: 100
        width: 100
        height: 50
        radius:10
        text: qsTr("SET")
        onClicked: {
            myapp.func_set_btn_clk();
        }
    }

    Text {
        id: brand
        x:180
        y:120
        text: "NIKKEI"
        font.pointSize: 16
    }


    Rectangle {
        x: 60
        y: 150
        width: 280
        height: 100
        color: "lightgrey"
        border.color: "grey"
        Text{
            id:realtime
            text:"00:00"
            font.pointSize: 50
        }

    }

    Text {
        id: am_pm
        x:80
        y:220
        text: "AM"
        font.pointSize: 16
    }

    Rectangle {
        x: 60
        y: 250
        width: 80
        height: 50
        color: "lightgrey"
        border.color: "grey"
        Text{
            id:daymonth
            text:"1/1"
            font.pointSize: 30
        }



    }

    Rectangle {
        x: 140
        y: 250
        width: 65
        height: 50
        color: "lightgrey"
        border.color: "grey"
        Text{
            id:week
            text:"THU"
            font.pointSize: 30
        }

    }

    Rectangle {
        x: 205
        y: 250
        width: 135
        height: 50
        color: "lightgrey"
        border.color: "grey"
        Text{
            id:temphumi
            text:"23C59%"
            font.pointSize: 30
        }

    }

    Text {
        id: state_box
        x:500
        y:220
        text: "Initial state"
        font.pointSize: 16
    }



    Connections
    {
        target:myapp
        ignoreUnknownSignals: true
        function onSendMess1(date_value){
            daymonth.text=date_value;
        }
        function onSendMess2(state_str){
            state_box.text = state_str;
        }
        function onSendMess3(am_pm_str){
            am_pm.text = am_pm_str;
        }

    }

}
