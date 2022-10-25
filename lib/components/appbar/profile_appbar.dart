import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ProfileScreenAppBar extends StatelessWidget {
  const ProfileScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "Profile",
      isHaveActions: false,
    );
  }
}
