#include <SoftwareSerial.h>

// 블루투스 모듈 핀 설정
SoftwareSerial BT(10, 11); // RX = 핀 10, TX = 핀 11
int relayPin = 13; // 릴레이 핀 설정

void setup() {
  // 핀 모드 설정
  pinMode(relayPin, OUTPUT);
  digitalWrite(relayPin, LOW); // 초기 상태는 잠김
  
  // 블루투스 통신 시작
  BT.begin(9600); 
  Serial.begin(9600); // 디버깅용 시리얼 통신 시작
  Serial.println("스마트 도어락 시스템 시작");
}

void loop() {
  // 블루투스 데이터 확인
  if (BT.available()) {
    char command = BT.read(); // 명령 읽기
    Serial.print("수신된 명령: ");
    Serial.println(command);

    if (command == 'O') { // 'O' 명령으로 도어락 열기
      digitalWrite(relayPin, HIGH);
      Serial.println("도어락 열림");
      delay(5000); // 5초 후 자동으로 잠금
      digitalWrite(relayPin, LOW);
      Serial.println("도어락 잠김");
    } else if (command == 'C') { // 'C' 명령으로 도어락 강제 잠금
      digitalWrite(relayPin, LOW);
      Serial.println("도어락 강제 잠김");
    } else {
      Serial.println("알 수 없는 명령어");
    }
  }
}
