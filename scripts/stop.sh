#!/usr/bin/env bash

PROJECT_ROOT="/home/ubuntu/app"
JAR_FILE="$PROJECT_ROOT/build/libs/cicd-0.0.1-SNAPSHOT.jar"

DEPLOY_LOG="$PROJECT_ROOT/deploy.log"

TIME_NOW=$(date +%c)

CURRENT_PID=$(pgrep -f $JAR_FILE)

if [ -z $CURRENT_PID ]; then
  echo "[ $TIME_NOW ] Running application not found." >> $DEPLOY_LOG
else
  echo "$[ TIME_NOW ] Terminate application PID : $CURRENT_PID" >> $DEPLOY_LOG
  kill -15 $CURRENT_PID
fi