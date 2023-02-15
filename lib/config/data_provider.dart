import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';

import 'package:sunny_beach_bank/domain/use_cases/user_data.dart';
import 'package:sunny_beach_bank/domain/use_cases/account_data.dart';
class DataProvider extends ChangeNotifier {

  final UserDataUseCase userDataUseCase;
  final AccountDataUseCase accountDataUseCase;

  List<User> users = [];
  List<Account> accounts = [];
  double balance = 0;
  DataProvider(this.userDataUseCase, this.accountDataUseCase){
    getUserData();
    getAccountData();
    updateBalanceByUser("1", "0");
  }

  getUserData() async {
    users = await userDataUseCase.getUsers();
     notifyListeners();
  }

   getAccountData() async {
    accounts = await  accountDataUseCase.getAccounts();
     notifyListeners();
  }

  updateBalanceByUser(userId, value) async {
    double val = double.parse(value);
    balance = await  accountDataUseCase.updateBalanceByUser(userId, val);
    notifyListeners();
  }
}