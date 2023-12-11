import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/app/data/models/user.dart';
import 'package:todo_app/app/providers/user/user_provider.dart';

class ManagementTataKelola extends ConsumerWidget {
  const ManagementTataKelola({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> user = ref.watch(userProvider);
    print(user.value);
    return Scaffold(
        body: user.when(
            data: (data) {
              print("ini data $data");
              if (data.isEmpty) {
                return const Center(
                    child: Text('No data found, please add new.'));
              }

              return ListView(
                padding: const EdgeInsets.all(20),
                children: List.generate(data.length, (index) {
                  return Text('HALO');
                }),
              );
            },
            error: (e, s) => Center(
                  child: Text(
                    'Error: $e',
                  ),
                ),
            loading: () => const CircularProgressIndicator()));
  }
}
