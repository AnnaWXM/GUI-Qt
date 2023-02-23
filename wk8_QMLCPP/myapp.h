#ifndef MYAPP_H
#define MYAPP_H

#include <QObject>

//class myapp
class myapp : public QObject
{
    int count = 0;
    int count_timer = 0;
    bool minus_is_pressed = false;
    bool plus_is_pressed = false;

    Q_OBJECT

public:
    //myapp();
    explicit myapp(QObject *parent = 0);
    void timer_tick(void);

    // signals from c++ to QML
signals:
    void sendMessage(const QString &text_box_str);
    void sendMessage_2(const QString &text_box_str_2);
    void updateCount(const QString &text_box_count_str);

    // slots from QML to c++
public slots:
    void button_click();
    void button_count();
    void button_pressed(QString name_button);
    void button_released(QString name_button);
    void update_count_amount();
};

#endif // MYAPP_H
