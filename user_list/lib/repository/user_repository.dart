// 사용자 데이터 가져오기 (Repository)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

class UserRepository {
  Future<List<User>> FetchUser() async {
    await Future.delayed(Duration(seconds: 2)); // 가짜 딜레이
    return [
      User(id: 1, name: "Alice", email: "alice@example.com"),
      User(id: 2, name: "Bob", email: "Bob@example.com"),
      User(id: 3, name: "Charlie", email: "Charlie@example.com"),
      User(id: 4, name: "Ethan", email: "Ethan@example.com"),
    ];
  }
}

// Provider 등록
final userRepositoryProvider = Provider((ref) => UserRepository());
