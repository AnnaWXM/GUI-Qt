#include "alarm.h"
#include <QObject>
#include <QDebug>
#include <iostream>

int day_value=1,month_value=1;
bool alarm_mode=false;                 // 1 = setting alarm mode
int set_mode=0;                    // 1 = setting clock

QString date_value;
QString state_str;

alarm::alarm(QObject *parent)
    :QObject{parent}

{

}

void alarm::func_set_date()
{
    date_value = QString::number(day_value)+"/"+QString::number(month_value);
    emit sendMess1(date_value);
}

void alarm::func_mode(bool alarm_mode, int set_mode)            // change clock mode by press buttons
{
    // need a protection to avoid turn on two setting mode at same time
    //setting which mode to switch to depanding the bool value (might want to change later since the "set" function is not defined
    if(alarm_mode) {
        state_str = "setting alarm";
        switch(set_mode){
        case 0:
            state_str = "setting alarm";
            break;
        case 1:
            state_str = "change hour";
            break;
        case 2:
            state_str = "change minute";
            break;                                             // no am/pm in 24 hours pattern
        case 3:
            state_str = "change month";
            break;
        case 4:
            state_str = "change day";
            break;

        case 5:
            state_str = "press \"set alarm\" to finish";
            break;
        default:
            state_str = "setting alarm mode";
        }
    }
    else if(!alarm_mode){
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
            state_str = "change weekday";                         // change to weekday???
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

void alarm::func_almset_btn_clk()
{
    alarm_mode = !alarm_mode;
    set_mode = 0;  //return the set mode to 0 while switching the setting mode
    func_mode(alarm_mode, set_mode);

}

void alarm::func_set_btn_clk()
{

    if (!alarm_mode){
        if( set_mode<7)
            set_mode++;               // how to hold for 2s to enter setting modle, from 0 to 1
        else
            set_mode = 0;
    }
    if (alarm_mode) {

        if(set_mode<5)
            set_mode++;
        else
            set_mode = 0;
    }
    func_mode(alarm_mode, set_mode);

}


void alarm::func_set_alarm(QString hour_value, QString minute_value, QString month_value, QString day_value)
{

}
