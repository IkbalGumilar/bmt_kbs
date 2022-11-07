import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/custom_input_without_outline_border.dart';
import 'package:flutter/material.dart';

class StatusTransaksiIsiSaldoScreen extends StatelessWidget {
  const StatusTransaksiIsiSaldoScreen({super.key});

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
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
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
                label: "Jumlah top up",
                inputValue: "Rp. 50.000",
              ),
              CustomInputWithoutOutlineBorder(
                label: "Jumlah yang harus dibayar",
                inputValue: "Rp. 50.500",
              ),
              CustomInputWithoutOutlineBorder(
                label: "Jumlah dibayarkan",
                inputValue: "Rp. 50.500",
              ),
              CustomInputWithoutOutlineBorder(
                label: "Jumlah dibayarkan",
                inputValue: "Rp. 50.500",
              ),
              CustomInputWithoutOutlineBorder(
                label: "Dikirim Dari",
                inputValue: "0982 9878 6154 6218",
                isBanking: true,
                bankCustomer: "Ahmad Doe",
              ),
              CustomInputWithoutOutlineBorder(
                label: "Dikirim ke",
                inputValue: "0215 9878 6154 6218",
                isBanking: true,
                bankCustomer: "Siti Zenab",
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
    );
  }
}
