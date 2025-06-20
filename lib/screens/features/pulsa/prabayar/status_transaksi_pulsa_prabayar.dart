import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/custom_input_without_outline_border.dart';
import 'package:flutter/material.dart';

class StatusTransaksiPulsaPrabayarScreen extends StatelessWidget {
  const StatusTransaksiPulsaPrabayarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Status Transaksi",
          isHaveActions: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80 / 2),
                              color: Colors.grey[300],
                            ),
                            child: Image.asset(
                              "assets/icons/screens/isi_saldo/success.png",
                              scale: 1.8,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Transaksi Berhasil!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        "1234567891011121314 | Sab 10/06/2022 23:59:40",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    CustomInputWithoutOutlineBorder(
                      label: "Produk",
                      inputValue: "Bicara semua operator 1 hari",
                      isBold: true,
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "Sumber Dana",
                      inputValue: "Saldo",
                      isBold: true,
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "Jumlah Bayar",
                      inputValue: "Rp. 15.000",
                      isBold: true,
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "Biaya Administrasi",
                      inputValue: "Rp. -0",
                      isBold: true,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print("Transaksi Tersimpan!");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallete.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ImageIcon(
                        AssetImage(
                          'assets/icons/screens/isi_saldo/print.png',
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Simpan Bukti Transaksi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
