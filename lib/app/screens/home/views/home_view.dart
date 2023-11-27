import 'package:flutter/material.dart';
import 'package:todo_app/app/core/constants/font.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            'SIDDAYU',
            style: Gfont.fs(34).bold,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Sistem Informasi Digital Desa Ayunan')
        ],
      ),
    );
  }
}