#ifndef TRAF_LI_H
#define TRAF_LI_H

#include <QObject>
#include <QWidget>

class traf_li:public QObject
{
    Q_OBJECT

public:

    explicit traf_li(QObject *parent = nullptr);

public slots:
    void displayText(const QString &s);

signals:
    void sendMess_res(const QString &txt_box_str);
    void sendMess_volt(const QString &txt_box_str2);
    void sendMess_amps(const QString &txt_box_str3);

};

#endif // TRAF_LI_H


