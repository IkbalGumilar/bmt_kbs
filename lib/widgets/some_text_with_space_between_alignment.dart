// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SomeTextWithSpaceBetweenAlignment extends StatelessWidget {
  SomeTextWithSpaceBetweenAlignment({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
