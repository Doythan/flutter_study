# 🚀 Flutter 네비게이션 정리  

Flutter에서 화면을 이동하는 방법은 여러 가지가 있습니다.  
이 문서에서는 `Navigator`, `Named Routes`, 그리고 `onGenerateRoute`를 활용한 네비게이션을 정리합니다.  

---

## 📌 1️⃣ 기본 네비게이션 및 화면 관리 (`Navigator` 활용)  

Flutter에서는 `Navigator`를 사용하여 화면을 이동하고, 관리할 수 있습니다.  

### ✅ **1) `Navigator.push()` & `Navigator.pop()` (기본 네비게이션)**  

```dart
// 새로운 화면으로 이동
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);

// 현재 화면 닫고 이전 화면으로 이동
Navigator.pop(context);
```

✅ **장점**: 간단한 화면 전환이 가능  
❌ **단점**: 화면이 많아질수록 관리가 어려움  

### ✅ **2) `Navigator.pushReplacement()` (이전 화면 제거하고 이동)**  
현재 화면을 새로운 화면으로 교체하고, 이전 화면을 스택에서 제거합니다.  

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);
```

✅ **장점**: 뒤로 가기 버튼으로 이전 화면으로 돌아갈 수 없음  
📌 **사용 예시**: 로그인 화면 → 메인 화면 이동 시  

### ✅ **3) `Navigator.popUntil()` (특정 화면까지 뒤로 가기)**  
스택에서 첫 번째 화면이 나올 때까지 뒤로 이동합니다.  

```dart
Navigator.popUntil(context, (route) => route.isFirst);
```

✅ **장점**: 중간 화면을 모두 제거하고 홈 화면으로 이동 가능  
📌 **사용 예시**: 결제 완료 후 홈 화면으로 이동  

---

## 📌 2️⃣ 네임드 라우트 (`routes`)  
네임드 라우트를 사용하면 `MaterialPageRoute` 없이 문자열(`String`)로 화면을 이동할 수 있습니다.  

### ✅ **1) `routes:` 방식 (기본적인 네임드 라우트)**  
📌 `MaterialApp`의 `routes` 속성에서 화면을 등록한 후 `Navigator.pushNamed()`로 이동  

```dart
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/second': (context) => SecondScreen(),
      '/third': (context) => ThirdScreen(),
    },
  ));
}
```

✅ **네임드 라우트로 이동**  

```dart
Navigator.pushNamed(context, '/second');
```

✅ **장점**: `MaterialPageRoute` 없이 간단한 이동 가능  
❌ **단점**: `arguments`를 전달하기 어려움  

---

## 📌 3️⃣ 동적 네임드 라우트 (`onGenerateRoute`)  
📌 `onGenerateRoute`를 사용하면 화면 이동 시 데이터(`arguments`) 전달이 가능합니다.  

```dart
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) => HomeScreen());
        case '/second':
          final String message = settings.arguments as String;
          return MaterialPageRoute(
              builder: (context) => SecondScreen(message: message));
        default:
          return MaterialPageRoute(builder: (context) => HomeScreen());
      }
    },
  ));
}
```

✅ **데이터를 전달하며 화면 이동**  

```dart
Navigator.pushNamed(
  context,
  '/second',
  arguments: 'Hello from HomeScreen!',
);
```

✅ **데이터 받기 (`second_screen.dart`)**  

```dart
class SecondScreen extends StatelessWidget {
  final String message;
  const SecondScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('전달받은 메시지: $message')),
    );
  }
}
```

✅ **장점**: `arguments`를 전달할 수 있음  
✅ **장점**: `switch-case`로 더 유연한 화면 이동 가능  
❌ **단점**: `routes:`보다 코드가 길어짐  

---
