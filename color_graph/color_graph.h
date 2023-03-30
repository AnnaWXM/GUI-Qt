#ifndef COLOR_GRAPH_H
#define COLOR_GRAPH_H

#include <QObject>

class color_graph: public QObject
{
    Q_OBJECT

public:
    explicit color_graph(QObject *parent = nullptr);


public slots:
    void displayText(const QString &s);

signals:
    void sendMess_res(const QString &txt_box_str);
    void sendMess_volt(const QString &txt_box_str2);
    void sendMess_amps(const QString &txt_box_str3);
};
#endif // COLOR_GRAPH_H
