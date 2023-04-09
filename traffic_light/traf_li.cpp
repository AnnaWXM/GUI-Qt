#include "traf_li.h"
#include <iostream>
#include <string>
#include <QDebug>
#include <QTimer>
#include <QUrl>


traf_li::traf_li(QObject *parent)
    : QObject{parent}
{

}


void traf_li::displayText(const QString &s){
    QString displayString=s;
    //emit sendMess2(displayString);
    qDebug() << "trying to read string from QML: "<< displayString;

}
