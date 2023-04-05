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
int alarm_mode=0;                 // 1 = setting alarm mode, 2 setting clock, 0 off with both (value set)
int set_mode=0;                    // 1 = setting clock
bool set_alarm=false;
bool set_clock=false;


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


void alarm::func_mode(int alarm_mode, int set_mode)            // change clock mode by press buttons
{
    // need a protection to avoid turn on two setting mode at same time
    //setting which mode to switch to depanding the bool value (might want to change later since the "set" function is not defined
    if(alarm_mode==1) {
        state_str = "setting alarm";
        switch(set_mode){
        case 1:
            state_str = "change hour";
            break;
        case 2:
            state_str = "change minute";
            break;                                             // no am/pm in 24 hours pattern
        case 3:
            state_str = "press \"set\" to finish";
            break;
        default:
            state_str = "setting alarm mode";
        }
    }
    else if(alarm_mode==2){
        state_str = "setting clock";
        switch(set_mode){

        case 1:
            state_str = "change hour";
            break;
        case 2:
            state_str = "change minute";
            break;                                             // no am/pm in 24 hours pattern
        case 3:
            state_str = "change weekday";                         // change to weekday???
            break;
        case 4:
            state_str = "change month";
            break;
        case 5:
            state_str = "change day";
            break;
        case 6:
            state_str = "press \"set\" to finish";
            break;
        default:
            state_str = "setting clock mode";
        }
    }
    emit sendMessState(state_str);
}

void alarm::func_almset_btn_clk()
{
    if(alarm_mode<2){
        alarm_mode ++;
    }
    else{
        alarm_mode=0;
    }

    if (alarm_mode==0){
        state_str="showing clock";
    }
    else if(alarm_mode==1){
        state_str="setting alarm";
    }
    else if(alarm_mode==2){
        state_str="setting clock";
    }
    qDebug() << "what mode: "<<state_str;
    qDebug() << "what alarm mode value: "<<alarm_mode;

    emit sendMessState(state_str);

}

void alarm::func_set_btn_clk()
{
    if (alarm_mode==1) {
        //entering the alarm setting mode
        if(set_mode<3)
            set_mode++;
        else
            set_mode = 0;
    }

    else if (alarm_mode==2){
        //entering the clock setting mode
        if( set_mode<6)
            set_mode++;               // how to hold for 2s to enter setting modle, from 0 to 1
        else
            set_mode = 0;
    }

    else if (alarm_mode==0){
        emit sendMessMin(QString::asprintf("%02d", min_value));
        emit sendMessHr(QString::asprintf("%02d", hr_value));
        emit sendMessDay(QString::asprintf("%02d", day_value));
        emit sendMessMonth(QString::asprintf("%02d", month_value));

        printWeekday(week_value);
    }

    qDebug() << "what switch value: "<<set_mode;

    func_mode(alarm_mode, set_mode);

}


void alarm::Add(){
    i++;
    // need a protection to avoid turn on two setting mode at same time
    //setting which mode to switch to depanding the bool value (might want to change later since the "set" function is not defined
    int ref;
    if(alarm_mode==1) {
        state_str = "setting alarm";
        if(set_mode==1){
            state_str = "change hour";
            if(i>23){
                i=0;
            }
            alarm_hour=i;
        }
        else if(set_mode==2) {
            state_str = "change minute";
            if(i>59){
                i=0;
            }
            alarm_min=i;
        }
        emit sendMessMin(QString::asprintf("%02d", alarm_min));
        emit sendMessHr(QString::asprintf("%02d", alarm_hour));
    }

    if(alarm_mode==2){
        state_str = "setting clock";
        if(set_mode==1){
            state_str = "change hour";
            if(i>23){
                i=0;
            }
            hr_value=i;
        }
        else if(set_mode==2){
            state_str = "change minute";
            if(i>59){
                i=0;
            }
            min_value=i;
        }
        else if(set_mode==3){
            state_str = "change weekday";
            if(i>7){
                i=1;
            }
            week_value=i;
        }
        else if(set_mode==4){
            state_str = "change month";
            if(i>12){
                i=1;
            }
            month_value=i;
        }
        else if(set_mode==5){
            state_str = "change day";
            ref= monthDay(month_value);
            if(i>ref){
                i=1;
            }
            day_value=i;
        }

        emit sendMessMin(QString::asprintf("%02d", min_value));
        emit sendMessHr(QString::asprintf("%02d", hr_value));
        emit sendMessDay(QString::asprintf("%02d", day_value));
        emit sendMessMonth(QString::asprintf("%02d", month_value));
        printWeekday(week_value);

    }
    qDebug() << "mode value "+QString::number(set_mode);
    qDebug() << "alarm value "+QString::number(alarm_mode);

    qDebug() << "adding, current value: "+QString::number(i);

}
void alarm::reduction(){
    i--;
    //so it don't go in to the minus
    if(i<0){
        i=0;
    }
    int ref;
    if(alarm_mode==1) {
        state_str = "setting alarm";
        if(set_mode==1){
            state_str = "change hour";
            if(i>23){
                i=0;
            }
            alarm_hour=i;
        }
        else if(set_mode==2) {
            state_str = "change minute";
            if(i>59){
                i=0;
            }
            alarm_min=i;
        }
        emit sendMessMin(QString::asprintf("%02d", alarm_min));
        emit sendMessHr(QString::asprintf("%02d", alarm_hour));
    }

    if(alarm_mode==2){
        state_str = "setting clock";
        if(set_mode==1){
            state_str = "change hour";
            if(i>23){
                i=0;
            }
            hr_value=i;
        }
        else if(set_mode==2){
            state_str = "change minute";
            if(i>59){
                i=0;
            }
            min_value=i;
        }
        else if(set_mode==3){
            state_str = "change weekday";
            if(i>7){
                i=1;
            }
            week_value=i;
        }
        else if(set_mode==4){
            state_str = "change month";
            if(i>12){
                i=1;
            }
            month_value=i;
        }
        else if(set_mode==5){
            state_str = "change day";
            ref= monthDay(month_value);
            if(i>ref){
                i=1;
            }
            day_value=i;
        }

        emit sendMessMin(QString::asprintf("%02d", min_value));
        emit sendMessHr(QString::asprintf("%02d", hr_value));
        emit sendMessDay(QString::asprintf("%02d", day_value));
        emit sendMessMonth(QString::asprintf("%02d", month_value));
        printWeekday(week_value);

    }
    qDebug() << "mode value "+QString::number(set_mode);
    qDebug() << "alarm value "+QString::number(alarm_mode);

    qDebug() << "adding, current value: "+QString::number(i);
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
            int ref= monthDay(month_value);
            if(day_value<ref){
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

//deciding the number of days in the month (let's leave out the leap year for now, since we are not showing the year
int alarm::monthDay(int month){
    int numDays=0;
    if (month==1 || month==3|| month==5|| month==7|| month==8|| month==10|| month==12){
        numDays=31;
    }
    else if(month==2){
        numDays=28;
    }
    else {
        numDays=30;
    }
    return numDays;
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

void alarm::manipulateValue(int i){
    int ref;
    if(alarm_mode==1) {
        state_str = "setting alarm";
        switch(set_mode){
        case 1:
            state_str = "change hour";
            if(i>23){
                i=0;
            }
            alarm_hour=i;
            break;
        case 2:
            state_str = "change minute";
            if(i>59){
                i=0;
            }
            alarm_min=i;
            break;                                             // no am/pm in 24 hours pattern
        case 3:
            state_str = "press \"set\" to finish";
            break;
        default:
            state_str = "setting alarm mode";
        }
    }
    else if(alarm_mode==2){
        state_str = "setting clock";
        switch(set_mode){
        case 0:
            state_str = "setting clock mode";
            break;
        case 1:
            state_str = "change hour";
            if(i>23){
                i=0;
            }
            hr_value=i;
            break;
        case 2:
            state_str = "change minute";
            if(i>59){
                i=0;
            }
            min_value=i;
            break;                                             // no am/pm in 24 hours pattern
        case 3:
            state_str = "change weekday";
            if(i>7){
                i=1;
            }
            week_value=i;
            break;
        case 4:
            state_str = "change month";
            if(i>12){
                i=1;
            }
            month_value=i;
            break;
        case 5:
            state_str = "change day";
            ref= monthDay(month_value);
            if(i>ref){
                i=1;
            }
            day_value=i;
            break;
        case 6:
            state_str = "press \"set\" to finish";
            break;
        default:
            state_str = "setting clock mode";
        }
    }

    emit sendMessMin(QString::asprintf("%02d", min_value));
    emit sendMessHr(QString::asprintf("%02d", hr_value));
    emit sendMessDay(QString::asprintf("%02d", day_value));
    emit sendMessMonth(QString::asprintf("%02d", month_value));

    printWeekday(week_value);
}


