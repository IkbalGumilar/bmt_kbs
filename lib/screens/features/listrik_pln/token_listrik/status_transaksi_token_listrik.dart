import 'dart:developer';

import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/etc/custom_format.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/custom_input_without_outline_border.dart';
import 'package:flutter/material.dart';

class StatusTransaksiTokenListrikScreen extends StatefulWidget {
  StatusTransaksiTokenListrikScreen(
      {super.key, required this.nominal, required this.dataStatusTransaksi});

  Map<String, dynamic> dataStatusTransaksi;
  int nominal;

  @override
  State<StatusTransaksiTokenListrikScreen> createState() =>
      _StatusTransaksiTokenListrikScreenState();
}

class _StatusTransaksiTokenListrikScreenState
    extends State<StatusTransaksiTokenListrikScreen> {
  late Map<String, dynamic> _dataStatusTransaksi;
  late int _nominal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataStatusTransaksi = widget.dataStatusTransaksi;
    _nominal = widget.nominal;
  }

  @override
  Widget build(BuildContext context) {
    log(_dataStatusTransaksi.toString());
    log(_nominal.toString());

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
        child: ListView(
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
                        "${_dataStatusTransaksi['ref_id']} | ${_dataStatusTransaksi['created_at']}",
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
                      inputValue: "Token PLN Rp 5.000",
                      isBold: true,
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "Sumber Dana",
                      inputValue: "Saldo",
                      isBold: true,
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "Jumlah Bayar",
                      inputValue: CustomFormat.ubahFormatRupiah(
                          _dataStatusTransaksi['price'], 0),
                      isBold: true,
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "Biaya Administrasi",
                      inputValue: "Rp. -0",
                      isBold: true,
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "Total Bayar",
                      inputValue: CustomFormat.ubahFormatRupiah(
                          _dataStatusTransaksi['price'], 0),
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
