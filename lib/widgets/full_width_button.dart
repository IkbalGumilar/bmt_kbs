import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FullWidthButton extends StatelessWidget {
  FullWidthButton({
    Key? key,
    required this.text,
    required this.navigateTo,
  }) : super(key: key);

  String text;
  Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // ignore: avoid_print
          print("Button ter-click");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => navigateTo,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPallete.primaryColor,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
