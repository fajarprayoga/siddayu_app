import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/app/core/constants/font.dart';
import 'package:todo_app/app/core/constants/value.dart';
import 'package:todo_app/app/routes/paths.dart';

class ManagementTataKelolaDetail extends StatelessWidget {
  final params;
  const ManagementTataKelolaDetail({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print((params));
    return Scaffold(
      appBar: AppBar(
          title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Management Tata Kelola ",
            style: Gfont.bold,
          ),
          Text(
            "Kegiatan",
            style: Gfont.fs14,
          )
        ],
      )),
      body: RefreshIndicator(
        onRefresh: () async {
          // Menunggu beberapa saat, misalnya, menggunakan Future.delayed
          await Future.delayed(Duration(seconds: 2));

          // Setelah menunggu, lakukan aksi yang diinginkan di sini
          print('Aksi refresh telah selesai');

          // Return value jika diperlukan
          return;
        },
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            children: [
              SizedBox(height: gap),
              ButtonAddKegiatan(),
              SizedBox(
                height: gap,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListKegiatan(
                      name: 'Kegiatan ' + (++index).toString(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListKegiatan extends StatelessWidget {
  final String name;
  const ListKegiatan({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: marginVertical),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.blueGrey,
            //   blurRadius: 4,
            //   offset: Offset(0, 0.5), // Posisi bayangan
            // ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.list),
              SizedBox(
                width: gap,
              ),
              Text(name),
            ],
          ),
          Icon(
            Icons.arrow_right,
            color: primary,
            size: 24,
          )
        ],
      ),
    );
  }
}

class ButtonAddKegiatan extends StatelessWidget {
  const ButtonAddKegiatan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          context.push(Paths.formManagementTataKelola);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius - 10),
            color: primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                "Tambah Kegiatan",
                style: Gfont.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
