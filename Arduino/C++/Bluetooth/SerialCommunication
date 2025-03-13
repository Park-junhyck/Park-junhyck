#include <SoftwareSerial.h>

// 블루투스 모듈 핀 설정
SoftwareSerial BT(10, 11); // RX = 핀 10, TX = 핀 11

void setup() {
    // 블루투스와 시리얼 통신 시작
    BT.begin(9600);        // 블루투스 통신 속도 설정
    Serial.begin(9600);    // 디버깅용 시리얼 통신
    Serial.println("블루투스 통신 시작!");
}

void loop() {
    // 블루투스 데이터 수신 확인
    if (BT.available()) {
        char received = BT.read(); // 블루투스 명령 읽기
        Serial.print("수신된 데이터: ");
        Serial.println(received);

        // 데이터를 블루투스 모듈로 다시 전송
        BT.print("확인: ");
        BT.println(received);
    }

    // 시리얼 모니터에서 입력한 데이터를 블루투스 모듈로 전송
    if (Serial.available()) {
        char data = Serial.read();
        BT.print("전송: ");
        BT.println(data);
    }
}
