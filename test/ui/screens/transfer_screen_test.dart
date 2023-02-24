import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_data/mock_data.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:provider/provider.dart';
import 'package:sunny_beach_bank/config/data_provider.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';
import 'package:sunny_beach_bank/domain/use_cases/account_data.dart';
import 'package:sunny_beach_bank/domain/use_cases/user_data.dart';
import 'package:sunny_beach_bank/infraestructure/driven_adapter/api/account_data_api.dart';
import 'package:sunny_beach_bank/infraestructure/driven_adapter/api/user_data_api.dart';
import 'package:sunny_beach_bank/ui/screens/transfer_screen.dart';

class MockAccountService extends Mock implements AccountDataApi {}

class MockUserService extends Mock implements UserDataApi {}

void main() {
  late AccountDataApi mockAccountService;
  late UserDataApi mockUserService;
  const userId = "1";

  setUp(() {
    mockAccountService = MockAccountService();
    mockUserService = MockUserService();
  });
  final accountFromService = [
    Account(
        id: '123456789',
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
        id: mockInteger(100000000, 999999999).toString(),
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

  final userFromService = [
    User(
      name: mockName(),
      lastName: mockString(10),
      birthDate: mockDate(),
      id: userId,
    )
  ];

  void arrangeAccountsService() {
    when(() => mockAccountService.getAccounts())
        .thenAnswer((_) async => accountFromService);
    when(() => mockAccountService.updateBalanceByUser(userId, 0))
        .thenAnswer((_) async => 0.0);
  }

  void arrangeUserService() {
    when(() => mockUserService.getUsers())
        .thenAnswer((_) async => userFromService);
  }

  Widget createWidgetUnderTest() {
    return  MaterialApp(
        title: 'Home Screen',
        home: ChangeNotifierProvider(
          create: (_) => DataProvider(
            UserDataUseCase(mockUserService), 
          AccountDataUseCase(mockAccountService)
          ),
          child: TransferScreen(),
        ));
  }
  
  group('Transfer Screen', () {

    testWidgets(
      "Should render Info Account Transfer widget",
      (WidgetTester tester) async {
        arrangeUserService();
        arrangeAccountsService();
        await mockNetworkImages(() async {

          await tester.pumpWidget(
            createWidgetUnderTest()
            );
          await tester.pumpAndSettle();
          expect(find.byKey(const Key('transfer_widget')),findsOneWidget);
        });
      },
    );
  });
}
