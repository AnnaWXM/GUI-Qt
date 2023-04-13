#include <QObject>
#include "myapp.h"
#include <QDebug>
#include <iostream>
#include <qfont.h>

int gauge_value=0;
QString gauge_str;

myapp::myapp(QObject *parent)
    :QObject(parent)
{

}

void myapp::func_set_value()
{
    gauge_str = QString::number(gauge_value);
    emit sendMess(gauge_str);
}
