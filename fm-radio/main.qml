import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // Arrow button icon locations
    property string arrow_left : "file:/home/elina/qt-projects/fm-radio/arrow_left.jpeg";
    property string arrow_right : "file:/home/elina/qt-projects/fm-radio/arrow_right.jpeg";

    // Text box for timer number
    /*
    Text {
        id: text_box_2
        text: "Counter text"
        anchors.verticalCenterOffset: -170
        anchors.horizontalCenterOffset: -104
        anchors.centerIn: parent
    }
    */

    // Styling for textbox around count text
    Rectangle {
        width: 150
        height: 80
        color: "lightyellow"
        border.color: "gold"
        x: 240
        y: 100

        // Text box for count number modified with +++ and --- buttons
        Text {
            id: text_box_count
            text: "0"
            //anchors.verticalCenterOffset: -75
            //anchors.horizontalCenterOffset: 0
            anchors.centerIn: parent
            font.pointSize: 30
        }
    }

    /*
    Button {
        id: button
        text: qsTr("My Button")
        anchors.horizontalCenterOffset: -192
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -118
        onClicked: {
            // Call button_click func from c++
            myapp.button_click()
        }
    }
    */

    // Left arrow button
    Item {
        width: 64
        height: 64
        x: 200
        y: 200

        // Minus (---) button
        Button {
            id: button_minus
            anchors.fill: parent
            text: qsTr("---")

            onClicked: {
                // Call button_click func from c++
                myapp.button_click()
            }
            onPressed: {
                myapp.button_pressed("---")
            }
            onReleased: {
                myapp.button_released("---")
            }
            //background: Rectangle {
            //    color: "firebrick"
            //}
        }

        Image {
            id: arrow_left_button
            source: arrow_left
        }
    }

    // Right arrow button
    Item {
        width: 64
        height: 64
        x: 350
        y: 200

        // Plus (+++) button
        Button {
            id: button_plus
            anchors.fill: parent
            text: qsTr("+++")

            onClicked: {
                //myapp.button_click()
            }
            onPressed: {
                myapp.button_pressed("+++")
                myapp.button_click()
            }
            onReleased: {
                myapp.button_released("+++")
            }
            //background: Rectangle {
            //    color: "lightgreen"
            //}
        }

        Image {
            id: arrow_right_button
            source: arrow_right
        }
    }

    // Slider for selecting frequency
    Slider {
        id: slider_frequency
        //value: frequency
        value: text_box_count
        x: 200
        y: 270

        from: 1
        to: 200
        stepSize: 0.1

        onMoved: {
            //text_box_count.text="moved slider"
            text_box_count.text=value
            myapp.get_slider_frequency(value)
        }
    }

    // Radio buttons
    ColumnLayout {
        x: 450
        y: 150

        RadioButton {
            text: qsTr("Off")
        }
        RadioButton {
            text: qsTr("Channel 1")
            onClicked: {
                myapp.set_frequency_radio_button("1")
            }
        }
        RadioButton {
            text: qsTr("Channel 2")
            onClicked: {
                myapp.set_frequency_radio_button("2")
            }
        }
        RadioButton {
            text: qsTr("Channel 3")
            onClicked: {
                myapp.set_frequency_radio_button("3")
            }
        }
    }

    Connections {
        target: myapp
        ignoreUnknownSignals: true

        // Function to react to sendMessage
        function onSendMessage(text_box_str) {
            text_box.text = text_box_str
        }
    }

    // Update number for timer ticks
    /*
    Connections {
        target: myapp
        ignoreUnknownSignals: true

        // Function to react to sendMessage
        function onSendMessage_2(text_box_str_2) {
            text_box_2.text = text_box_str_2
        }
    }
    */

    // Update count number for --- and +++ buttons
    Connections {
        target: myapp
        ignoreUnknownSignals: true

        // Function to react to sendMessage
        function onUpdateCount(text_box_count_str) {
            text_box_count.text = text_box_count_str
        }
    }
}
