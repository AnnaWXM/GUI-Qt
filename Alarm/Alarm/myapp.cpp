#include <QObject>
#include "myapp.h"
#include <QDebug>
#include <iostream>

int day_value=1,month_value=1;
QString date_value;


myApp::myApp(QObject *parent)
    :QObject{parent}
{


}

void myApp::func_set_date()
{
    date_value = QString::number(day_value)+"/"+QString::number(month_value);
    emit sendMess(date_value);
}
