import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class KonfirmasiPulsaDanPaket extends StatelessWidget {
  const KonfirmasiPulsaDanPaket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: "Konfirmasi Pembayaran",
          isHaveActions: false,
        ),
      ),
      body: ListView(
        children: [
          Column(children: [
            
          ],),
        ],
      ),
    );
  }
}
