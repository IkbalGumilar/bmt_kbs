import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInputPulsa extends StatelessWidget {
  CustomInputPulsa({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.imageIcon,
  }) : super(key: key);

  String label;
  String placeholder;
  String imageIcon;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autocorrect: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            fillColor: ColorPallete.lightBlueColor,
            filled: true,
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
            suffixIcon: Image.asset(
              "assets/icons/screens/pulsa/$imageIcon",
              scale: 2,
            ),
          ),
        ),
      ],
    );
  }
}
