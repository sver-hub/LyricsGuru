import 'package:lyrics_guru/busines_logic/models/user.dart';
import 'package:lyrics_guru/db/repository/repository_locator.dart';
import 'package:lyrics_guru/db/repository/user_repository.dart';
import 'package:lyrics_guru/services/auth/auth_service.dart';

class AuthServiceImplementation extends AuthService {
  UserRepository _userRepository = repositoryLocator<UserRepository>();
  @override
  Future<User> getUser() async {
    List<User> users = await _userRepository.getAll();
    if (users.isEmpty) {
      return User();
    }
    print(users[0].refreshToken);
    return users[0];
  }

  @override
  Future<bool> saveUser(User user) async {
    bool result = await _userRepository.save(user);
    return result;
  }
}
