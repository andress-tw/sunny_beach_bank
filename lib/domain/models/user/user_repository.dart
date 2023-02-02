import 'package:sunny_beach_bank/domain/models/user/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<User> getUser(String id);
}
