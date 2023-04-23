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
    double movingSpeedX(double x);
    double movingSpeedY(double y);
    double xCheck(double x);
    double yCheck(double y);
    void movingVar();
    void flying();
    void stopping();
    int random_x();

signals:
    void sendMessMove(const double &x_value, const double &y_value);
};

#endif // HELI_JOYSTICK_H



