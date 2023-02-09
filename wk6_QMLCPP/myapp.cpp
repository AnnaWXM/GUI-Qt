#include "myapp.h"

#include <QDebug>

//myapp::myapp()

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
