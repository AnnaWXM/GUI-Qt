#ifndef ALARM_H
#define ALARM_H

#include <QObject>

class alarm :public QObject
{
    Q_OBJECT
public:
    explicit alarm(QObject *parent =nullptr);
public slots:
    void func_set_date();
    void func_mode();
    void func_almset_btn_clk();
    void func_set_alarm();
    void func_set_btn_clk();
signals:
    void sendMess1(const QString &date_value);
    void sendMess2(const QString &state_mode);
};

#endif // ALARM_H
