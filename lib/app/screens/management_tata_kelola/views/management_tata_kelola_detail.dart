import 'package:flutter/material.dart';

class ManagementTataKelolaDetail extends StatelessWidget {
  final params;
  const ManagementTataKelolaDetail({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(params);
    return Scaffold(
      body: Text("HALo"),
    );
  }
}
