import 'package:bmt_kbs/screens/initial_page.dart';
import 'package:flutter/material.dart';

class ProfileScreenAppBar extends StatelessWidget {
  const ProfileScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      toolbarHeight: 60,
      title: const Text(
        "Profile",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      centerTitle: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const InitialPageScreen(),
            ),
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
