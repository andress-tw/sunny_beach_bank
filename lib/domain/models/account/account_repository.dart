import 'package:sunny_beach_bank/domain/models/account/account.dart';

abstract class AccountRepository {
  Future<List<Account>> getAccountsByUser(String userId);
}
