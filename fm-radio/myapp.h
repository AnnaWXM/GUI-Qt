#ifndef MYAPP_H
#define MYAPP_H

#include <QObject>

//class myapp
class myapp : public QObject
{
    // Frequency for radio
    float count = 0.0;
    int count_timer = 0;

    // True when a button is currently pressed down
    bool minus_is_pressed = false;
    bool plus_is_pressed = false;

    // Saved frequencies for radio buttons
    float frequency_channel_1 = 0.0;
    float frequency_channel_2 = 0.0;
    float frequency_channel_3 = 0.0;

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
    void get_slider_frequency(float slider_value);
    void save_frequency_radio_button(QString name_channel);
    void set_frequency_radio_button(QString name_channel);
};

#endif // MYAPP_H
