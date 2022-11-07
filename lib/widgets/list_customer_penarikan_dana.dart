import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListCustomerPenarikanDana extends StatelessWidget {
  ListCustomerPenarikanDana(
      {super.key,
      required this.name,
      required this.bank,
      required this.rekening});

  String name;
  String bank;
  String rekening;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40 / 2),
                    image: const DecorationImage(
                      image: NetworkImage("https://picsum.photos/200/300"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "$bank $rekening",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Radio(
              value: true,
              groupValue: const {"0": true},
              // ignore: avoid_print
              onChanged: (value) => print(value),
            ),
          ],
        ),
      ],
    );
  }
}
