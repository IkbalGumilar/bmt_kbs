// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/etc/custom_format.dart';

import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class KonfirmasiTagihanPdamScreen extends StatefulWidget {
  KonfirmasiTagihanPdamScreen(
      {super.key, required this.dataKonfirmasiTagihanPDAM});

  Map dataKonfirmasiTagihanPDAM;

  @override
  State<KonfirmasiTagihanPdamScreen> createState() =>
      _KonfirmasiTagihanPdamScreenState();
}

class _KonfirmasiTagihanPdamScreenState
    extends State<KonfirmasiTagihanPdamScreen> {
  late Map _dataKonfirmasiTagihanPDAM;
  String? _nomorMeterPelanggan = 'DEFAULT_NOMOR_METER_PELANGGAN';
  String? _periodeTagihan = 'DEFAULT_PERIODE_TAGIHAN';
  int? _nominalTagihan = 0;
  int? _finalTotalTagihan = 0;
  bool loading = false;

  checkoutTagihanPDAM() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var response = await http.post(
        Uri.parse(IpAdress().getIp + '/api/v2/ppob/checkout/pasca'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {
          "ppob_category_id": "6",
          "hp": _nomorMeterPelanggan,
          "ref_id": _dataKonfirmasiTagihanPDAM['ref_id'],
        },
      );

      var data = jsonDecode(response.body)['data'];

      if (response.statusCode == 200) {
        log(data.toString());
      } else {
        log(response.body);
        log(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());

      Fluttertoast.showToast(
        msg: "Terjadi kesalahan, silahkan coba lagi",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Widget loadingBar() {
    return const SizedBox(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _dataKonfirmasiTagihanPDAM = widget.dataKonfirmasiTagihanPDAM;

    _nomorMeterPelanggan = _dataKonfirmasiTagihanPDAM['hp'];
    _periodeTagihan = _dataKonfirmasiTagihanPDAM['period'];
    _nominalTagihan = _dataKonfirmasiTagihanPDAM['nominal'];
    _finalTotalTagihan = _dataKonfirmasiTagihanPDAM['price'];
  }

  @override
  Widget build(BuildContext context) {
    print("INI DATA KONFIRMASI TAGIHAN PDAM:::: $_dataKonfirmasiTagihanPDAM");
    print("INI NOMOR METER PELANGGAN:::: $_nomorMeterPelanggan");
    print("INI PERIODE TAGIHAN:::: $_periodeTagihan");
    print("INI NOMINAL TAGIHAN:::: $_nominalTagihan");
    print("INI FINAL TOTAL TAGIHAN:::: $_finalTotalTagihan");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Konfirmasi Pembayaran",
          isHaveActions: false,
        ),
      ),
      body: loading == true
          ? loadingBar()
          : Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.transparent,
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/icons/screens/pulsa/overlay.png'),
                                        fit: BoxFit.none,
                                        alignment: Alignment(0.60, 0),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                "Sisa Saldo",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                "Rp.823.123",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                width: 120,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/card_icons/points.png',
                                                        width: 28,
                                                      ),
                                                      Wrap(
                                                        children: const [
                                                          Text(
                                                            "9.000 poin",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_right,
                                                            size: 16,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "No. Meter PDAM",
                                                      style: TextStyle(
                                                        color:
                                                            Colors.grey[600]!,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      _nomorMeterPelanggan!,
                                                      style: TextStyle(
                                                        color:
                                                            Colors.grey[600]!,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Periode Tagihan",
                                                      style: TextStyle(
                                                        color:
                                                            Colors.grey[600]!,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      _periodeTagihan!,
                                                      style: TextStyle(
                                                        color:
                                                            Colors.grey[600]!,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Jumlah Tagihan",
                                                      style: TextStyle(
                                                        color:
                                                            Colors.grey[600]!,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    Text(
                                                      CustomFormat
                                                              .ubahFormatRupiah(
                                                                  _nominalTagihan,
                                                                  0)
                                                          .toString(),
                                                      style: TextStyle(
                                                        color:
                                                            Colors.grey[600]!,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Total",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Text(
                                                      CustomFormat.ubahFormatRupiah(
                                                              _finalTotalTagihan,
                                                              0)
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor:
                                              ColorPallete.lightBlueColor,
                                          prefixIcon: Image.asset(
                                            "assets/icons/screens/pulsa/poin.png",
                                            scale: 1.5,
                                          ),
                                          suffixIcon:
                                              const Icon(Icons.chevron_right),
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
                      children: const [
                        Text(
                          "Total Bayar",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "Rp 285.500",
                          style: TextStyle(
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
                          print("Berpindah ke status voucher permainan");

                          checkoutTagihanPDAM();

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         const StatusTransaksiPdamScreen(),
                          //   ),
                          // );
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
