// 사용자 목록 화면
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/user_viewmodel.dart';
import '../widgets/user_tile.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState =
        ref.watch(UserViewModelProvider); // ✅ Riverpod을 통해 데이터 감시!

    return Scaffold(
      appBar: AppBar(title: Text("사용자 목록")),
      body: userState.when(
        data: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) => UserTile(user: users[index]),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text("오류 발생: $error")),
      ),
    );
  }
}
