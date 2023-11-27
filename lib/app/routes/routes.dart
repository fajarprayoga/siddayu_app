import 'package:go_router/go_router.dart';
import 'package:todo_app/app/data/service/local/storage.dart';
import 'package:todo_app/app/screens/home/views/home_page.dart';
import 'package:todo_app/app/screens/login/login_view.dart';
import 'package:todo_app/app/screens/management_tata_kelola/views/management_tata_kelola.dart';
import 'helper.dart';
import 'paths.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    Route.set(Paths.home, (state) => const HomePage(),
        redirect: (_) => _redirect()),
    Route.set(Paths.login, (state) => const LoginView()),
    Route.set(Paths.formTodo, (state) => ManagementTataKelola()),
    Route.set(Paths.managementTataKelola, (state) => ManagementTataKelola()),
  ],
);

String _redirect() {
  String? token = prefs.getString('token');
  return token == null ? Paths.login : Paths.home;
}
