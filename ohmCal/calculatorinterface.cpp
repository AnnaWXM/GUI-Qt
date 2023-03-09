#include "calculatorinterface.h"
#include <iostream>
#include <string>
#include <QDebug>
#include <QTimer>
#include <QUrl>


calculatorinterface::calculatorinterface(QObject *parent)
    : QObject{parent}
{

}


void calculatorinterface::displayText(const QString &s){
    QString displayString=s;
    //emit sendMess2(displayString);
    qDebug() << "trying to read string from QML: "<< displayString;

}

void calculatorinterface::calVolt(const QString &resistance, const QString &amps ){
    double a=amps.toDouble();
    double r=resistance.toDouble();
    double v=a*r;
    emit sendMess_volt(QString::number(v, 'f', 2));
    qDebug() << "Calculation result (voltage=resistance*amps): "<< v;

}

void calculatorinterface::calAmp(const QString &resistance, const QString &voltage){
    double r=resistance.toDouble();
    double v=voltage.toDouble();
    double a=v/r;
    emit sendMess_amps(QString::number(a, 'f', 2));
    qDebug() << "Calculation result (amps=voltage/resistance): "<< a;

}
void calculatorinterface::calResis(const QString &voltage, const QString &amps ){
    double a=amps.toDouble();
    double v=voltage.toDouble();
    double r=v/a;
    emit sendMess_res(QString::number(r, 'f', 2));
    qDebug() << "Calculation result (resistance=voltage/amps): "<< r;
}
