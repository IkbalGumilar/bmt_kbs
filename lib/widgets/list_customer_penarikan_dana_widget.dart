import 'package:flutter/material.dart';

class ListCustomerPenarikanDanaWidget extends StatelessWidget {
  ListCustomerPenarikanDanaWidget(
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
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/200/300"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toUpperCase(),
                      style: TextStyle(
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
              groupValue: {true},
              onChanged: (value) => print(value),
            ),
          ],
        ),
      ],
    );
  }
}
