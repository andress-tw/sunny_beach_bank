import 'package:flutter_test/flutter_test.dart';
import 'package:mock_data/mock_data.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';
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
          user: User(
                name: mockName(),
                lastName: mockString(10),
                birthDate: mockDate(),
                id: userId 
              )
          ),
      Account(
          id: mockInteger().toString(),
          balance: mockInteger().toDouble(),
          type: "2",
          user: User(
                name: mockName(),
                lastName: mockString(10),
                birthDate: mockDate(),
                id: userId 
              ) 
          )
    ];

    void arrangeAccountsService() {
      when(() => mockAccountService.getAccountByUser(userId))
          .thenAnswer((_) async => accountFromService[0]);
    }

    test(
      "get account using the service",
      () async {
        arrangeAccountsService();
        sut.getAccountByUser(userId);
        verify(() => mockAccountService.getAccountByUser(userId)).called(1);
      },
    );
    test(
      "should get accounts using the service",
      () async {
        arrangeAccountsService();
        final account = await sut.getAccountByUser(userId);
        expect(account, accountFromService[0]);
      },
    );
  });
}
