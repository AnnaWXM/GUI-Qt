#include "heli_joystick.h"
#include <iostream>
#include <string>
#include <QDebug>
#include <QTimer>
#include <QRect>


QTimer *timerNew= new QTimer();
int moveX=0, moveY=0;

heli_joystick::heli_joystick(QObject *parent)
    : QObject{parent}
{

    QObject::connect(timerNew, &QTimer::timeout, this, &heli_joystick::movingVar);


}


void heli_joystick::displayText(const QString &s){
    QString displayString=s;
    //emit sendMess2(displayString);
    qDebug() << "trying to read string from QML: "<< displayString;

}

double heli_joystick::movingSpeedX(double x){

    double disX=x*moveX;
    return disX;
}


double heli_joystick::movingSpeedY(double y){

    double disY=y*moveY;
    return disY;
}

double heli_joystick::xCheck(double x){
    if (x>1920){
        x=1920;
    }
    else if (x<0){
        x=0;
    }
    return x;
}

double heli_joystick::yCheck(double y){
    if (y>972){
        y=1920;
    }
    else if (y<0){
        y=0;
    }
    return y;
}

void  heli_joystick::movingVar(){
    moveX++;
    moveY++;
}

void heli_joystick::flying(){
    timerNew->start(500);
}


void heli_joystick::stopping(){
    timerNew->stop();
    moveX=0;
    moveY=0;
}

int heli_joystick::random_x(){
    int min = 0;
    int max = 1880;

    // Seed the random number generator
    srand((unsigned) time(NULL));

    // Generate a random number between min and max
    int randomNum = rand() % (max - min + 1) + min;
    return randomNum;
}
