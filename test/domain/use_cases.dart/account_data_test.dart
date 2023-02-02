import 'package:flutter_test/flutter_test.dart';
import 'package:mock_data/mock_data.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/use_cases/account_data.dart';
import 'package:sunny_beach_bank/infraestructure/driven_adapter/api/account_data_api.dart';

class MockAccountService extends Mock implements AccountDataApi {}

void main() {
  late AccountDataUseCase sut;
  late AccountDataApi mockAccountService;

  setUp(() {
    mockAccountService = MockAccountService();
    sut = AccountDataUseCase(mockAccountService);
  });

  group('account user case', () {
    final userId = mockInteger().toString();
    final accountFromService = [
      Account(
          id: mockInteger().toString(),
          balance: mockInteger().toDouble(),
          type: "1",
          userid: userId),
      Account(
          id: mockInteger().toString(),
          balance: mockInteger().toDouble(),
          type: "2",
          userid: userId)
    ];

    void arrangeAccountsService() {
      when(() => mockAccountService.getAccountsByUser(userId))
          .thenAnswer((_) async => accountFromService);
    }

    test(
      "get account using the service",
      () async {
        arrangeAccountsService();
        sut.getAccountsByUser(userId);
        verify(() => mockAccountService.getAccountsByUser(userId)).called(1);
      },
    );
    test(
      "should get accounts using the service",
      () async {
        arrangeAccountsService();
        final accounts = await sut.getAccountsByUser(userId);
        expect(accounts, accountFromService);
      },
    );
  });
}
