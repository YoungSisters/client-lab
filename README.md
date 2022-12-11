# 👑 SpeaKing 👑
AI 기반 영어 말하기 분석 애플리케이션 **👑** **SpeaKing 👑**

## 🎙 프로젝트 소개

영어 자격증을 공부할 때, 영어로 업무를 처리해야할 때, 외국인과 이야기를 나눌 때 등 다양한 상황에서 영어 말하기 실력이 요구되고 있다. 그러나 한국의 영어 말하기 수준은 토플 speaking 성적을 기준으로 168개국 중 122위로 세계 하위권이며, 한국의 영어 학습자는 교실 밖에서 영어를 사용하는 일이 적을 뿐 아니라 교사에게 일대일로 피드백을 제공받기 어려운 스피킹 암흑 지대에 살고있다.


자체 진행한 설문조사에 따르면, 응답자 모두 영어 말하기 첨삭이 필요하다고 생각했지만 첨삭을 받아본 경험이 있다고 응답한 비율은 단 13% 였다. 
첨삭을 받지 않은 주된 이유로는 “어디서 어떻게 받아야 할지 모르겠다, 사람을 상대로 말하는 것이 부담스럽다, 기관을 통해 피드백을 받는 과정이 번거롭다” 가 선택되었다.

이 결과를 바탕으로 사용자가 자신의 발화속도를 확인할 수 있고, 격식/비격식체 문장을 구분할 수 있으며, 반복되는 표현을 얼마나 사용했는지 확인할 수 있는 기능을 어플리케이션에 담고자 한다. 



- [SpeaKing 시연 영상](https://youtu.be/U1pjF98pG2o)
- [SpeaKing 프로토타입](https://youtube.com/shorts/pbpJTnrToT0?feature=share)
- [SpeaKing 제품 설명서](https://www.notion.so/77ba9bb0b97b4460bd5cf4b1281eaf95)

<img width="800" src="https://user-images.githubusercontent.com/68412683/206727129-ffb64038-e4ed-4009-be13-83722bb4c059.png" />

## 🎙 예상 프로젝트 구조

<img width="800" src="https://user-images.githubusercontent.com/68412683/206727399-44b678ce-4cd4-4ea8-9783-fa6ca0523e8d.png" />

- Client: Swift(iOS)
- Server: django, SQLite 및 AWS를 사용한 배포 
- NLP: GBert

## 🎙 팀원 소개

| <img width="200" src="https://user-images.githubusercontent.com/68412683/206727368-df94675f-d152-494c-9535-b99006796519.png"/> | <img width="200" src="https://user-images.githubusercontent.com/68412683/206727359-a653906e-0847-4702-a7e4-4c1ac532bd46.png"/> | <img width="200" src="https://user-images.githubusercontent.com/68412683/206727349-a0454fb5-8b5e-446c-a3ab-c14b19b1c9b9.png"/> |
| --- | --- | --- |
| **이서영** | **이지영** | **이남영** |
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
