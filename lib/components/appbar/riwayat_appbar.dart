import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class RiwayatScreenAppBar extends StatelessWidget {
  const RiwayatScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "Riwayat",
      isHaveActions: false,
    );
  }
}
