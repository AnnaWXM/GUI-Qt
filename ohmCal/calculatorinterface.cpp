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
    bool ok;
    double r = resistance.toDouble(&ok);
    if (!ok) {
        emit sendMess_res("Invalid!");
        qDebug() << "Invalid input for resistance: " << resistance;
        return;
    }

    double a = amps.toDouble(&ok);
    if (!ok) {
        emit sendMess_amps("Invalid!");
        qDebug() << "Invalid input for amps: " << amps;
        return;
    }

    double v=a*r;
    emit sendMess_volt(QString::number(v, 'f', 2));
    qDebug() << "Calculation result (voltage=resistance*amps): "<< v;

}

void calculatorinterface::calAmp(const QString &resistance, const QString &voltage){
    bool ok;
    double v = voltage.toDouble(&ok);
    if (!ok) {
        emit sendMess_volt("Invalid!");
        qDebug() << "Invalid input for voltage: " << voltage;
        return;
    }

    double r = resistance.toDouble(&ok);
    if (!ok || r==0) {
        emit sendMess_res("Invalid!");
        qDebug() << "Invalid input for resistance: " << resistance;
        return;
    }
    double a=v/r;
    emit sendMess_amps(QString::number(a, 'f', 2));
    qDebug() << "Calculation result (amps=voltage/resistance): "<< a;

}
void calculatorinterface::calResis(const QString &voltage, const QString &amps ){
    bool ok;
    double a = amps.toDouble(&ok);
    if (!ok || a==0) {
        emit sendMess_amps("Invalid!");
        qDebug() << "Invalid input for amps: " << amps;
        return;
    }

    double v = voltage.toDouble(&ok);
    if (!ok) {
        emit sendMess_volt("Invalid!");
        qDebug() << "Invalid input for voltage: " << voltage;
        return;
    }

    double r=v/a;
    emit sendMess_res(QString::number(r, 'f', 2));
    qDebug() << "Calculation result (resistance=voltage/amps): "<< r;
}
