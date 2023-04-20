#ifndef GAUGE_H
#define GAUGE_H

#include <QObject>
#include <QWidget>

class gauge:public QObject
{

    Q_OBJECT

public:
    explicit gauge(QObject *parent = nullptr);

public slots:
    void func_set_value(double slider_val);

signals:
    void sendMess(const QString &gauge_value);


};

#endif // GAUGE_H

