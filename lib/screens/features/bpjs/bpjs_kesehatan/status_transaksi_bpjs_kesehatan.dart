import 'dart:convert';
import 'dart:developer';

import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/custom_input_without_outline_border.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StatusTransaksiBpjsKesehatanScreen extends StatefulWidget {
  final String nama;
  final String id_pengguna;
  final String harga;
  final String priode;
  final String jumlahPeserta;
  final String namaCabang;
  final String total;
  final String bayar;
  final String admin;
  final String ref_id;
  const StatusTransaksiBpjsKesehatanScreen({
    super.key,
    required this.nama,
    required this.id_pengguna,
    required this.harga,
    required this.priode,
    required this.jumlahPeserta,
    required this.namaCabang,
    required this.total,
    required this.bayar,
    required this.admin,
    required this.ref_id,
  });

  @override
  State<StatusTransaksiBpjsKesehatanScreen> createState() =>
      _StatusTransaksiBpjsKesehatanScreenState();
}

late String ref_id;
late String id;
late String nama;
late String jml;
late String bayar;
late String admin;

class _StatusTransaksiBpjsKesehatanScreenState
    extends State<StatusTransaksiBpjsKesehatanScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id_pengguna;
    nama = widget.nama;
    jml = widget.total;
    bayar = widget.harga;
    admin = widget.admin;
  }

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Produk",
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16.0,
                                bottom: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "BPJS Kesehatan",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "ID Pelanggan",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "$id",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Nama Pelanggan",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "$nama",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Pembayaran",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "Rp. ${jml}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(color: Colors.grey, thickness: 1),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "Sumber Dana",
                      inputValue: "Saldo",
                      isBold: true,
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "Jumlah Bayar",
                      inputValue: "Rp. $bayar",
                      isBold: true,
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "Biaya Administrasi",
                      inputValue: "Rp. $admin",
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
