// ViewMode (Riverpod Provider)
// 사용자 데이터를 관리하는 StateNotifier를 만들자 !
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../repository/user_repository.dart';

class UserViewModel extends StateNotifier<AsyncValue<List<User>>> {
  final UserRepository repository;

  UserViewModel(this.repository) : super(AsyncLoading()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final users = await repository.FetchUser();
      state = AsyncData(users); // ✅ 데이터를 받아서 상태 업데이트!
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

// Provider 등록
final UserViewModelProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<List<User>>>(
  (ref) => UserViewModel(ref.watch(userRepositoryProvider)),
);
