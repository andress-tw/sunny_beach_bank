import 'dart:math';

import 'package:mock_data/mock_data.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/models/account/account_repository.dart';

class AccountDataApi extends AccountRepository {
  final _accounts = List.generate(
      10,
      (int i) => Account(
          id: mockInteger(100000000, 999999999).toString(),
          balance: mockInteger(1, 20000).toDouble(),
          type: (Random().nextInt(2) + 1).toString(),
          userid: i.toString()));

  @override
  Future<List<Account>> getAccountsByUser(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return _accounts.where((element) => element.userid == userId).toList();
  }
}
