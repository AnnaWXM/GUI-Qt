#include "gauge.h"
#include <iostream>
#include <string>
#include <QDebug>
#include <QTimer>


gauge::gauge(QObject *parent)
    : QObject{parent}
{

}


void gauge::func_set_value(double slider_val)
{
    QString gauge_str = QString::number(slider_val, 'f', 2)+"V";
    emit sendMess(gauge_str);
}
