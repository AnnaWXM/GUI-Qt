#include <QObject>
#include "myapp.h"
#include <QDebug>
#include <iostream>
#include <qfont.h>

int day_value=1,month_value=1;
bool alarm_mode=0;                 // 1 = setting alarm mode
int set_mode=0;                    // 1 = setting clock

QString date_value;
QString state_str;


myapp::myapp(QObject *parent)
    :QObject(parent)
{

}


void myapp::func_mode()            // change clock mode by press buttons
{
    // need a protection to avoid turn on two setting mode at same time
    if(alarm_mode==1 && set_mode==0) state_str = "setting alarm";
    if(alarm_mode==0){
        switch(set_mode){
        case 0:
            state_str = "normal clock mode";
            break;
        case 1:
            state_str = "enter the clock setting modle";
            break;
        case 2:
            state_str = "change 12/24 hours pattern";          // show am/pm in 12 hours pattern
            break;                                             // no am/pm in 24 hours pattern
        case 3:
            state_str = "change hour";
            break;
        case 4:
            state_str = "change minute";
            break;
        case 5:
            state_str = "change year";                         // change to weekday???
            break;
        case 6:
            state_str = "change month";
            break;
        case 7:
            state_str = "change day";
            break;
        default:
            state_str = "normal clock mode";
        }


    }

    emit sendMess2(state_str);
}

void myapp::func_almset_btn_clk()
{
    alarm_mode +=1;
    func_mode();
}

void myapp::func_set_btn_clk()
{
    if(set_mode<7)set_mode +=1;               // how to hold for 2s to enter setting modle, from 0 to 1
    else set_mode = 0;
    func_mode();
}

void myapp::func_set_date()
{
    date_value = QString::number(day_value)+"/"+QString::number(month_value);
    emit sendMess1(date_value);
}

void myapp::func_set_alarm()
{

}
