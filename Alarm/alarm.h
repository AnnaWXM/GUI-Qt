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
    void func_mode(bool alarm_mode, int set_mode);
    void func_almset_btn_clk();
    void func_set_btn_clk();
    void func_set_alarm(QString hour_value, QString minute_value, QString month_value, QString day_value);
signals:
    void sendMess1(const QString &date_value);
    void sendMess2(const QString &state_mode);
};

#endif // ALARM_H
