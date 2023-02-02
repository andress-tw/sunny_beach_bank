import '../models/user/user.dart';
import '../models/user/user_repository.dart';

class UserDataUseCase {
  final UserRepository userRepository;

  UserDataUseCase(this.userRepository);
  Future<List<User>> getUsers() => userRepository.getUsers();
  Future<User> getUser(String id) => userRepository.getUser(id);
}
