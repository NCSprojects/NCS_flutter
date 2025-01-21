# 프로젝트 구조 [2025/01/16]

---

## assets/fonts/

- Pretendard의 ttf 파일들이 종류별로 위치해 있습니다.

## assets/icons/

- SVG 아이콘들이 종류별로 위치해 있습니다.

## assets/images/

- PNG 포스터들이 종류별로 위치해 있습니다.

---

## lib/

### main.dart

- 앱 실행 진입점  
  - `runApp()`으로 앱을 시작합니다.

---

### lib/app/

- **theme/**  
  - **app_color.dart**: 앱에서 사용할 주요 색상 정의  
  - **custom_box_shadow.dart**: 공용 BoxShadow 스타일 정의  
  - **custom_button.dart**: 공용 버튼 위젯 / 스타일 정의  
  - **custom_num_input.dart**: 숫자 입력 위젯 / 스타일 정의  
  - **custom_text_style.dart**: 텍스트 스타일 정의

---

### lib/comm/

- **setting/**  
  - **init_controller.dart**: 앱 실행 시 초기화 관련 로직  
  - **navigator_named.dart**: 네비게이션, 라우팅 관련 설정  
  - **screen_util_setting.dart**: 화면 크기에 따른 UI 스케일링 등 공용 설정
- **system/**  
  - **getx_controller.dart**: 전역적으로 사용되는 GetX 컨트롤러

---

### lib/core/

- **constants/**  
  - 앱 전역 상수, 키, 문자열, URL 등 정의
- **models/**  
  - `json_serializable` 등을 사용한 데이터 모델 클래스
- **services/**  
  - **firebase/**  
    - **firebase_options.dart**: Firebase 초기화 옵션  
  - (필요에 따라 로컬/원격 관련 로직을 추가로 분리할 수 있습니다.)
- **utils/**  
  - 날짜/시간 처리, 입력값 검증, 포매팅 등 재사용 가능한 유틸 함수 및 클래스

---

### lib/features/

각 도메인(기능)별 폴더입니다.  
UI(`presentation`)와 데이터(`data`) 로직을 분리하는 방식을 권장합니다.

- **auth/**  
  - **presentation/**  
    - **pages/**  
      - **login.dart**: 로그인 화면
- **codes/**  
  - **presentaion/**: 코드 관련 UI 및 상태관리
- **exhibits/**  
  - **data/**: 전시 관련 데이터 Repository, Data Source 등  
  - **presentation/**  
    - **bloc/**  
      - **swipe_cubit.dart**: 스와이프 상태관리  
    - **pages/**  
      - **3F/big_history_main.dart**  빅히스토리 페이지 메인화면
      - **4F/cosmos_main.dart**, 코스모스 페이지 메인화면 **infinite_swipe_view.dart**  스와이프뷰
      - **5F/scope_main.dart**  천체관측 페이지 메인화면
    - **widgets/**  
      - **exhibit_card.dart**, **exhibit_container.dart**, **exhibit_guid_arrow.dart**  전시 페이지 위젯
- **home/**  
  - **presentation/**  
    - **pages/**  
      - **home_page.dart**: 홈 화면  
  - **widgets/**  
    - **main_container_off.dart**: 홈화면에서 사용하는 메인 컨테이너 위젯
- **initialization/**  
  - **presentation/**  
    - **pages/**  
      - **loding.dart**: 초기 로딩 화면
- **navigation/**  
  - **presentation/**  
    - **bloc/**  
      - **bottom_navigation_cubit.dart**: 하단 탭 관련 상태관리  
    - **widgets/**  
      - **backspace_app_bar.dart**, **common_app_bar.dart**, **common_bottom_nav.dart**  
- **notifications/**  
  - **presentation/**  
    - **bloc/**  
      - **alarm_cubit.dart**  알람 상태 관리
    - **controllers/**  
      - **notification_controller.dart**  
    - **pages/**  
      - **alarm_main.dart**  알람 메인 화면
    - **widgets/**  
      - **alarm_container.dart**  알람 위젯
- **reservations/**  
  - **data/**: 예약 정보 Repository, Data Source  
  - **presentation/**: 예약 관련 UI, 상태관리
- **settings/**  
  - **presentation/**  
    - **pages/**  
      - **setting_page.dart**: 설정 화면

---


## 정리

- **app/theme/**: 공용 테마/스타일 정의  
- **comm/**: 전역 설정, 시스템 초기화, 네비게이션 등 공통 로직  
- **core/**: 전역 상수, 모델, 서비스(Firebase 등), 유틸 함수  
- **features/**: 기능(도메인)별 폴더  
- **localization/**: 다국어 지원 관련  
- **main.dart**: 앱 실행 진입점
