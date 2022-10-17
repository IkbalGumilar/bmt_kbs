import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class PulsaScreen extends StatelessWidget {
  const PulsaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: "Pulsa dan Data",
          isHaveActions: false,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputPulsa(
                label: "Nomor Ponsel",
                placeholder: "Masukkan Nomor Ponsel",
                suffixIcon: Icons.contacts_sharp,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomInputPulsa extends StatelessWidget {
  CustomInputPulsa({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.suffixIcon,
  }) : super(key: key);

  String label;
  String placeholder;
  IconData suffixIcon;

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
            suffixIcon: Icon(suffixIcon),
          ),
        ),
      ],
    );
  }
}
