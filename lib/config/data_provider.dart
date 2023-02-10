import 'package:flutter/material.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';
import 'package:sunny_beach_bank/domain/use_cases/account_data.dart';
import 'package:sunny_beach_bank/infraestructure/driven_adapter/api/account_data_api.dart';
import 'package:sunny_beach_bank/infraestructure/driven_adapter/api/user_data_api.dart';

import '../domain/use_cases/user_data.dart';

class DataProvider extends ChangeNotifier {

  List<User> users = [];
  List<Account> accounts = [];

  DataProvider(){
    getUserData();
    getAccountData();
  }

  getUserData() async {
    users = await UserDataUseCase(UserDataApi()).getUsers();
     notifyListeners();
  }
  getAccountData() async {
    accounts = await  AccountDataUseCase(AccountDataApi()).getAccounts();
     notifyListeners();
  }
}
