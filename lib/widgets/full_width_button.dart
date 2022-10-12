import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/isi_saldo/konfirmasi.dart';
import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  FullWidthButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          print("test");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => KonfirmasiIsiSaldoScreen(),
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
