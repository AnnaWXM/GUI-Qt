import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4



Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Gauge!")
    color: "#FEF5E7"

    property double slider_val


    CircularGauge{
            id: gauge1
            x:150
            y:107
            width: 143
            height: 133
            visible: true
            value: slider_val*20


            style: CircularGaugeStyle
            {
                labelInset: outerRadius * -0.2

                tickmarkLabel: Text {
                    text: (styleData.value/20).toFixed(0)
                    color:(styleData.value >= 60) ? "#0170E5" : "#4AE501"
                    antialiasing: true
                    visible: styleData.value % 20 === 0

                }

                tickmark: Rectangle
                {
                    implicitWidth: outerRadius *0.05
                    antialiasing: true
                    implicitHeight: outerRadius * 0.1
                    color:(styleData.value >= 60) ? "#0170E5" : "#4AE501"
                    visible: styleData.value % 20 === 0

                }



            }
        }

    Gauge {
        id: linear_gauge
        value: slider_val*20
        x:50
        y:107

        style: GaugeStyle
        {

            tickmarkLabel: Text {
                text: (styleData.value/20).toFixed(0)
                color:(styleData.value >= 60) ? "#0170E5" : "#4AE501"
                antialiasing: true
                visible: styleData.value % 20 === 0

            }

            tickmark: Rectangle
            {
                antialiasing: true
                color:(styleData.value >= 60) ? "#0170E5" : "#4AE501"
                visible: styleData.value % 20 === 0

            }        }
    }



    Slider {
        id:slider
        x:130
        y:300
        to:5
        value:0
        onValueChanged: {
            slider_val = Number(slider.value.toFixed(2))
            gauge.func_set_value(slider_val)
        }
    }

    TextArea{
        id:slider_value
        x:130
        y:350
        text:"0.00V"


    }


    Connections{                     // useless yet
        id: cppConnection
        target: gauge
        ignoreUnknownSignals: true

        function onSendMess(gauge_value)
        {
            slider_value.text = gauge_value;
            //gauge2.value = gauge_value;
        }

    }




}
