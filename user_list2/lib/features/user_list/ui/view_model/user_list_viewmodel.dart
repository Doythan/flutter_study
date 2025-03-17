import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/use_cases/get_users.dart';
import '../../domain/models/user.dart';
import '../../data/services/user_service.dart';
import '../../data/repositories/user_repository.dart';

class UserViewModel extends StateNotifier<AsyncValue<List<User>>> {
  final GetUsersUseCase getUsersUseCase;

  UserViewModel(this.getUsersUseCase) : super(const AsyncLoading()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final users = await getUsersUseCase();
      state = AsyncData(users);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}

// ✅ Provider 설정
final userViewModelProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<List<User>>>(
  (ref) => UserViewModel(ref.watch(getUsersUseCaseProvider)),
);

// ✅ Use Case Provider 설정
final getUsersUseCaseProvider = Provider((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return GetUsersUseCase(repository);
});

// ✅ Repository Provider 설정
final userRepositoryProvider = Provider((ref) {
  final userService = UserService();
  return UserRepository(userService);
});
