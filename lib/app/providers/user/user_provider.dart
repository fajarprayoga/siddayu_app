import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/app/data/models/user.dart';

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  void addUser(User user) {
    state = user;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User?>((_) {
  return UserNotifier();
});
