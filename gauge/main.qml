import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    CircularGauge{
        id: gauge1
        x:100
        y:107
        width: 143
        height: 133
        minimumValue: 0
        value: 50
        maximumValue: 100

        style: CircularGaugeStyle
        {
            labelInset: outRadius * -0.2

            tickmarkLabel: Text {
                id: data
                text: styleData.value
                color: sytleData.value >= 80 ? "#e34c22" : "#e5e5e5" < 80 ? "#031c12" : "#054525"
                antialiasing: true
            }

            tickmark: Rectangle
            {
                visible: styleData.value < 80 || styleData.value % 10 == 0
                implicitWidth: outerRadius *0.05
                antialiasing: true
                implicitHeight: outerRadius * 0.1
                color:styleDate.value >= 80 ? "#e34c22" : "#e5e5e5" < 80 ? "030c02" : "#050505"

            }
        }

    }

    Gauge {
        id: gauge2
        x:200
        y:107
        minimumValue: 0
        value: 50
        maximumValue: 100
        anchors.centerIn: parent
    }

    Connections{
        id: cppConnection
        target: main.cpp
        ignoreUnknownSignals: true

        function onTxt_box1(text_box_1)
        {
            txt_bx_1.text = text_box_1;
        }

        function onVal_gauge1(gau_1)
        {
            gauge1.value = gau_1;
        }
    }
}
