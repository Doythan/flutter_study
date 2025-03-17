import 'package:flutter/material.dart';
import '../../domain/models/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(user.name[0])), // ✅ 프로필 아이콘 (첫 글자)
      title: Text(user.name), // ✅ 사용자 이름
      subtitle: Text(user.email), // ✅ 사용자 이메일
    );
  }
}
