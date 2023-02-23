import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // Text box
    Text {
        id: text_box
        text: "Start text"
        anchors.verticalCenterOffset: -170
        anchors.horizontalCenterOffset: -204
        anchors.centerIn: parent
    }

    // Text box for timer number
    Text {
        id: text_box_2
        text: "Counter text"
        anchors.verticalCenterOffset: -170
        anchors.horizontalCenterOffset: -104
        anchors.centerIn: parent
    }

    // Text box for count number modified with +++ and --- buttons
    Text {
        id: text_box_count
        text: "0"
        anchors.verticalCenterOffset: 100
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
    }

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

    // Minus (---) button
    Button {
        id: button_minus
        text: qsTr("---")
        anchors.horizontalCenterOffset: -100
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 0
        onClicked: {
            // Call button_click func from c++
            // myapp.button_click()
        }
        onPressed: {
            myapp.button_pressed("---")
        }
        onReleased: {
            myapp.button_released("---")
        }
        background: Rectangle {
            color: "firebrick"
        }
    }

    // Plus (+++) button
    Button {
        id: button_plus
        text: qsTr("+++")
        anchors.horizontalCenterOffset: 100
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 0
        onPressed: {
            myapp.button_pressed("+++")
        }
        onReleased: {
            myapp.button_released("+++")
        }
        background: Rectangle {
            color: "lightgreen"
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
    Connections {
        target: myapp
        ignoreUnknownSignals: true

        // Function to react to sendMessage
        function onSendMessage_2(text_box_str_2) {
            text_box_2.text = text_box_str_2
        }
    }

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
