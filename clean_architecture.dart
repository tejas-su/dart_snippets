void main() async {
  final repoImpl = UserRepositoryImpl();

  final getUserUseCase = GetUserUseCase(repoImpl);

  final screen = UserScreen(getUserUseCase);

  await screen.render('1');
}

//domain layer
class User {
  final String id;
  final String name;

  const User(this.id, this.name);
}

abstract class UserRepository {
  Future<User> getUserById(String id);
}

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<User> call(String id) async {
    return repository.getUserById(id);
  }
}

//data layer
class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> getUserById(String id) async {
    await Future.delayed(Duration(seconds: 3));
    return User(id, 'Tejas');
  }
}

//presentation
class UserScreen {
  final GetUserUseCase getUser;
  UserScreen(this.getUser);

  Future<void> render(String userId) async {
    print('Loading');
    final user = await getUser(userId);
    print('Loaded user: $user');
  }
}
