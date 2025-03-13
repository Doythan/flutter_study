import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/todo/ui/widgets/todo_screen.dart';

void main() {
  // // ✅ 환경 설정 (필요 시 AppConfig 사용 가능)
  // AppConfig.init(
  //   flavor: Flavor.production, // Production 환경으로 실행
  //   apiBaseUrl: "https://api.myapp.com",
  // );

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App (MVVM + Riverpod)",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoScreen(), // ✅ 초기 화면 설정
    );
  }
}
