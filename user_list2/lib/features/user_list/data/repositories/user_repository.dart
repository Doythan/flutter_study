import '../services/user_service.dart';
import '../../domain/models/user.dart';

class UserRepository {
  final UserService userService;

  UserRepository(this.userService);

  Future<List<User>> fetchUsers() async {
    return await userService.fetchUsers();
  }
}
