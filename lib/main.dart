import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/app/data/service/local/storage.dart';
import 'app/core/constants/theme.dart';
import 'app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // init flutter, to make sure all the widgets are ready
  WidgetsFlutterBinding.ensureInitialized();

  // init lazyui
  // LazyUi.config(alwaysPortrait: true);

  // init shared preferences
  prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  // init dio, we customize it with the name "fetchly"
  // Fetchly.init(
  //     baseUrl: 'https://api.igsa.pw/api/',
  //     onRequest: RequestHandler.onRequest);

  // dio.setToken(token);

  // NOTE: kamu juga bisa membuat file sendiri untuk menjalankan kode pada bagian ini
  // sehingga file main.dart ini terlihat lebih bersih

  // init provider and run app
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Todo App',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router);
  }
}