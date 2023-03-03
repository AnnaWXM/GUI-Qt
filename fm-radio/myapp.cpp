#include "myapp.h"
#include <QDebug>
#include <QTimer>
#include <QSound>

myapp::myapp(QObject *parent) :
    QObject(parent) {

    // Constantly incrementing timer
    QTimer *timer = new QTimer(this);
    QObject::connect(timer, &QTimer::timeout, this, &myapp::timer_tick);
    timer->start(1000);
}

// Function that onclick calls from QML
void myapp::button_click() {
    // Signal to be sent to text box tp QML
    //emit sendMessage("I'll write to text box");

    // Sound effect
    QSound buttonSound("~/qt-projects/fm-radio/buttonSound.wav");
    buttonSound.play();
    qDebug() << "Button pressed";
}

// Count button presses
void myapp::button_count() {
    qDebug() << "Count func";
}

// Timer increments by 1 every second
void myapp::timer_tick(void) {
    emit sendMessage_2(QString::number(count_timer));
    update_count_amount();
    count_timer += 1;
    qDebug() << "Timer tick";
}

// Update count amount if plus or minus button is pressed
void myapp::update_count_amount() {
    if(plus_is_pressed) {
        count += 1.0;
    } else if (minus_is_pressed) {
        count -= 1.0;
    }
    emit updateCount(QString::number(count));
    qDebug() << "count: " << count;
}

// Print message when a button is pressed down
void myapp::button_pressed(QString name_button) {
    qDebug() << name_button << " button is pressed down";
    if (name_button == "+++") {
        plus_is_pressed = true;
    } else if (name_button == "---") {
        minus_is_pressed = true;
    }
}

// Print message when a button is released after press
void myapp::button_released(QString name_button) {
    qDebug() << name_button << " button is released";
    if (name_button == "+++") {
        plus_is_pressed = false;
    } else if (name_button == "---") {
        minus_is_pressed = false;
    }
}

// Update count from slider value
void myapp::get_slider_frequency(float slider_value) {
    count = slider_value;
    emit updateCount(QString::number(count));
}

// Set frequency from value saved to radio button
void myapp::set_frequency_radio_button(QString name_channel) {
    if (name_channel == "1") {
        if (frequency_channel_1 == 0.0) {
            save_frequency_radio_button(name_channel);
        } else {
            count = frequency_channel_1;
        }
    } else if (name_channel == "2") {
        if (frequency_channel_2 == 0.0) {
            save_frequency_radio_button(name_channel);
        } else {
            count = frequency_channel_2;
        }
    } else if (name_channel == "3") {
        if (frequency_channel_3 == 0.0) {
            save_frequency_radio_button(name_channel);
        } else {
            count = frequency_channel_3;
        }
    }
}

// Save frequency to a radio button
void myapp::save_frequency_radio_button(QString name_channel) {
    if (name_channel == "1") {
        frequency_channel_1 = count;
    } else if (name_channel == "2") {
        frequency_channel_2 = count;
    } else if (name_channel == "3") {
        frequency_channel_3 = count;
    }
}
