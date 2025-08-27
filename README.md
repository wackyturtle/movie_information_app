# 🎬 Movie Information App

TMDB API를 활용해 최신/인기/평점 높은 영화들을 탐색하고, 포스터 → 상세 화면으로 자연스럽게 전환되는 **Hero 애니메이션**을 경험할 수 있는 영화 정보 앱입니다.  
학습 목표는 **애니메이션 위젯 적용**, **클린 아키텍처 설계**, **외부 API 연동**입니다.

---

## ✨ 주요 기능 (Key Features)

### 홈 화면
- 상단 *가장 인기있는* 포스터 영역(패딩 20 제외 가로 전체)
- 가로 스크롤 리스트 4종: **현재 상영중 · 인기순 · 평점 높은순 · 개봉예정** (각 20개, item 높이 180)
- 섹션 라벨/칩 노출, **인기순 섹션은 랭킹 넘버 오버레이** 표시

### 상세 화면
- 포스터를 **가로 전체**로 보여주는 히어로 전환
- 기본 정보: **영화 제목, 개봉일, 태그라인, 런타임, 장르**
- 설명: **Overview**
- 지표: **평점, 투표수, 인기점수, 예산/수익**
- **제작사 로고** 가로 리스트(투명 배경)

### 애니메이션
- 리스트 아이템 → 상세 진입 시 **Hero 애니메이션** (두 화면에서 **동일 tag** 사용, 단일 위젯 내 tag **중복 금지**)

### 데이터 연동
- **TMDB API** 연동(Authorization: `Bearer <YOUR_TOKEN>`)
- 네트워크로 가져온 데이터를 클린 아키텍처 레이어에 맞춰 매핑/표시

---

## 사용자가 할 수 있는 일
- 홈에서 섹션별 영화들을 **가로 스크롤**로 탐색
- 포스터를 **터치**해 상세 화면으로 자연스러운 이동
- 상세 화면에서 영화의 **기본 정보,설명, 지표**를 한눈에 확인

---

## 🖼️ 스크린샷 (Screenshots)
> 프로젝트에 `docs/screens` 폴더를 만든 후 아래와 같이 이미지를 추가해 주세요.

```
![Home - Popular](docs/screens/home_1.png)
![Home - Lists](docs/screens/home_2.png)
![Detail - Header](docs/screens/detail_1.png)
![Detail - Info](docs/screens/detail_2.png)
```

---

## 기술 스택 + 아키텍처

**UI, 애니메이션**
- CustomScrollView / Sliver
- Hero Animation

**상태관리**
- Riverpod

**API**
- Dio
- TMDB

**Clean Architecture**
```
presentation/   # Page, ViewModel
domain/         # Entity, Repository Interface, UseCase
data/           # DTO, DataSource, Repository Implements
```

---
