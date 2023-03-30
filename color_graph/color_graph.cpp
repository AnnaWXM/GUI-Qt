#include "color_graph.h"
#include <iostream>
#include <string>
#include <QDebug>
#include <QTimer>
#include <QUrl>


color_graph::color_graph(QObject *parent)
    : QObject{parent}
{

}


void color_graph::displayText(const QString &s){
    QString displayString=s;
    //emit sendMess2(displayString);
    qDebug() << "trying to read string from QML: "<< displayString;

}
