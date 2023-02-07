import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_data/mock_data.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';
import 'package:sunny_beach_bank/infraestructure/driven_adapter/api/account_data_api.dart';
import 'package:sunny_beach_bank/ui/screens/transfer_screen.dart';


class MockAccountService extends Mock implements AccountDataApi {}
void main() {
  
  late AccountDataApi mockAccountService;
  const userId = "1";

  setUp(() {
    mockAccountService = MockAccountService();
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
  void arrangeAccountsService() {
    when(() => mockAccountService.getAccounts())
        .thenAnswer((_) async => accountFromService);
  }

  Widget createWidgetUnderTest() {
    return  MaterialApp(
        title: 'Transfer Screen',
        home: TransferScreen(
          accounts: mockAccountService.getAccounts()
        ));
  }
  group('Transfer Screen', () {

    testWidgets(
      "Should render Info Account Transfer widget",
      (WidgetTester tester) async {
         arrangeAccountsService();
        await mockNetworkImages(() async {
          await tester.pumpWidget(createWidgetUnderTest());

          await tester.pumpAndSettle();

          expect(
              find.byKey(const Key('transfer_widget')),findsOneWidget);
        });
      },
    );
  });
}
