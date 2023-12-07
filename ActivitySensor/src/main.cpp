#include <Arduino.h>
#include <mutex>

#define ACTIVITY_SENSOR_PIN 5
#define ACTIVITY_INDICATOR_PIN 4
#define REPORTS_DELAY_MILIS 1000
#define REPORT_SERIAL true
#define REPORT_BT false


void setupPins ();
void setupReportInterface ();
void detectActivity ();
void powerOffIndicator ();
void reportTicks ();

volatile int activityTicks;
unsigned long lastReport;

void setup () {

  activityTicks = 0;
  lastReport = 0;
  setupPins ();
  setupReportInterface ();

}

void loop () {
  
  if ( millis () > ( lastReport + REPORTS_DELAY_MILIS ) ) {
    reportTicks ();
  }

}

void setupPins () {

  pinMode ( ACTIVITY_SENSOR_PIN, INPUT );
  pinMode ( ACTIVITY_INDICATOR_PIN, OUTPUT );
  attachInterrupt ( digitalPinToInterrupt ( ACTIVITY_SENSOR_PIN ), detectActivity, RISING );
  attachInterrupt ( digitalPinToInterrupt ( ACTIVITY_SENSOR_PIN ), powerOffIndicator, FALLING );

}

void setupReportInterface () {

  if ( REPORT_SERIAL ) {
    Serial.begin ( 9600 );
  }

  if ( REPORT_BT ) {
    //setup bt interface
  }

}

void detectActivity () {

  activityTicks++;
  digitalWrite ( ACTIVITY_INDICATOR_PIN, HIGH );

}

void powerOffIndicator () {

  digitalWrite ( ACTIVITY_INDICATOR_PIN, LOW );

}

void reportTicks () {

  int report = activityTicks;
  activityTicks = activityTicks - report;

  if ( REPORT_SERIAL ) {
    Serial.println ( "Ticks: " + report );
  }

  if ( REPORT_BT ) {
    //report over bt.
  }

  lastReport = millis ();

}