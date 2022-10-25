import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NotifikasiScreenAppBar extends StatelessWidget {
  const NotifikasiScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "Notifikasi",
      isHaveActions: false,
    );
  }
}
