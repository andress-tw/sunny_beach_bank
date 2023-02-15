import 'package:sunny_beach_bank/domain/models/account/account.dart';

abstract class AccountRepository {
  Future<List<Account>> getAccounts();
  Future<Account> getAccountByUser(String userId);
  Future<double> updateBalanceByUser(String userId, double value);
}
