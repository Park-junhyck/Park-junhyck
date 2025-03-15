#include <SoftwareSerial.h>

SoftwareSerial BT(10, 11); // RX, TX 핀 설정
int relayPin = 13; // 릴레이 핀 연결

void setup() {
  pinMode(relayPin, OUTPUT);
  digitalWrite(relayPin, LOW); // 도어락 초기 상태 (잠김)
  
  BT.begin(9600); // 블루투스 모듈 통신 시작
  Serial.begin(9600); // 디버깅 용
  Serial.println("스마트 도어락 시스템 시작");
}

void loop() {
  if (BT.available()) { // 블루투스 데이터 수신 여부 확인
    char command = BT.read(); // 블루투스 명령어 읽기
    Serial.print("수신된 명령어: ");
    Serial.println(command);

    if (command == 'O') { // 'O'로 도어락 열기
      digitalWrite(relayPin, HIGH);
      Serial.println("도어락 열림");
      delay(5000); // 5초 동안 열린 상태 유지
      digitalWrite(relayPin, LOW);
      Serial.println("도어락 잠김");
    } else {
      Serial.println("알 수 없는 명령어");
    }
  }
}
