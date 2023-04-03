#include "alarm.h"
#include <QObject>
#include <QDebug>
#include <iostream>
#include <QTimer>
//have to add QT += multimedia to the qmake project file to use multimedia components
#include <QSound>
#include <QSoundEffect>
#include <QUrl>


QTimer *timerNew= new QTimer();

//sound effect not done yet
QSound eff("C:/Users/nnnoz/Desktop/test/wk7_hw/bubbling1.wav");
QSoundEffect *bearSound=new QSoundEffect();

//initial value
int day_value=1, month_value=1, hr_value = 0, min_value = 0, week_value=1;

//variable for the modes, might still need adjusting
bool alarm_mode=false;                 // 1 = setting alarm mode
int set_mode=0;                    // 1 = setting clock

//QString date_value;

//for the mode status
QString state_str;

alarm::alarm(QObject *parent)
    :QObject{parent}

{
    QTimer *timer1=new QTimer(this);
    QObject::connect(timer1, &QTimer::timeout, this, &alarm::timeVar);
    //increment 1 per minute -> 60000
    //timer set per second -> 1000
    //now the value is set at 10 for testing purpose
    timer1->start(10);

}

//void alarm::func_set_date()
//{
//    date_value = QString::number(day_value)+"/"+QString::number(month_value);
//    emit sendMess1(date_value);
//}

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

    emit sendMessState(state_str);
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
        //entering the clock setting mode
        if( set_mode<7)
            set_mode++;               // how to hold for 2s to enter setting modle, from 0 to 1
        else
            set_mode = 0;
    }
    if (alarm_mode) {
        //entering the alarm setting mode
        if(set_mode<5)
            set_mode++;
        else
            set_mode = 0;
    }
    func_mode(alarm_mode, set_mode);

}


//void alarm::func_set_alarm(QString hour_value, QString minute_value, QString month_value, QString day_value)
//{

//}

void alarm::timeVar(){
    // timer is running (tested it with setting it to shorter time
    // still need to set the value for different month and also leap year thingy
    if (min_value<59){
        //adding the minute within one hour
        min_value++;
    }
    else{
        min_value=0;
        if(hr_value<23){
            //adding the hour within one day
            hr_value++;
        }
        else{
            //resetting the hr as the day change and adding to day count
            hr_value=0;
            //which day of the week
            if (week_value<7){
                week_value++;
            }
            else{
                week_value=1;
            }
            // day of the month
            if(day_value<30){
                day_value++;
            }
            else{
                day_value=1;
            }
        }

    }
    emit sendMessMin(QString::asprintf("%02d", min_value));
    emit sendMessHr(QString::asprintf("%02d", hr_value));
    emit sendMessDay(QString::asprintf("%02d", day_value));
    emit sendMessMonth(QString::asprintf("%02d", month_value));

    printWeekday(week_value);


}

void alarm::isLeapYear(){

}

void alarm::printWeekday(int week_value){
    QString wk_day;
    switch (week_value) {
    case 1:
        wk_day="Mon";
        break;
    case 2:
        wk_day="Tue";
        break;
    case 3:
        wk_day="Wed";
        break;
    case 4:
        wk_day="Thu";
        break;
    case 5:
        wk_day="Fri";
        break;
    case 6:
        wk_day="Sat";
        break;
    case 7:
        wk_day="Sun";
        break;
    default:
        wk_day="Sun";

    }
    emit sendMessWeek(wk_day);

}
