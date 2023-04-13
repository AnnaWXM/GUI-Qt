import QtQuick 2.6
import QtQuick.Window 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Gauge")

    CircularGauge{
            id: gauge1
            x:100
            y:107
            width: 143
            height: 133
            minimumValue: 0
            value: 0
            maximumValue: 5

            //Dial {
            //    id: dial1
            //    anchors.fill: parent
            //    value: {


            //    }
            //    maximumValue: 5.0
            //    tickmarkLength:0.05
            //    value: gauge1.value

            //    onValueChanged: {
            //        gauge1.value = value
            //        valueText.text = value.toFixed(2)
            //    }
            //}

            style: CircularGaugeStyle
            {
                labelInset: outerRadius * -0.2

                tickmarkLabel: Text {
                    id: data
                    x: 68
                    y:125
                    font.pixelSize: Math.max(6,outerRadius * 0.2)
                    text: gauge1.value
                    color: gauge1.value >= 3 ? "#e34c22" : "#e5e5e5" < 3 ? "#031c12" : "#054525"
                    antialiasing: true
                }

                tickmark: Rectangle
                {
                    visible: gauge1.value < 3 || gauge1.value % 0.5 == 0
                    implicitWidth: outerRadius *0.05
                    antialiasing: true
                    implicitHeight: outerRadius * 0.1
                    color:gauge1.value >= 3 ? "#e34c22" : "#e5e5e5" < 3 ? "030c02" : "#050505"

                }



            }
        }

    //Gauge {
    //    id: gauge2
    //    x:200
    //    y:107
    //    minimumValue: 0
    //    value: 3
    //    maximumValue: 5
    //    anchors.centerIn: parent
    //}

    Slider {
        id:slider
        x:80
        y:300
        to:5
        value:0
        onValueChanged: {
            gauge1.value = Number(slider.value.toFixed(2))
        }
    }

    Connections{                     // useless yet
        id: cppConnection
        target: myapp
        ignoreUnknownSignals: true

        function onSendMess(gauge_value)
        {
            gauge1.value = gauge_value;
            //gauge2.value = gauge_value;
        }

    }
}
