#include "myapp.h"
#include <iostream>
#include <string>
#include <QDebug>

//myapp::myapp()
 int counter_val=0;
myapp::myapp(QObject *parent) :
    QObject(parent)
{

}

void myapp::func_btn_clk_on(){
    emit sendMess("On!");
    qDebug() << "turned on!";
}
void myapp::func_btn_clk_off(){
    emit sendMess("Off!");
    qDebug() << "turned off!";
}

void myapp::timer_counter(){
    counter_val++;
}

void myapp::timer_show(){
    emit sendMess2(QString::number(counter_val));
    qDebug() << "timer activated! Accumulated value: "+QString::number(counter_val);
}
void myapp::timer_extra(){
    emit sendMess3("Timer activated! Press 'off' to puase.");
    qDebug() << "some extra function";
}
