#!/bin/bash

echo "Start Spring Boot Application!"
CURRENT_PID=$(ps -ef | grep java | grep demo-0.0.1-SNAPSHOT.jar | awk '{print $2}')
echo "$CURRENT_PID"

chmod 777  /svc/jenkins/demo-0.0.1-SNAPSHOT.jar

if [ -z $CURRENT_PID ]; then
echo ">현재 구동중인 어플리케이션이 없으므로 종료하지 않습니다."

else
echo "> kill -9 $CURRENT_PID"
sudo kill -9 $CURRENT_PID
sleep 10
fi

echo ">어플리케이션 배포 진행!"

nohup java -jar /svc/jenkins/demo-0.0.1-SNAPSHOT.jar 1>log.out 2>err.out &

sleep 10

echo -e "\n"

echo "배포까지 성공 !!"
