import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {

    property string arr_up: "file:/Users/annnwu/Desktop/hmw2023spring/GUI/Alarm/Alarm/images.png";

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
    }

    RoundButton {
        id: set_button
        x: 500
        y: 100
        width: 100
        height: 50
        radius:10
        text: qsTr("SET")
    }



}
