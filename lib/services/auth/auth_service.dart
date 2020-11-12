import 'package:lyrics_guru/busines_logic/models/user.dart';

abstract class AuthService {
  Future<User> getUser();

  Future<bool> saveUser(User user);
}
