import 'dart:math';

import 'package:mock_data/mock_data.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';
import 'package:sunny_beach_bank/domain/models/user/user_repository.dart';

class UserService extends UserRepository {
  final _users = List.generate(
    10,
    (int i) => User(
      id: i.toString(),
      name: mockName(),
      lastName: mockString(10),
      birthDate: mockDate(),
    ),
  );

  @override
  Future<User> getUser(id) async {
    await Future.delayed(const Duration(seconds: 1));
    return _users.firstWhere((element) => element.id == id);
  }

  @override
  Future<List<User>> getUsers() async {
    await Future.delayed(const Duration(seconds: 1));
    return _users;
  }
}
