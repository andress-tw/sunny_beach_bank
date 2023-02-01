import 'package:flutter_test/flutter_test.dart';
import 'package:mock_data/mock_data.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';
import 'package:sunny_beach_bank/domain/use_cases/user_data.dart';
import 'package:sunny_beach_bank/infraestructure/userService.dart';

class MockUserService extends Mock implements UserService {}

void main() {
  late UserDataUseCase sut;

  late UserService mockUserService;

  setUp(() {
    mockUserService = MockUserService();
    sut = UserDataUseCase(mockUserService);
  });

  group('user use case', () {
    final userFromService = [
      User(
        name: mockName(),
        lastName: mockString(10),
        birthDate: mockDate(),
        id: mockInteger().toString(),
      ),
      User(
        name: mockName(),
        lastName: mockString(10),
        birthDate: mockDate(),
        id: mockInteger().toString(),
      ),
      User(
        name: mockName(),
        lastName: mockString(10),
        birthDate: mockDate(),
        id: mockInteger().toString(),
      ),
      User(
        name: mockName(),
        lastName: mockString(10),
        birthDate: mockDate(),
        id: mockInteger().toString(),
      )
    ];
    void arrangeUserService() {
      when(() => mockUserService.getUsers())
          .thenAnswer((_) async => userFromService);
    }

    test(
      "get users using the service",
      () async {
        arrangeUserService();
        await sut.getUsers();

        verify(() => mockUserService.getUsers()).called(1);
      },
    );
  });
}
