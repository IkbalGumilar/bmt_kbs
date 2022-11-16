import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/pulsa/prabayar/status_transaksi_pulsa_prabayar.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class KonfirmasiPulsaPrabayarScreen extends StatefulWidget {
  const KonfirmasiPulsaPrabayarScreen({super.key});

  @override
  State<KonfirmasiPulsaPrabayarScreen> createState() =>
      _KonfirmasiPulsaPrabayarScreenState();
}

class _KonfirmasiPulsaPrabayarScreenState
    extends State<KonfirmasiPulsaPrabayarScreen> {
  int? nomer;

  String? categityId;

  String? subCategoryId;

  konfirmasi() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Uri url = Uri.parse(IpAdress().getIp + '/api/ppob/check_nomor');
      var token = prefs.getString('token');
      var response = await http.post(url, headers: {
        "Authorization": "Bearer $token",
        "Accept": 'application/json',
      }, body: {
        "nomor": '',
        "category_id": '',
        "sub_category_id": '',
        "type": "pulsa"
      });

      log(response.statusCode.toString());

      if (response.statusCode == 200) {}
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
                                    "$deskripsi",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(
                                      "Paket bicara semua operator 1 hari, 280 mins Onnet + 5 mins AllOpr, 1 hari",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "$harga",
                                    style: TextStyle(
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
                            const Text(
                              "*Saldo anda tidak cukup untuk transaksi ini ",
                              style: TextStyle(
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
                        Text(
                          "Total Bayar",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "Rp ${harga + admin}",
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
                          print("Berpindah ke status transaksi pulsa");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const StatusTransaksiPulsaPrabayarScreen(),
                            ),
                          );
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
