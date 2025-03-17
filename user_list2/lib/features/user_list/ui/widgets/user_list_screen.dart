import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_model/user_list_viewmodel.dart';
import 'user_tile.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userViewModelProvider); // ✅ 상태 감시

    return Scaffold(
      appBar: AppBar(title: const Text("사용자 목록")),
      body: userState.when(
        data: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) => UserTile(user: users[index]),
        ),
        loading: () =>
            const Center(child: CircularProgressIndicator()), // ✅ 로딩 상태 UI
        error: (error, _) => Center(child: Text("오류 발생: $error")), // ✅ 오류 상태 UI
      ),
    );
  }
}
