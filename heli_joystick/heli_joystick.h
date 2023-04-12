#ifndef HELI_JOYSTICK_H
#define HELI_JOYSTICK_H

#include <QObject>
#include <QWidget>

class heli_joystick:public QObject
{
    Q_OBJECT

public:
   explicit heli_joystick(QObject *parent = nullptr);

public slots:
    void displayText(const QString &s);

signals:
//    void sendMessMin(const QString &txt_box_str2);
//    void sendMessHr(const QString &txt_box_str3);
};

#endif // HELI_JOYSTICK_H



