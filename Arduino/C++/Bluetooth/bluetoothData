#include <Servo.h>

Servo myServo; 
int bluetoothData; // 블루투스 데이터 변수

void setup() {
  Serial.begin(9600);  // 블루투스 모듈과 통신 설정
  myServo.attach(9);   // 서보 모터 핀 설정
  myServo.write(0);    // 초기 잠금 상태
}

void loop() {
  if (Serial.available()) { 
    bluetoothData = Serial.read(); // 블루투스에서 데이터 읽기
    if (bluetoothData == '1') {    // '1'을 받으면 문 열기
      myServo.write(90);           // 서보 모터를 90도로 이동 (열림 상태)
      Serial.println("Door Unlocked"); // 상태 전송
    } else if (bluetoothData == '0') { // '0'을 받으면 문 잠금
      myServo.write(0);            // 서보 모터를 0도로 이동 (잠김 상태)
      Serial.println("Door Locked");  // 상태 전송
    }
  }
}
