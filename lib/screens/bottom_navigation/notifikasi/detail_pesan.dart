import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class DetailPesanScreen extends StatelessWidget {
  const DetailPesanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title:
              "Selamat! Khusus buat kamu, NIkmatin Cashback 50% Belanja, Jajan,& bayar tagihan pake saldo dana",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis ornare egestas eget sodales. Eget non magna elementum nibh lectus. Cursus commodo vel in purus, et. Ac nibh sit purus orci. Neque nibh sit habitant tincidunt amet felis.",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPallete.primaryColor,
              ),
              child: const Text(
                "Mulai Belanja",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
