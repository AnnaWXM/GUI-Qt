import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3



Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Ohm Calculator")

    TextField
    {
        id:txt_box_res_i
        text: "Resistance / \u2126"
        anchors.verticalCenterOffset: -230
        anchors.horizontalCenterOffset: -200
        anchors.centerIn: parent
        background: Rectangle{
            implicitHeight:30
            implicitWidth:150
        }

    }

    TextField
    {
        id:txt_box_res
        placeholderText : "Resistance"
        anchors.verticalCenterOffset: -190
        anchors.horizontalCenterOffset: -200
        anchors.centerIn: parent
        background: Rectangle{
            border.color: "#dcdcdc"
            radius: 5
            implicitHeight:50
            implicitWidth:150
        }

    }

    Button
    {
        id: btn_res
        text: qsTr("Calculate Resistance")
        anchors.verticalCenterOffset: -190
        anchors.horizontalCenterOffset: -30
        anchors.centerIn: parent
        background: Rectangle
        {
            border.color:"#c0c0c0"
            radius: 5
            implicitHeight:50
            implicitWidth:100
        }

        onClicked:
        {
            calculatorinterface.calResis(txt_box_volt.text, txt_box_amps.text);
        }
    }

    TextField
    {
        id:txt_box_volt_i
        text: "Volatage / V"
        anchors.verticalCenterOffset: -120
        anchors.horizontalCenterOffset: -200
        anchors.centerIn: parent
        background: Rectangle{
            implicitHeight:30
            implicitWidth:150
        }

    }

    TextField
    {
        id:txt_box_volt
        placeholderText : "Volatage"
        anchors.verticalCenterOffset: -80
        anchors.horizontalCenterOffset: -200
        anchors.centerIn: parent
        background: Rectangle{
            border.color: "#dcdcdc"
            radius: 5
            implicitHeight:50
            implicitWidth:150
        }

    }

    Button
    {
        id: btn_volt
        text: qsTr("Calculate Volatage")
        anchors.verticalCenterOffset: -80
        anchors.horizontalCenterOffset: -30
        anchors.centerIn: parent
        background: Rectangle
        {
            border.color:"#c0c0c0"
            radius: 5
            implicitHeight:50
            implicitWidth:100
        }

        onClicked:
        {
            calculatorinterface.calVolt(txt_box_res.text, txt_box_amps.text);
        }
    }

    TextField
    {
        id:txt_box_amps_i
        text: "Current / amps"
        anchors.verticalCenterOffset: -10
        anchors.horizontalCenterOffset: -200
        anchors.centerIn: parent
        background: Rectangle{
            implicitHeight:30
            implicitWidth:150
        }

    }

    TextField
    {
        id:txt_box_amps
        placeholderText : "Current"
        anchors.verticalCenterOffset: 30
        anchors.horizontalCenterOffset: -200
        anchors.centerIn: parent
        background: Rectangle{
            border.color: "#dcdcdc"
            radius: 5
            implicitHeight:50
            implicitWidth:150
        }

    }

    Button
    {
        id: btn_amps
        text: qsTr("Calculate Current")
        anchors.verticalCenterOffset: 30
        anchors.horizontalCenterOffset: -30
        anchors.centerIn: parent
        background: Rectangle
        {
            border.color:"#c0c0c0"
            radius: 5
            implicitHeight:50
            implicitWidth:100
        }

        onClicked:
        {
            calculatorinterface.calAmp(txt_box_res.text, txt_box_volt.text);
            console.log("New data:", txt_box_amps.text)
        }
    }


    Connections
    {
        target:calculatorinterface
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
