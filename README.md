# 👑 SpeaKing 👑
## 🎙 프로젝트 소개

영어 시험 준비, 일상 회화, 비즈니스 등 다양한 상황에서 영어 말하기 실력이 요구되고 있다. 이럴ㄴ 각자의 상황에 맞는 나의 영어 말하기를 분석받고 실력을 향상시킬 수 있는 앱을 개발하고자 한다.

AI 기반 영어 말하기 분석 애플리케이션 **👑** **SpeaKing 👑**

- [SpeaKing 시연 영상](https://youtu.be/U1pjF98pG2o)
- [SpeaKing 프로토타입](https://youtube.com/shorts/pbpJTnrToT0?feature=share)
- [SpeaKing 제품 설명서](https://www.notion.so/77ba9bb0b97b4460bd5cf4b1281eaf95)

![r1](https://user-images.githubusercontent.com/68412683/206727129-ffb64038-e4ed-4009-be13-83722bb4c059.png)

## 🎙 예상 프로젝트 구조

![r2](https://user-images.githubusercontent.com/68412683/206727399-44b678ce-4cd4-4ea8-9783-fa6ca0523e8d.png)

- Client: Swift
- Server: django, SQLite
- NLP: GBert

## 🎙 팀원 소개

| <img width="50%" src="https://user-images.githubusercontent.com/68412683/206727368-df94675f-d152-494c-9535-b99006796519.png"/> | <img width="50%" src="https://user-images.githubusercontent.com/68412683/206727359-a653906e-0847-4702-a7e4-4c1ac532bd46.png"/> | <img width="50%" src="https://user-images.githubusercontent.com/68412683/206727349-a0454fb5-8b5e-446c-a3ab-c14b19b1c9b9.png"/> |
| --- | --- | --- |
| 이서영 | 이지영 | 이남영 |
| 클라이언트 | 백엔드 | NLP |

## 🎙 클라이언트 사용 기술

- [레포지토리](https://github.com/YoungSisters/client-lab)
- 음성 녹음
    - AVFoundation
- STT
    - Speech
- API 호출
    - ETRI 발음 평가
    - GrammarBot
    - Alamofire
