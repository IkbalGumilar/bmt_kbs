// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInputWithoutOutlineBorder extends StatelessWidget {
  CustomInputWithoutOutlineBorder({
    Key? key,
    required this.label,
    required this.inputValue,
    this.isBold,
    this.isImportant,
    this.isBanking,
    this.isColored,
    this.bankCustomer = "INSERT_NAME_HERE",
  }) : super(key: key);

  String label;
  String inputValue;
  bool? isBold;
  bool? isImportant;
  bool? isBanking;
  bool? isColored = false;
  String? bankCustomer;

  String bankCheck() {
    if (isBanking == true) {
      String? customerName = bankCustomer;

      if (customerName != null) {
        return "Bank Mandiri A/n $bankCustomer";
      } else {
        return "";
      }
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        if (isBanking == true)
          const SizedBox(
            height: 5,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isBanking == true)
              Text(
                bankCheck(),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            TextField(
              autocorrect: false,
              controller: TextEditingController(text: inputValue),
              decoration: InputDecoration(),
              style: TextStyle(
                fontWeight:
                    isBold == true ? FontWeight.bold : FontWeight.normal,
                fontSize: isImportant == true ? 20 : 14,
                color: isColored == true ? Colors.orange[900] : Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
