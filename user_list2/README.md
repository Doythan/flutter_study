## 사용자 조회 앱

#### 전체적인 흐름

[1] 앱 실행 (`main.dart`)
 ↓  
[2] `UserListScreen`이 화면에 표시됨  
 ↓  
[3] `UserViewModel`이 `fetchUsers()` 호출하여 사용자 목록 요청  
 ↓  
[4] `fetchUsers()` → `GetUsersUseCase` 실행 (비즈니스 로직 처리)  
 ↓  
[5] `GetUsersUseCase` → `UserRepository` 호출 (데이터 요청)  
 ↓  
[6] `UserRepository` → `UserService` 호출 (API 요청)  
 ↓  
[7] `UserService`가 API에서 사용자 데이터를 가져와서 `UserRepository`에 반환  
 ↓  
[8] `UserRepository`가 데이터를 `GetUsersUseCase`에 반환  
 ↓  
[9] `GetUsersUseCase`가 데이터를 `UserViewModel`에 반환  
 ↓  
[10] `UserViewModel`이 상태를 업데이트 → UI 자동 갱신 (`UserListScreen`)  
 ↓  
[🎉] 사용자 목록이 화면에 표시됨!

#### 코드 흐름 상세 설명

📌 (1) 앱 실행 (main.dart)
- MaterialApp을 실행하고, 첫 화면(UserListScreen)을 표시
- ProviderScope를 최상위에 등록하여 Riverpod 상태 관리 활성화

📌 (2) UI 계층 (UserListScreen)
- userViewModelProvider를 감시하고 (ref.watch(userViewModelProvider))
- 로딩 중이면 로딩 UI 표시
- 데이터가 도착하면 ListView로 사용자 목록 표시

📌 (3) 상태 관리 (UserViewModel)
- fetchUsers()가 실행되면, GetUsersUseCase를 호출
- AsyncLoading 상태를 유지하다가, 데이터가 도착하면 AsyncData(users)로 변경
- UI는 state가 변경될 때마다 자동으로 업데이트됨

📌 (4) 비즈니스 로직 (GetUsersUseCase)
- 앱의 핵심 로직을 담당
- UserRepository.fetchUsers()를 호출해서 데이터를 가져옴
- 데이터를 받아서 UserViewModel에 전달

📌 (5) 데이터 관리 (UserRepository)
- UserService.fetchUsers()를 호출하여 API에서 데이터를 가져옴
- API에서 받아온 데이터를 User 모델 리스트로 변환
- GetUsersUseCase에 반환

📌 (6) API 호출 (UserService)
- http를 사용하여 jsonplaceholder.typicode.com/users에서 사용자 데이터를 가져옴
- User.fromJson()을 사용하여 JSON 데이터를 User 모델로 변환

#### 요약 정리
|계층|역할|파일|
|-----|-----|-----|
UI 계층|	사용자 목록을 화면에 표시|	user_list_screen.dart, user_tile.dart
상태 관리|	상태 변경을 감지하여 UI 업데이트|	user_list_viewmodel.dart
비즈니스 로직|	데이터 요청 & 처리|	get_users.dart (Use Case)
데이터 계층|	API 요청 및 데이터 변환|	user_repository.dart, user_service.dart
API 계층|	서버에서 사용자 데이터 가져오기|	user_service.dart

#### 결론
완벽한 Feature-First + 클린 아키텍처 구조
- UI → ViewModel → Use Case → Repository → Service → API 순서로 동작
- 비즈니스 로직과 데이터 로직이 분리되어 유지보수 & 확장성 뛰어남
- Riverpod 상태 관리를 활용하여 UI가 자동으로 갱신됨
