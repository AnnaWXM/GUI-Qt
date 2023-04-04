#include "alarm.h"
#include <QObject>
#include <QDebug>
#include <iostream>
#include <QTimer>
//have to add QT += multimedia to the qmake project file to use multimedia components
#include <QSound>
#include <QSoundEffect>
#include <QUrl>


//****************************************************//
//               Global variables                     //
//****************************************************//

QTimer *timerNew= new QTimer();

//sound effect not done yet
QSound eff("C:/Users/nnnoz/Desktop/test/wk7_hw/bubbling1.wav");
QSoundEffect *alarmSound=new QSoundEffect();

//initial value
int day_value=1, month_value=1, hr_value = 0, min_value = 0, week_value=1;

//variable for the modes, might still need adjusting
bool alarm_mode=false;                 // 1 = setting alarm mode
bool set_alarm=false;
bool set_clock=false;
int set_mode=0;                    // 1 = setting clock


//for the mode status
QString state_str;

// Alarm time that is currently set
int alarm_hour = 1;  // int alarm_hour = 0;
int alarm_min = 15;  // int alarm_min = 0;

// Alarm snooze length in minutes
int snooze_length = 10;

//variable for increment and reduction
int i=0;

//variable for detacting long press (for setting clock, turning off alarm etc
int cnt=0;
int snooze_var=0;

//****************************************************//
//                      Functions                     //
//****************************************************//

alarm::alarm(QObject *parent)
    :QObject{parent}

{
    //timer for the ever running time
    QTimer *timer1=new QTimer(this);  
    QObject::connect(timer1, &QTimer::timeout, this, &alarm::timeVar);

    //timer for detacting long press
    QObject::connect(timerNew, &QTimer::timeout, this, &alarm::timer_Activate);

    //increment 1 per minute -> 60000
    //timer set per second -> 1000
    //now the value is set at 10 for testing purpose
    //timer1->start(10);
    timer1->start(100);
    //path of the sound file has to be hard coded
    alarmSound->setSource(QUrl::fromLocalFile("C:/Users/nnnoz/Desktop/Alarm/sounds/bubbling1.wav"));
    alarmSound->setLoopCount(QSoundEffect::Infinite);
    alarmSound->setVolume(1.0f);
}

//****************************************************//
//                     Clock mode                     //
//****************************************************//

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

void alarm::setMode(){
    timerNew->start(1000);
    cnt++;
    if (cnt>3 && cnt<5){
        set_clock=true;
        emit sendMessState("Setting clock");
        qDebug() << "setting clock";

    }
    else if (cnt>5){
        set_clock=false;
        set_alarm=true;
        emit sendMessState("Setting alarm");
        qDebug() << "setting alarm";

    }

}
void alarm::stopSet(){
    timerNew->stop();
    cnt=0;
}

//****************************************************//
//            Alarm ringing and snoozing              //
//****************************************************//

//void alarm::func_set_alarm(QString hour_value, QString minute_value, QString month_value, QString day_value)
//{

//}

// Check if time now is alarm time and ring alarm if it is alarm time
void alarm::check_is_alarm_time() {
    if (hr_value == alarm_hour && min_value == alarm_min) {
        ring_alarm();
    }
}

// Make the alarm ring
// For debugging: message displayed when alarm rings
void alarm::ring_alarm() {
    alarmSound->play();
    qDebug() << "Alarm is ringing";
    // Signal to be sent to text box alarm_status in QML
    emit sendMessAlarmRinging("Alarm is RINGING!");
}

// Snooze alarm for snooze length and then ring alarm again
void alarm::snooze_alarm() {
    // Signal to be sent to text box alarm_status in QML
    emit sendMessAlarmRinging("Alarm is SNOOZING!");
    if (snooze_var<5){

        // TODO: change snooze_length_ms after timer is set to normal
        //      i.e. once 1 increment occurs per min
        // Timer to snooze and then call ring_alarm() after snooze length
        //int snooze_length_ms = snooze_length * 60000; // snooze length in milliseconds
        int snooze_length_ms = snooze_length * 100; // snooze length FOR TESTING
        QTimer::singleShot(snooze_length_ms, this, &alarm::ring_alarm);
        qDebug() << "Alarm is SNOOZING";

    }
    else{
        emit sendMessAlarmRinging("Alarm is OFF!");
        qDebug() << "Alarm is OFF";
    }

}

//fpr detecting long press of the snooze button
void alarm::timer_Activate(){
    //stop the sound (for a while)
    alarmSound->stop();
    //resetting the variable
    timerNew->start(1000);
    cnt=cnt+1;
    qDebug() << "Long press started!"<<cnt;
}

void alarm::timer_Stop(){
    timerNew->stop();
    snooze_var=cnt;
    cnt=0;
    qDebug() << "Long press ends!" <<snooze_var;
}


//****************************************************//
//                  Time and day                      //
//****************************************************//

void alarm::timeVar(){
    // Check if current time is the time for the alarm to ring
    check_is_alarm_time();

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



void alarm::incrment(){
    timerNew->start(1000);
    i++;
}
void alarm::reduction(){
    i--;
    //so it don't go in to the minus
    if(i<0){
        i=0;
    }
}
