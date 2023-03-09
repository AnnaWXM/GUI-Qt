#ifndef MYAPP_H
#define MYAPP_H
#include <QObject>

class myApp:public QObject
{
    Q_OBJECT
public:
    explicit myApp(QObject *parent =nullptr);
public slots:
    void func_set_date();
signals:
    void sendMess(const QString &date_value);
};

#endif // MYAPP_H
