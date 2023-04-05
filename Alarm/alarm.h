#ifndef ALARM_H
#define ALARM_H

#include <QObject>

class alarm :public QObject
{
    Q_OBJECT
public:
    explicit alarm(QObject *parent =nullptr);

public slots:
    //void func_set_date();
    void func_mode(int alarm_mode, int set_mode);
    void func_almset_btn_clk();
    void func_set_btn_clk();
    //void func_set_alarm(QString hour_value, QString minute_value, QString month_value, QString day_value);
    void check_is_alarm_time();
    void ring_alarm();
    void snooze_alarm();
    //void turn_off_alarm();
    void timeVar();
    void printWeekday(int week_value);
    void Add();
    void reduction();
    void timer_Activate();
    void timer_Stop();
    int monthDay(int month);
    void manipulateValue(int i);




signals:
    void sendMessHr(const QString &hr_value);
    void sendMessMin(const QString &min_value);
    void sendMessAmPm(const QString &ampm_value);
    void sendMessDay(const QString &day_value);
    void sendMessMonth(const QString &month_value);
    void sendMessWeek(const QString &week_str);
    void sendMessState(const QString &state_str);
    void sendMessAlarmRinging(const QString &alarm_ring_message);
};

#endif // ALARM_H
