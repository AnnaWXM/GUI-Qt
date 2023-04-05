import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {

    property string arr_up: "file:///C:/Users/nnnoz/Desktop/test/Alarm/images.png";

    width: 700
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

            onClicked:{
                alarm.Add();
            }
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
        onClicked: {
            alarm.snooze_alarm();
        }
        onPressed: {
            alarm.timer_Activate();
        }

        onReleased:{
            alarm.timer_Stop();
        }
    }

    Item {

        x:310
        y:40
        width:50
        height:30
        Button{
            id: down_button
            anchors.fill:parent
            onClicked:{
                alarm.reduction();
            }
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
        text: qsTr("SET")
        onClicked: {
            alarm.func_almset_btn_clk();
            blink_hr.stop()
            blink_min.stop()
            blink_ampm.stop()
            blink_mt.stop()
            blink_day.stop()
            blink_wk.stop()
        }
    }

    RoundButton {
        id: set_button
        x: 500
        y: 100
        width: 100
        height: 50
        radius:10
        text: qsTr("MODE")
        onClicked: {
            alarm.func_set_btn_clk();                    }

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
        width: 400
        height: 120
        color: "lightgrey"
        border.color: "grey"

        Text{
            id:timehr
            text:"00"
            font.pointSize: 50
            OpacityAnimator {
                id: blink_hr
                target: timehr
                from: 0
                to: 1
                duration: 500
                loops: Animation.Infinite
            }

        }

        Text{
            x: 100
            id:sperator
            text:":"
            font.pointSize: 50
        }

        Text{
            x:150
            id:timemin
            text:"00"
            font.pointSize: 50
            OpacityAnimator {
                id: blink_min
                target: timemin
                from: 0
                to: 1
                duration: 500
                loops: Animation.Infinite
            }
         }

    }

    Text {
        id: am_pm
        x:80
        y:220
        text: "AM"
        font.pointSize: 16
        OpacityAnimator {
            id: blink_ampm
            target: am_pm
            from: 0
            to: 1
            duration: 500
            loops: Animation.Infinite
        }
    }

    Rectangle {
        x: 60
        y: 270
        width: 110
        height: 50
        color: "lightgrey"
        border.color: "grey"
        Text{
            id:day
            text:"1"
            font.pointSize: 30
            OpacityAnimator {
                id: blink_day
                target: day
                from: 0
                to: 1
                duration: 500
                loops: Animation.Infinite
            }
        }

        Text{
            x:45
            id:slash
            text:"/"
            font.pointSize: 30
        }
        Text{
            x: 60
            id:month
            text:"1"
            font.pointSize: 30
            OpacityAnimator {
                id: blink_mt
                target: month
                from: 0
                to: 1
                duration: 500
                loops: Animation.Infinite
            }
        }

    }

    Rectangle {
        x: 170
        y: 270
        width: 110
        height: 50
        color: "lightgrey"
        border.color: "grey"
        Text{
            id:week
            text:"THU"
            font.pointSize: 30
            OpacityAnimator {
                id: blink_wk
                target: week
                from: 0
                to: 1
                duration: 500
                loops: Animation.Infinite
            }
        }


    }

    Rectangle {
        x: 280
        y: 270
        width: 180
        height: 50
        color: "lightgrey"
        border.color: "grey"
        Text{
            id:temp
            text:"23C "
            font.pointSize: 30
        }
        Text{
            x: 90
            id:humi
            text:"59%"
            font.pointSize: 30
        }

    }

    Text {
        id: state_box
        x:500
        y:220
        text: "Initial state"
        font.pointSize: 16
        onTextChanged: {
            if (state_box.text === "change hour") {
                blink_hr.start()
                blink_min.to = 1// Set the final opacity to 1
                blink_min.stop()
                blink_ampm.to = 1// Set the final opacity to 1
                blink_ampm.stop()
                blink_mt.to = 1// Set the final opacity to 1
                blink_mt.stop()
                blink_day.to = 1// Set the final opacity to 1
                blink_day.stop()
                blink_wk.to = 1// Set the final opacity to 1
                blink_wk.stop()


            } else if(state_box.text === "change minute") {
                blink_min.start()
                blink_hr.to = 1// Set the final opacity to 1
                blink_hr.stop()
                blink_ampm.to = 1// Set the final opacity to 1
                blink_ampm.stop()
                blink_mt.to = 1// Set the final opacity to 1
                blink_mt.stop()
                blink_day.to = 1// Set the final opacity to 1
                blink_day.stop()
                blink_wk.to = 1// Set the final opacity to 1
                blink_wk.stop()


            } else if(state_box.text === "change 12/24 hours pattern") {
                blink_ampm.start()
                blink_hr.to = 1// Set the final opacity to 1
                blink_hr.stop()
                blink_min.to = 1// Set the final opacity to 1
                blink_min.stop()
                blink_mt.to = 1// Set the final opacity to 1
                blink_mt.stop()
                blink_day.to = 1// Set the final opacity to 1
                blink_day.stop()
                blink_wk.to = 1// Set the final opacity to 1
                blink_wk.stop()


            } else if(state_box.text === "change month") {
                blink_mt.start()
                blink_hr.to = 1// Set the final opacity to 1
                blink_hr.stop()
                blink_min.to = 1// Set the final opacity to 1
                blink_min.stop()
                blink_ampm.to = 1// Set the final opacity to 1
                blink_ampm.stop()
                blink_day.to = 1// Set the final opacity to 1
                blink_day.stop()
                blink_wk.to = 1// Set the final opacity to 1
                blink_wk.stop()


            } else if(state_box.text === "change day") {
                blink_day.start()
                blink_hr.to = 1// Set the final opacity to 1
                blink_hr.stop()
                blink_min.to = 1// Set the final opacity to 1
                blink_min.stop()
                blink_ampm.to = 1// Set the final opacity to 1
                blink_ampm.stop()
                blink_mt.to = 1// Set the final opacity to 1
                blink_mt.stop()
                blink_wk.to = 1// Set the final opacity to 1
                blink_wk.stop()


            }
         else if(state_box.text === "change weekday") {
                blink_wk.start()
                blink_hr.to = 1// Set the final opacity to 1
                blink_hr.stop()
                blink_min.to = 1// Set the final opacity to 1
                blink_min.stop()
                blink_ampm.to = 1// Set the final opacity to 1
                blink_ampm.stop()
                blink_mt.to = 1// Set the final opacity to 1
                blink_mt.stop()
                blink_day.to = 1// Set the final opacity to 1
                blink_day.stop()


        }
            else
            {


                blink_hr.to = 1// Set the final opacity to 1
                blink_hr.stop()
                blink_min.to = 1// Set the final opacity to 1
                blink_min.stop()
                blink_ampm.to = 1// Set the final opacity to 1
                blink_ampm.stop()
                blink_mt.to = 1// Set the final opacity to 1
                blink_mt.stop()
                blink_day.to = 1// Set the final opacity to 1
                blink_day.stop()
                blink_wk.to = 1// Set the final opacity to 1
                blink_wk.stop()



            }
        }

        // Text changes when alarm rings
        Text{
            x: -300
            y: 150
            id: alarm_status
            text:"Alarm is off"
            font.pointSize: 30
        }
    }



    Connections
    {
        target:alarm
        ignoreUnknownSignals: true
        function onSendMessHr(hr_value){
            timehr.text=hr_value;
        }
        function onSendMessMin(min_value){
            timemin.text=min_value;
        }
        function onSendMessAmPm(ampm_value){
            am_pm.text=ampm_value;
        }
        function onSendMessDay(day_value){
            day.text=day_value;
        }
        function onSendMessMonth(month_value){
            month.text = month_value;
        }
        function onSendMessWeek(week_str){
            week.text = week_str;
        }
        function onSendMessState(state_str){
            state_box.text = state_str;
        }
        function onSendMessAlarmRinging(alarm_ring_message) {
            alarm_status.text = alarm_ring_message;
        }

    }

}
