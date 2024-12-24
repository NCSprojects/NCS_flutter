# 프로젝트 구조

이 문서는 프로젝트 내 폴더 구조와 각 폴더(파일)의 역할을 정리한 것입니다.

## lib/
프로젝트의 루트 폴더입니다. `main.dart`에서 앱이 시작되며, 이후 `app` 폴더를 통해 MaterialApp 설정, 라우팅, 테마 등을 관리하고, `core`, `features`, `widgets`, `localization` 등을 통해 앱 전역 상수, 유틸, 기능별 페이지, 재사용 가능한 위젯, 다국어 지원 등을 구성합니다.

### main.dart
- 앱 실행 진입점. `runApp()`을 통해 앱을 시작하고 `app` 디렉토리 내 설정에 따라 MaterialApp(또는 GetMaterialApp)을 로드합니다.

---

## lib/app/
앱 전체 설정과 관련된 코드를 모아둔 폴더입니다.

- **app.dart**:  
  앱 전반에서 사용할 `MaterialApp` 혹은 `GetMaterialApp` 등을 정의하여 테마, 라우트, 로케일 등의 전역 설정을 담당합니다.

- **router.dart** (또는 navigation 디렉토리):  
  `onGenerateRoute` 또는 `GoRouter` 등을 활용한 라우팅 정의를 담습니다.

- **theme/**:  
  전역 테마, 색상, 스타일 정보를 관리하는 폴더입니다.
    - **app_theme.dart**: 앱 전반에 걸친 테마 설정(ThemeData) 정의
    - **colors.dart**: 앱에서 공용으로 사용하는 색상 정의
    - **styles.dart**: 폰트 스타일, 텍스트 스타일 등의 정의

---

## lib/core/
전역에서 사용 가능한 상수, 유틸 함수, 서비스 로직, 모델 등을 담는 폴더입니다.

- **constants/**:  
  앱 전역 상수, Key, 문자열, URL 등을 정의합니다.
    - **app_strings.dart**: 공용으로 사용하는 문자열 상수
    - **app_keys.dart**: GlobalKey, Storage Key 등 다양한 키값
    - **app_urls.dart**: 서버 혹은 API Endpoint 등 URL 관리

- **utils/**:  
  날짜/시간 처리, 포매팅, 입력값 검증 등 재사용 가능한 유틸 함수 및 클래스를 모읍니다.
    - **date_time_util.dart**: 날짜/시간 관련 유틸 (포매팅, 계산 등)
    - **validators.dart**: 폼 검증 등 유효성 검사 관련 로직

- **services/**:  
  Firebase, 로컬 DB, SharedPreferences, API 통신 등의 서비스 로직을 처리합니다.
    - **firebase/**: Firebase 연동 관련 서비스
        - **firebase_options.dart**: Firebase 초기화 옵션
    - **local/**: 로컬 스토리지, DB 관련 로직
        - **local_storage_service.dart**: SharedPreferences, 내부 DB 관련 로직
    - **remote/**: 원격 API 통신 관련 로직
        - **api_client.dart**: Dio, Retrofit 등을 통한 API 호출 클라이언트
        - **repository_base.dart**: Repository를 위한 기반 인터페이스/클래스

- **models/**:  
  `json_serializable` 등을 사용해 정의한 데이터 모델 클래스들
    - **exhibit.dart**, **reservation.dart**, **user_info.dart** 등 기능별 모델 클래스

- **dependency_injection/**:  
  전역 의존성 주입 설정
    - **init_controller.dart**: 전역적으로 사용되는 컨트롤러 등록 로직

---

## lib/features/
기능(도메인) 단위로 코드를 모아둔 폴더입니다. 각 기능 폴더 내부에서 `presentation`과 `data` 폴더로 나누어 UI 및 상태관리(BLoC/GetX)와 데이터 접근 로직(repository, data source)을 분리합니다.

### 예시: Auth(로그인) 기능
- **auth/**
    - **presentation/**
        - **pages/**
            - **login.dart**: 로그인 화면
        - **bloc/** 또는 **controllers/**: 상태 관리 로직(BLoC나 GetxController)
        - **widgets/**: Auth 관련 공용 UI 위젯
    - **data/**:
        - **auth_repository.dart**, **auth_remote_data_source.dart** 등

### 예시: Exhibits(전시) 기능
- **exhibits/**
    - **presentation/**
        - **pages/**
            - **exhibit_list_page.dart**: 전시 목록 화면
            - **exhibit_detail_page.dart**: 전시 상세 화면
        - **widgets/**
            - **exhibit_card.dart**: 전시 정보 카드 위젯
        - **bloc/**
            - **exhibit_list/**
                - **exhibit_list_bloc.dart**, **exhibit_list_event.dart**, **exhibit_list_state.dart**
            - **exhibit_detail/**
                - **exhibit_detail_bloc.dart**, **exhibit_detail_event.dart**, **exhibit_detail_state.dart**
    - **data/**
        - **exhibit_repository.dart**: 전시 데이터 관리용 Repository
        - **exhibit_remote_data_source.dart**, **exhibit_local_data_source.dart**: 원격/로컬 데이터 소스

### 예시: Reservations(예약) 기능
- **reservations/**
    - **presentation/**
        - **pages/**
            - **reservation_list_page.dart**, **reservation_detail_page.dart**
        - **widgets/**
            - **reservation_item.dart**: 예약 정보 표시 위젯
        - **bloc/**
            - **reservation_list/**
                - **reservation_list_bloc.dart**, **reservation_list_event.dart**, **reservation_list_state.dart**
            - **reservation_detail/**
                - **reservation_detail_bloc.dart**, **reservation_detail_event.dart**, **reservation_detail_state.dart**
    - **data/**
        - **reservation_repository.dart**, **reservation_remote_data_source.dart**, **reservation_local_data_source.dart**

### 예시: Notifications(알림) 기능
- **notifications/**
    - **presentation/**
        - **controllers/**
            - **notification_controller.dart**: 알림 관련 상태 관리(예: GetXController)
        - **pages/**
            - **notification_page.dart**: 알림 목록 화면
        - **widgets/**
            - 알림 관련 공용 위젯
    - **data/**
        - **notification_repository.dart**, **notification_remote_data_source.dart**

### 예시: Settings(설정) 기능
- **settings/**
    - **presentation/**
        - **pages/**
            - **setting_page.dart**: 설정 화면
        - **bloc/** 또는 **controllers/**: 설정 관련 상태 관리 로직
        - **widgets/**
            - 설정 UI 위젯
    - **data/**
        - **settings_repository.dart**, **settings_remote_data_source.dart** 등 (필요시)

---

## lib/widgets/
다른 기능에서도 재사용 가능한 공통 위젯들을 모아둔 폴더입니다.

- **common_button.dart**: 공용 버튼 위젯
- **common_dialogs.dart**: 공용 다이얼로그
- **loading_indicator.dart**: 로딩 표시 위젯 등

---

## lib/localization/
국제화(i18n) 및 로케일 관련 설정 폴더입니다. `flutter_localizations` 및 `intl` 패키지를 활용합니다.

- **l10n/**
    - **intl_en.arb**, **intl_ko.arb** 등: 다국어 리소스 파일
- **localization.dart**: 로케일 설정 및 문자열 번역 로직

---

**정리**  
위와 같은 폴더 구조를 통해 앱의 각 기능 단위로 관련 코드들이 명확히 분리되며, 전역 설정이나 공용 리소스(테마, 위젯, 서비스)는 별도의 폴더에 정리하여 프로젝트의 확장성과 유지보수성을 크게 높일 수 있습니다.