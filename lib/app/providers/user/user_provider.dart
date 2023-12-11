import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/app/data/api/api.dart';
import 'package:todo_app/app/data/models/user.dart';

class UserNotifier extends StateNotifier<AsyncValue<List<User>>> with UseApi {
  UserNotifier() : super(const AsyncValue.loading());
  List resData = [
    {
      'id': 1,
      'username': 'rama',
      'email': 'rama@example.com',
      'firstName': 'rama',
      'lastName': 'widana',
      'gender': 'male',
      'image': '',
      'position': 'staff'
    }
  ];
  Future getUserStaff() async {
    try {
      state = const AsyncValue.loading();
      // List data = await resData;
      state = AsyncValue.data(resData.map((e) => User.fromJson(e)).toList());
    } catch (e, s) {
      print('Error: $e, $s');
    }
  }
}

final userProvider =
    StateNotifierProvider.autoDispose<UserNotifier, AsyncValue<List<User>>>(
        (ref) {
  return UserNotifier();
});
