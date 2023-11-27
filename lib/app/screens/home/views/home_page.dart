// this base for routes
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/app/core/constants/font.dart';
import 'package:todo_app/app/core/constants/pages.dart';
import 'package:todo_app/app/data/models/user.dart';
// import 'package:todo_app/app/data/service/local/storage.dart';
import 'package:todo_app/app/providers/app_provider.dart';

class HomePage extends ConsumerWidget {
  // final User user;
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // prefs.remove('token');
    final notifier = ref.watch(appStateProvider);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(235, 244, 245, 1),
                Color.fromRGBO(254, 253, 253, 1),
              ])),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: DrawerHeader(
                  decoration: const BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => {},
                        child: const Icon(
                          Icons.arrow_back,
                          size: 17,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 4,
                                  offset: Offset(1, 2))
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Fajar"),
                                  Text(
                                    "Fajarprayoga23@gmail.com",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Daftar widget yang dihasilkan
              ...List.generate(pages.length, (i) {
                return ListTile(
                  title: Text(
                    pages[i]['title'],
                    style: TextStyle(
                        fontWeight: notifier.page == i
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                  onTap: () {
                    final notifier = ref.read(appStateProvider.notifier);
                    // Tindakan yang diambil saat ListTile ditekan
                    notifier.navigateTo(i);
                    Navigator.pop(context);
                  },
                  tileColor: notifier.page == i ? Colors.red : null,
                  selected: notifier.page == i,
                  selectedColor: notifier.page == i
                      ? Colors.lightBlueAccent[300]
                      : Colors.black,
                );
              }),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sistem Informasi Digital Desa Ayunan',
              style: Gfont.bold.fsize(18),
            ),
            pages[notifier.page]['title'] != 'Home'
                ? Text(pages[notifier.page]['title'])
                : SizedBox()
          ],
        ),
        // backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
          padding: EdgeInsets.all(20), child: pages[notifier.page]['page']),
    );
  }
}
