import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DaftarKontakScreen extends StatelessWidget {
  const DaftarKontakScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: "Daftar Kontak",
          isHaveActions: false,
        ),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
