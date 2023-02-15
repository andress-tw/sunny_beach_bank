import 'dart:math';

import 'package:mock_data/mock_data.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/models/account/account_repository.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';


class AccountDataApi extends AccountRepository {
  final _accounts = List.generate(
      10,
      (int i) => Account(
          id: mockInteger(100000000, 999999999).toString(),
          balance: mockInteger(1, 20000).toDouble(),
          type: (Random().nextInt(2) + 1).toString(),
          user: User( id : i.toString(),
                      name: mockName(),
                      lastName: mockString(7, 'a'),
                      birthDate: mockDate(),
                      profilePath: 'https://via.placeholder.com/150'
                    )
        ));

  @override
  Future <Account> getAccountByUser(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return _accounts.where((element) => element.user.id == userId).toList()[0];
  }

  @override
  Future<List<Account>> getAccounts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _accounts;
  }
  
  @override
  Future<double> updateBalanceByUser(String userId, double value) async {
    Account account = await getAccountByUser(userId);
    account.balance = account.balance - value;
  return account.balance;
  }
}
