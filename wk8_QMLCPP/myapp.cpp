#include "myapp.h"
#include <QDebug>
#include <QTimer>

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
    emit sendMessage("I'll write to text box");
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
        count += 1;
    } else if (minus_is_pressed) {
        count -= 1;
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
