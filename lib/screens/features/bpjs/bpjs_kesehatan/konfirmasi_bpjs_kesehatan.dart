import 'dart:convert';
import 'dart:developer';

import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/bpjs/bpjs_kesehatan/status_transaksi_bpjs_kesehatan.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class KonfirmasiBpjsKesehatanScreen extends StatefulWidget {
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
  final String noBpjs;
  KonfirmasiBpjsKesehatanScreen({
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
    required this.noBpjs,
  });

  @override
  State<KonfirmasiBpjsKesehatanScreen> createState() =>
      _KonfirmasiBpjsKesehatanScreenState();
}

class _KonfirmasiBpjsKesehatanScreenState
    extends State<KonfirmasiBpjsKesehatanScreen> {
  late String id_pengguna;
  late String harga;
  late String admin;
  late String total;
  late String jumlahPeserta;
  late String nama;
  late String namaCabang;
  late String Priode;
  late String ref_id;
  late String noBpjs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id_pengguna = widget.id_pengguna;
    harga = widget.harga;
    admin = widget.admin;
    total = widget.total;
    jumlahPeserta = widget.jumlahPeserta;
    nama = widget.nama;
    namaCabang = widget.namaCabang;
    Priode = widget.priode;
    ref_id = widget.ref_id;
  }

  cekout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(IpAdress().getIp + '/api/v2/ppob/checkout/pasca');
    var token = prefs.getString('token');
    var response = await http.post(url, headers: {
      "Authorization": "Bearer $token",
      "Accept": 'application/json',
    }, body: {
      "ref_id": ref_id,
      "hp": '8801234560008',
      "ppob_category_id": '7'
    });
    var all = jsonDecode(response.body);
    var data = all['message'];
    log(all.toString());
    if (response.statusCode == 200) {
      if (all['message'] == 'Saldo Kurang') {
        Fluttertoast.showToast(
            msg: 'Maaf Saldo Anda Tidak Mencukupi!!!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StatusTransaksiBpjsKesehatanScreen(
                admin: admin,
                bayar: harga,
                harga: harga,
                id_pengguna: id_pengguna,
                jumlahPeserta: jumlahPeserta,
                nama: nama,
                namaCabang: namaCabang,
                priode: Priode,
                total: total,
                ref_id: ref_id),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            padding: const EdgeInsets.all(5.0),
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
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "ID Pelanggan",
                                              style: TextStyle(
                                                color: Colors.grey[600]!,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              "$id_pengguna",
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
                                                "Rp. $harga",
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
                                                "Rp. $admin",
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
                                                "Total",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Rp. $total",
                                                style: TextStyle(
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
                        Text(
                          "Total Bayar",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "Rp $total",
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
                          // ignore: avoid_print
                          print("Berpindah ke status voucher permainan");
                          cekout();
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
