import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/user_list/ui/widgets/user_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp())); // ✅ Riverpod 상태 관리 적용
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '사용자 조회 앱',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserListScreen(), // ✅ 메인 화면 설정
    );
  }
}
