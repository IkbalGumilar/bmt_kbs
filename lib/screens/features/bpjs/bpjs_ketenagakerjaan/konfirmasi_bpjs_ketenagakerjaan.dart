import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/etc/custom_format.dart';
import 'package:bmt_kbs/screens/features/bpjs/bpjs_ketenagakerjaan/status_transaksi_bpjs_ketenagakerjaan.dart';
import 'package:bmt_kbs/widgets/card_saldo_with_point.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class KonfirmasiBpjsKetenagakerjaanScreen extends StatefulWidget {
  KonfirmasiBpjsKetenagakerjaanScreen({
    super.key,
    required this.nikPelanggan,
    required this.nominalBiaya,
    required this.biayaAdmin,
    required this.total,
    required this.refID,
  });

  String nikPelanggan;
  String refID;
  int nominalBiaya;
  int biayaAdmin;
  int total;

  @override
  State<KonfirmasiBpjsKetenagakerjaanScreen> createState() =>
      _KonfirmasiBpjsKetenagakerjaanScreenState();
}

class _KonfirmasiBpjsKetenagakerjaanScreenState
    extends State<KonfirmasiBpjsKetenagakerjaanScreen> {
  late String? _nikPelanggan;
  late String? _refID;
  late int? _nominalBiaya;
  late int? _biayaAdmin;
  late int? _total;

  void checkoutKonfirmasiBpjsKetenagakerjaan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    var response = await http.post(
      Uri.parse(IpAdress().getIp + '/api/v2/ppob/checkout/pasca'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: {
        'ref_id': _refID.toString(),
        'ppob_category_id': '7',
        'hp': _nikPelanggan.toString(),
      },
    );

    var data = jsonDecode(response.body);

    if (mounted) {
      if (response.statusCode == 200) {
        if (data['status'] == 'Failed') {
          Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  StatusTransaksiBpjsKetenagakerjaanScreen(data: data),
            ),
          );
        }
      } else {
        log(response.body);
        log(response.statusCode.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();

    _nikPelanggan = widget.nikPelanggan;
    _refID = widget.refID;
    _nominalBiaya = widget.nominalBiaya;
    _biayaAdmin = widget.biayaAdmin;
    _total = widget.total;
  }

  @override
  Widget build(BuildContext context) {
    log('nikPelanggan: $_nikPelanggan');
    log('Ref ID: $_refID');
    log('nominalBiaya: $_nominalBiaya');
    log('biayaAdmin: $_biayaAdmin');
    log('total: $_total');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Konfirmasi Pembayaran",
          isHaveActions: false,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 10.0,
                        ),
                        child: CardSaldoWithPointWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey[400]!,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "NIK Pelanggan",
                                              style: TextStyle(
                                                color: Colors.grey[600]!,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              "$_nikPelanggan",
                                              style: TextStyle(
                                                color: Colors.grey[600]!,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Harga",
                                                style: TextStyle(
                                                  color: Colors.grey[600]!,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                CustomFormat.ubahFormatRupiah(
                                                    _nominalBiaya, 0),
                                                style: TextStyle(
                                                  color: Colors.grey[600]!,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Biaya Administrasi",
                                                style: TextStyle(
                                                  color: Colors.grey[600]!,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                CustomFormat.ubahFormatRupiah(
                                                    _biayaAdmin, 0),
                                                style: TextStyle(
                                                  color: Colors.grey[600]!,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Total",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                CustomFormat.ubahFormatRupiah(
                                                    _total, 0),
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Sumber Dana",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: ColorPallete.lightBlueColor,
                                    prefixIcon: Image.asset(
                                      "assets/icons/screens/pulsa/poin.png",
                                      scale: 1.5,
                                    ),
                                    suffixIcon: const Icon(Icons.chevron_right),
                                    hintText: "Pilih Sumber Dana",
                                    hintStyle: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomAppBar(
          elevation: 0.0,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Total Bayar",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          CustomFormat.ubahFormatRupiah(_total, 0),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          checkoutKonfirmasiBpjsKetenagakerjaan();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.primaryColor,
                        ),
                        child: const Text(
                          "Bayar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
