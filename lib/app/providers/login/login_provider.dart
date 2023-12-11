// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/app/core/extensions/dio_extension.dart';
import 'package:todo_app/app/core/helpers/toast.dart';
import 'package:todo_app/app/data/api/api.dart';
import 'package:todo_app/app/data/service/local/storage.dart';

// import 'package:todo_app/app/providers/user/user_provider.dart';
import '../../routes/paths.dart';

class Auth with ChangeNotifier, UseApi {
  final username = TextEditingController(text: 'kminchelle'),
      password = TextEditingController(text: '0lelplR');
  bool loading = false;
  Future login(BuildContext context) async {
    try {
      loading = true;
      final res = await authApi.login({
        'username': username.text,
        'password': password.text,
      });
      loading = false;
      final map = json.decode(res.data);

      // sesuaikan errornya

      // option 1
      // if (map['status'] == false) {
      //   return Toasts.show(map['message']);
      // }

      // option 2
      if (map['message'] != null && map['message'] != '') {
        return Toasts.show(map['message']);
      }

      String? token = map['token'];

      if (token != null) {
        if (!context.mounted) return;

        // set token to dio
        dio.setToken(token);

        // save token to shared preferences
        prefs.setString('token', token);

        // save user
        prefs.setString('auth', res.data);
        // go to home
        context.go(Paths.home);
      }
    } catch (e, s) {
      print('Error: $e, StackTrace: $s');
    } finally {}
  }
}

final authProvider = ChangeNotifierProvider((ref) => Auth());
