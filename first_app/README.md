Flutter에서는 **모든 UI가 위젯(Widget)**으로 구성돼 있어.

---

## 📌 **기본적으로 알아야 할 두 가지 위젯 유형**
- **StatelessWidget** → 상태 변경이 없는 정적인 위젯
- **StatefulWidget** → 상태를 변경할 수 있는 동적인 위젯

---

## ✅ **StatelessWidget 특징**
- `build()` 함수는 한 번 실행되고 나면 다시 호출되지 않음
- 화면이 변경될 필요가 없는 **정적인 UI**에 적합

## ✅ **StatefulWidget 특징**
- `setState()`를 호출하면 **UI가 다시 렌더링**됨
- 사용자의 입력을 반영해야 하는 경우 (ex: 버튼 클릭, 입력 필드) 사용

---

## ✅ **주요 개념**

### 🔹 **createState()의 역할**
- `StatefulWidget`은 **변경 가능한 상태(state)**를 가지기 때문에, 상태를 따로 관리할 `State` 클래스를 만들어야 함.
- `createState()` 메서드는 **위젯의 상태를 생성하는 역할**을 함.

### 🔹 **setState()의 역할**
- `StatefulWidget`에서는 **UI가 변경될 때** Flutter가 화면을 다시 그려야 함
- `setState()`를 호출하면 Flutter가 `build()` 함수를 다시 실행해서 **변경된 UI를 반영**
- 예: `_message` 값을 변경한 뒤 `setState()`를 호출하면 **화면이 업데이트됨**
- 👉 `StatefulWidget`에서 `setState()` **는 필수!**

### 🔹 **super.key의 의미**
- `super.key`는 부모 클래스(`StatelessWidget` 또는 `StatefulWidget`)의 `key` 값을 전달하는 역할
- 이를 사용하면 **위젯 트리를 다시 빌드할 때 불필요한 리렌더링을 방지**

### 🔹 **언더스코어(_)**의 의미
- Dart에서 **`_`를 붙이면 해당 요소가 private(비공개)**가 되어 다른 파일에서 접근할 수 없게 됨.

---

## ✅ **주요 위젯**

### 🔹 **ElevatedButton (버튼)**
- **클릭할 수 있는 버튼을 생성**
- `onPressed:` 속성에 함수(이벤트)를 넣어 **버튼을 클릭하면 실행되도록 설정 가능**
- 기본적으로 **입체적인 스타일**이 적용됨 (Material 디자인 기반)
- 📌 평평한 버튼을 원한다면 `TextButton`, **테두리만 있는 버튼**은 `OutlinedButton` 사용 가능

### 🔹 **SizedBox (공백 또는 크기 조절)**
- **공백을 추가하거나 특정 크기의 박스를 만들 때 사용**
- `height`를 설정하면 **세로 간격**, `width`를 설정하면 **가로 간격** 조절 가능

### 🔹 **Row (가로 정렬)**
- `mainAxisAlignment` 속성을 이용해 **정렬 가능** (`start`, `center`, `spaceBetween`, `spaceAround` 등)

### 🔹 **Column (세로 정렬)**
- `mainAxisAlignment` 속성을 이용해 **정렬 가능** (`start`, `center`, `spaceBetween`, `spaceAround` 등)

---

## ✅ **context의 개념**
- `context`는 **`BuildContext` 타입의 객체**
- `BuildContext`는 현재 위젯이 **Flutter 위젯 트리에서 어디에 위치하는지 알고 있는 객체**
- 현재 위젯이 속한 **트리 정보**를 담고 있음
- `context`를 통해 **Navigator(화면 전환), Theme(테마 정보)** 등 현재 위젯이 속한 환경에 접근할 수 있음
- 📌 즉, **`context`는 `BuildContext` 타입의 변수이며, 위젯 트리에서 현재 위젯의 위치를 나타냄!**