import 'package:flutter/material.dart';
import 'package:todo_app/app/core/constants/font.dart';
import 'package:todo_app/app/core/constants/value.dart';
import 'package:todo_app/app/widgets/widget.dart';

class FormTataKelola extends StatelessWidget {
  const FormTataKelola({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              "Kegiatan / Detail / Create",
              style: Gfont.fs14,
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: gap + 20),
        padding: EdgeInsets.symmetric(horizontal: padding + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormFieldCustom(
              title: 'Nama Kegiatan',
              placeholder: 'Masukan nama kegiatan',
            ),
            FormFieldCustom(
                title: 'Tanggal Kegiatan',
                placeholder: 'Masukan tanggal kegiatan',
                icon: Icons.date_range),
            FormFieldCustom(
              title: 'Deskripsi Kegiatan',
              placeholder: 'Masukan deskripsi kegiatan',
              isMultiLine: true,
            ),
            ButtonIcon(
                label: 'SK',
                placeholder: 'Silahkan upload format PDF',
                icon: Icons.upload_file,
                title: 'Upload file SK',
                onTapFunction: () {}),
            ButtonIcon(
                label: 'Berita Acara',
                placeholder: 'Silahkan upload format PDF',
                icon: Icons.upload_file,
                title: 'Upload file Berita Acara',
                onTapFunction: () {}),
            ButtonIcon(
                label: 'Optional (PBJ)',
                placeholder: 'Silahkan upload format PDF',
                icon: Icons.upload_file,
                title: 'Upload file PBJ',
                onTapFunction: () {})
          ],
        ),
      ),
    );
  }
}

class FormFieldCustom extends StatelessWidget {
  final String title;
  final String placeholder;
  final IconData? icon;
  final bool? isMultiLine;
  const FormFieldCustom(
      {super.key,
      required this.placeholder,
      required this.title,
      this.icon,
      this.isMultiLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: gap - 2,
          ),
          TextFormField(
            validator: (String? arg) {
              if (arg!.length < 3) {
                return 'Email must be more than 2 charater';
              }
              return null;
            },
            controller: null,
            decoration: InputDecoration(
                hintText: placeholder,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary, width: 2),
                  borderRadius: BorderRadius.circular(5.5),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: padding),
                prefixIcon: icon != null ? Icon(icon) : null),
            maxLines: null,
            minLines: isMultiLine ?? false ? 4 : 1,
            onSaved: (String? val) {
              // username.text = val ?? '';
            },
          ),
        ],
      ),
    );
  }
}
