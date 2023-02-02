import 'package:flutter_test/flutter_test.dart';
import 'package:mock_data/mock_data.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sunny_beach_bank/domain/models/user/user.dart';
import 'package:sunny_beach_bank/domain/use_cases/user_data.dart';
import 'package:sunny_beach_bank/infraestructure/user_service.dart';

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
    void arrangeUsersService() {
      when(() => mockUserService.getUsers())
          .thenAnswer((_) async => userFromService);
    }
    void arrangeUserService() {
      when(() => mockUserService.getUser(userFromService[0].id))
          .thenAnswer((_) async => userFromService[0]);
    }

    test(
      "get users using the service",
      () async {
        arrangeUsersService();
        await sut.getUsers();

        verify(() => mockUserService.getUsers()).called(1);
      },
    );

    test(
      "should call the user service one time",
      () async {
        arrangeUserService();
        final id = userFromService[0].id;
        await sut.getUser(id);
        verify(() => mockUserService.getUser(id)).called(1);
      },
    );
    test(
      "should get one user using the service",
      () async {
        arrangeUserService();
        final id = userFromService[0].id;
        final user = await sut.getUser(id);
        expect(user.name, userFromService[0].name);
      },
    );
  });
}
