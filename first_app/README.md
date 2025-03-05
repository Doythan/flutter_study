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

---
# 🚀 Flutter 주요 UI 위젯 정리  

Flutter에서 자주 사용되는 UI 위젯을 정리했습니다.  

---

## 📌 1️⃣ 레이아웃 관련 위젯  

### ✅ **1. `Container` (기본 박스 위젯)**  
배경색, 크기, 여백, 패딩, 테두리 등을 설정할 수 있는 기본적인 위젯  

```dart
Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(20),
  margin: EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Text('Hello Container', style: TextStyle(color: Colors.white)),
)
```

### ✅ **2. `Row` (가로 정렬)**  
위젯을 가로 방향으로 배치  

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.star, size: 50, color: Colors.yellow),
    Icon(Icons.favorite, size: 50, color: Colors.red),
    Icon(Icons.thumb_up, size: 50, color: Colors.blue),
  ],
)
```

### ✅ **3. `Column` (세로 정렬)**  
위젯을 세로 방향으로 배치  

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('첫 번째 줄'),
    Text('두 번째 줄'),
    ElevatedButton(onPressed: () {}, child: Text('버튼')),
  ],
)
```

### ✅ **4. `Stack` (위젯을 겹쳐 배치)**  
위젯을 서로 겹쳐서 배치 (Z축 방향 레이아웃)  

```dart
Stack(
  alignment: Alignment.center,
  children: [
    Container(width: 200, height: 200, color: Colors.blue),
    Container(width: 100, height: 100, color: Colors.red),
    Text('중앙', style: TextStyle(fontSize: 24, color: Colors.white)),
  ],
)
```

---

## 📌 2️⃣ 리스트 & 스크롤 관련 위젯  

### ✅ **5. `ListView` (스크롤 가능한 리스트)**  
스크롤 가능한 리스트 형태로 여러 개의 아이템을 표시  

```dart
ListView.builder(
  itemCount: 10,
  itemBuilder: (context, index) {
    return ListTile(title: Text('아이템 ${index + 1}'));
  },
)
```

### ✅ **6. `GridView` (그리드 형태 리스트)**  
격자 형태로 아이템을 배치  

```dart
GridView.count(
  crossAxisCount: 2,
  children: [
    Container(color: Colors.blue, height: 100),
    Container(color: Colors.red, height: 100),
    Container(color: Colors.green, height: 100),
    Container(color: Colors.orange, height: 100),
  ],
)
```

### ✅ **7. `SingleChildScrollView` (스크롤 가능하게 만들기)**  
Column 또는 Row를 감싸서 스크롤 가능하게 만듦  

```dart
SingleChildScrollView(
  child: Column(
    children: List.generate(20, (index) => Text('아이템 ${index + 1}')),
  ),
)
```

---

## 🚀 정리  

| 위젯 | 역할 |
|------|------|
| **Container** | 크기, 배경색, 패딩 등을 설정할 수 있는 기본 박스 |
| **Row** | 가로 정렬 (수평 배치) |
| **Column** | 세로 정렬 (수직 배치) |
| **Stack** | 위젯을 겹쳐서 배치 |
| **ListView** | 스크롤 가능한 리스트 |
| **GridView** | 격자(그리드) 형태의 리스트 |
| **SingleChildScrollView** | Column, Row를 스크롤 가능하게 만듦 |

이제 **Flutter UI 위젯**을 활용하여 원하는 화면을 만들어보세요! 🚀

