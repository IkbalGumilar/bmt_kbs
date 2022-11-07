import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  Widget appBarActions() {
    if (isHaveActions == true) {
      return ElevatedButton(
        onPressed: () {
          // ignore: avoid_print
          print("Isi saldo dibatalkan!");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        child: const Text(
          "Batalkan",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      );
    } else {
      return Container(
        width: 0.0,
        height: 0.0,
        color: Colors.transparent,
      );
    }
  }

  CustomAppBar({
    required this.title,
    this.isHaveActions,
    Key? key,
  }) : super(key: key);

  bool? isHaveActions = false;
  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      toolbarHeight: 60,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      centerTitle: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [appBarActions()],
    );
  }
}
