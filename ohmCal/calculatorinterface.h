#ifndef CALCULATORINTERFACE_H
#define CALCULATORINTERFACE_H

#include <QObject>

class calculatorinterface: public QObject
{
    Q_OBJECT

public:
    explicit calculatorinterface(QObject *parent = nullptr);


public slots:
    void displayText(const QString &s);
    void calAmp(const QString &resistance, const QString &voltage);
    void calVolt(const QString &resistance, const QString &amps );
    void calResis(const QString &voltage, const QString &amps );


signals:
    void sendMess_res(const QString &txt_box_str);
    void sendMess_volt(const QString &txt_box_str2);
    void sendMess_amps(const QString &txt_box_str3);
};
#endif // CALCULATORINTERFACE_H
