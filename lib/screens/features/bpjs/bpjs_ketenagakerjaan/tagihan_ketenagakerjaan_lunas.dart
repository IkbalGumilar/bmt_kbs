import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class TagihanKetenagakerjaanLunasScreen extends StatelessWidget {
  const TagihanKetenagakerjaanLunasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "BPJS Ketenagakerjaan",
          isHaveActions: false,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 10.0,
              bottom: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  runSpacing: 10,
                  children: [
                    const Text(
                      "ID Pelanggan",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    TextField(
                      controller:
                          TextEditingController(text: "5366 1238 1527 2"),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: ColorPallete.lightBlueColor,
                        hintText: "Masukkan No. BPJS",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Text(
                      "Tagihan sudah dibayar",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/img/tagihan_lunas.png',
                  width: 150,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Kamu tidak memiliki tagihan baru",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
