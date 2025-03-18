// 사용자 UI(User Tile 위젯젯)
import 'package:flutter/material.dart';
import '../models/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(user.name[0])),
      title: Text(user.name),
      subtitle: Text(user.email),
    );
  }
}
