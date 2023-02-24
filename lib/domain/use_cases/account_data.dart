import 'package:sunny_beach_bank/domain/models/account/account.dart';
import '../models/account/account_repository.dart';

class AccountDataUseCase {
  final AccountRepository accountRepository;

  AccountDataUseCase(this.accountRepository);
  Future<List<Account>> getAccounts() => accountRepository.getAccounts();
  Future<Account> getAccountByUser(String userId) => accountRepository.getAccountByUser(userId);
  Future<double> updateBalanceByUser(String userId, double value) => accountRepository.updateBalanceByUser(userId, value);
}
