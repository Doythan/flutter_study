# 🚀 Flutter 상태 관리 & Riverpod 복습 정리  

이제까지 배운 개념들을 한눈에 볼 수 있도록 깔끔하게 정리했습니다!  
이 내용을 보면 `setState()`부터 `Riverpod`, 그리고 추가 개념들까지 빠르게 복습할 수 있습니다! 🚀  

---

## 📌 1️⃣ `setState()` 방식 (StatefulWidget)  
👉 `StatefulWidget` 내에서 한 개의 위젯만 상태를 변경하고 싶을 때 사용  
👉 `setState()`를 호출하면 해당 위젯만 다시 빌드됨  

✅ **setState() 예제**  

```dart
class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0; // ✅ 상태 변수

  void _incrementCounter() {
    setState(() {
      _counter++; // ✅ UI 업데이트
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_counter', style: TextStyle(fontSize: 40)),
            ElevatedButton(onPressed: _incrementCounter, child: Text('증가'))
          ],
        ),
      ),
    );
  }
}
```
✅ **장점**: 간단하고 직관적  
❌ **단점**: 여러 화면에서 상태 공유 불가능  

---

## 📌 2️⃣ Riverpod 방식 (전역 상태 관리)  
👉 앱 전체에서 상태를 공유하고 관리할 때 사용  
👉 `StateNotifier`를 사용하면 자동으로 상태 변경을 감지하고 UI를 업데이트  

✅ **Riverpod 상태 관리 예제**  

```dart
final counterProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); // ✅ 초기 상태는 0

  void increment() => state++; // ✅ 상태 변경
}

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider); // ✅ 상태 읽기

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter', style: TextStyle(fontSize: 40)),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).increment(), // ✅ 상태 변경
              child: Text('증가'),
            )
          ],
        ),
      ),
    );
  }
}
```
✅ **장점**: 여러 화면에서 상태 공유 가능  
✅ **장점**: 필요할 때만 UI 업데이트 (성능 최적화)  
❌ **단점**: `setState()`보다 코드가 약간 복잡  

---

## 📌 3️⃣ `MaterialApp()` 이란?  
👉 Flutter 앱의 기본 설정을 담당하는 위젯  
👉 테마, 네비게이션, 언어 설정 등을 제공  

✅ **MaterialApp() 예제**  

```dart
MaterialApp(
  title: 'Flutter App',
  theme: ThemeData(primarySwatch: Colors.blue),
  home: HomeScreen(),
);
```
✅ 주로 `main.dart`에서 앱 전체를 감싸는 위젯으로 사용! 🚀  

---

## 📌 4️⃣ `TextEditingController()`  
👉 `TextField`의 입력값을 관리하는 컨트롤러  

✅ **TextEditingController 예제**  

```dart
final TextEditingController _controller = TextEditingController();
```
✅ **사용자가 입력한 값 가져오기**  

```dart
String text = _controller.text;
```
✅ **입력값 초기화**  

```dart
_controller.clear();
```

---

## 📌 5️⃣ `if (_controller.text.isNotEmpty)`  
👉 입력창이 비어 있지 않을 때만 실행하는 조건문  
👉 빈 문자열 입력 방지  

✅ **예제**  

```dart
if (_controller.text.isNotEmpty) {
  print("입력값: ${_controller.text}");
} else {
  print("입력창이 비어 있습니다!");
}
```

---

## 📌 6️⃣ `Notifier` 란?  
👉 "알려주는 사람(알림 시스템)"  
👉 `StateNotifier`를 사용하면 상태가 변경될 때 자동으로 UI 업데이트  

✅ **Notifier 예제**  

```dart
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); // ✅ 초기 상태 설정

  void increment() {
    state++; // ✅ 상태 변경 (자동 UI 업데이트)
  }
}
```

---

## 📌 7️⃣ `ProviderScope`  
👉 `ProviderScope`는 Riverpod의 상태를 관리하는 저장소 역할  
👉 `main.dart`에서 `ProviderScope`를 감싸야 Riverpod을 사용할 수 있음  

✅ **예제**  

```dart
void main() {
  runApp(ProviderScope(child: MyApp())); // ✅ ProviderScope 추가
}
```

---

## 📌 8️⃣ `ConsumerWidget`과 `ref`  
👉 `ConsumerWidget`: Riverpod 상태를 사용할 수 있는 위젯  
👉 `ref.watch()`: 상태를 구독하고 UI 자동 업데이트  
👉 `ref.read()`: 상태를 읽고 변경할 때 사용 (UI 자동 업데이트 X)  

✅ **ConsumerWidget 예제**  

```dart
class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider); // ✅ 상태 읽기

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('$counter'),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).increment(), // ✅ 상태 변경
              child: Text('증가'),
            )
          ],
        ),
      ),
    );
  }
}
```

---

## 📌 9️⃣ `setState()` vs `Riverpod` 비교  

| 방식 | 상태 공유 | UI 자동 업데이트 | 사용 예시 |
|------|--------|-------------|----------|
| **setState()** | ❌ 불가능 | ✅ 가능 | 간단한 상태 변경 |
| **Riverpod** | ✅ 가능 | ✅ 가능 | 전역 상태 관리 |

📌 즉, `setState()`는 한 위젯 내부에서만 상태를 관리할 때 사용하고,  
📌 `Riverpod`은 여러 위젯에서 상태를 공유해야 할 때 사용하면 됩니다! 🚀

