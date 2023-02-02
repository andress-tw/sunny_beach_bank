import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_data/mock_data.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunny_beach_bank/domain/models/account/account.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';
import 'package:sunny_beach_bank/infraestructure/driven_adapter/api/account_data_api.dart';
import 'package:sunny_beach_bank/infraestructure/driven_adapter/api/user_data_api.dart';
import 'package:sunny_beach_bank/ui/screens/home_screen.dart';

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

    final userFromService = [
      User(
        name: mockName(),
        lastName: mockString(10),
        birthDate: mockDate(),
        id: "1",
      )];

    void arrangeAccountsService() {
      when(() => mockAccountService.getAccountsByUser(userId))
          .thenAnswer((_) async => accountFromService);
    }

     void arrangeUserService() {
      when(() => mockUserService.getUser(userFromService[0].id))
          .thenAnswer((_) async => userFromService[0]);
    }
  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'News App',
      home: HomeScreen(
        user: mockUserService.getUser("1"),
        accounts: mockAccountService.getAccountsByUser("1"),
      )
    );
  }
  group('', () {

    testWidgets(
      "",
      (WidgetTester tester) async {
        arrangeUserService();
        arrangeAccountsService();

        await tester.pumpWidget(createWidgetUnderTest());
        await tester.pump();

        expect(find.text(userFromService[0].name), findsOneWidget);
      },
    );

  });
}
