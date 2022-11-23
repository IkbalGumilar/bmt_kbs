import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../../../etc/custom_format.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KonfirmasiPulsaPrabayarScreen extends StatefulWidget {
  String nomor;
  String category_id;
  String sub_category_id;
  int harga;
  String deskripsi;
  String produk;
  int admin;

  KonfirmasiPulsaPrabayarScreen({
    super.key,
    required this.nomor,
    required this.category_id,
    required this.sub_category_id,
    required this.harga,
    required this.deskripsi,
    required this.produk,
    required this.admin,
  });

  @override
  State<KonfirmasiPulsaPrabayarScreen> createState() =>
      _KonfirmasiPulsaPrabayarScreenState();
}

class _KonfirmasiPulsaPrabayarScreenState
    extends State<KonfirmasiPulsaPrabayarScreen> {
  late String noPengguna;
  late String kategori;
  late String subKategori;
  late String produk;
  late num harga;
  late String deskripsi;
  late num admin;
  String? categityId;
  String? subCategoryId;
  num? authSaldo;
  var realSaldo;
  var poin;

  konfirmasi() async {
    try {
      var authSaldo;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Uri url = Uri.parse(IpAdress().getIp + '/api/v2/ppob/checkout/pra');
      var token = prefs.getString('token');
      var response = await http.post(url, headers: {
        "Authorization": "Bearer $token",
        "Accept": 'application/json',
      }, body: {
        "nomor": noPengguna,
        "category_id": categityId,
        "sub_category_id": subCategoryId,
        "product_code": produk,
        "type": "pulsa"
      });
      log(noPengguna);
      log(categityId.toString());
      log(subCategoryId.toString());
      log(produk);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Terjadi keberhasilan',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: const Color.fromARGB(255, 60, 255, 0),
            fontSize: 16.0);
      }
    } catch (e) {
      print(e.toString());
      // make a flutterToast that have an error message
      Fluttertoast.showToast(
          msg: 'Terjadi kesalahan, harap coba lagi!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void userProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var saldo = prefs.getString('saldo');
    var poin = prefs.getInt('point');
    var val = double.parse(saldo!);
    var formatedSaldo = CustomFormat.ubahFormatRupiah(val, 0);

    setState(() {
      realSaldo = formatedSaldo;
      authSaldo = val;
      poin = poin;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProfile();
    noPengguna = widget.nomor;
    kategori = widget.category_id;
    subKategori = widget.sub_category_id;
    harga = widget.harga;
    deskripsi = widget.deskripsi;
    produk = widget.produk;
    admin = widget.admin;
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
                                      children: [
                                        const Text(
                                          "Sisa Saldo",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          '$realSaldo',
                                          style: const TextStyle(
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
                                                  children: [
                                                    Text(
                                                      "$poin",
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const Icon(
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
                    ],
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
                                  Text(
                                    produk,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      deskripsi,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "$harga",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ]),
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
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              authSaldo! > harga + admin
                                  ? ""
                                  : "*Saldo anda tidak cukup untuk transaksi ini ",
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                          "Rp ${harga + admin}",
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
                          konfirmasi();
                          // ignore: avoid_print
                          print("Berpindah ke status transaksi pulsa");
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         const StatusTransaksiPulsaPrabayarScreen(),
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
