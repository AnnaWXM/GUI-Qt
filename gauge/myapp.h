#ifndef MYAPP_H
#define MYAPP_H
#include <QObject>


class myapp:public QObject
{
    Q_OBJECT
public:
    explicit myapp(QObject *parent =nullptr);

public slots:
    void func_set_value();

signals:
    void sendMess(const QString &gauge_value);
};

#endif // MYAPP_H
