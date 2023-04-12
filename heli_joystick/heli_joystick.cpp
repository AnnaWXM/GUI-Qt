#include "heli_joystick.h"
#include <iostream>
#include <string>
#include <QDebug>


heli_joystick::heli_joystick(QObject *parent)
    : QObject{parent}
{

}


void heli_joystick::displayText(const QString &s){
    QString displayString=s;
    //emit sendMess2(displayString);
    qDebug() << "trying to read string from QML: "<< displayString;

}
