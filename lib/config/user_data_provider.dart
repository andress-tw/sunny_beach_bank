import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sunny_beach_bank/infraestructure/userService.dart';

import '../domain/use_cases/user_data.dart';

final userDataProvider = Provider<UserDataUseCase>((ref) {
  return UserDataUseCase(UserService());
});