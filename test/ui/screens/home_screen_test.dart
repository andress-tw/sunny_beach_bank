import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_data/mock_data.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
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
        id: '123456789',
        balance: mockInteger().toDouble(),
        type: "1",
        userid: userId),
    Account(
        id: mockInteger(100000000, 999999999).toString(),
        balance: mockInteger().toDouble(),
        type: "2",
        userid: userId)
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
    when(() => mockAccountService.getAccountsByUser(userId))
        .thenAnswer((_) async => accountFromService);
  }

  void arrangeUserService() {
    when(() => mockUserService.getUser(userFromService[0].id))
        .thenAnswer((_) async => userFromService[0]);
  }

  Widget createWidgetUnderTest() {
    return MaterialApp(
        title: 'Home Screen',
        home: HomeScreen(
          user: mockUserService.getUser(userId),
          accounts: mockAccountService.getAccountsByUser(userId),
        ));
  }

  group('Home Screen', () {
    testWidgets(
      "should render Home Screen widget and show user name",
      (WidgetTester tester) async {
        arrangeUserService();
        arrangeAccountsService();

        await mockNetworkImages(() async {
          await tester.pumpWidget(createWidgetUnderTest());

          await tester.pumpAndSettle();

          expect(
              find.text(
                  '${userFromService[0].name} ${userFromService[0].lastName}'),
              findsOneWidget);
        });
      },
    );
    testWidgets(
      "should render Balance widget",
      (WidgetTester tester) async {

        arrangeUserService();
        arrangeAccountsService();

        await mockNetworkImages(() async {
          await tester.pumpWidget(createWidgetUnderTest());

          await tester.pumpAndSettle();
          final expectedAccountResult =accountFromService[0];
          expect(
              find.text(
                  '\$${expectedAccountResult.balance}'),
              findsOneWidget);
          expect(
              find.text('6789'),
              findsOneWidget);
        });
      },
    );
  });
}
