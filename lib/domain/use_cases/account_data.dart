import 'package:sunny_beach_bank/domain/models/account/account.dart';
import '../models/account/account_repository.dart';

class AccountDataUseCase {
  final AccountRepository accountRepository;

  AccountDataUseCase(this.accountRepository);

  Future<List<Account>> getAccountsByUser(String userId) => accountRepository.getAccountsByUser(userId);

  Future<List<Account>> getAccounts() => accountRepository.getAccounts();
}
