import 'dart:convert';
import 'dart:developer';
import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/custom_format.dart';
import 'package:bmt_kbs/screens/features/lain-lain/lain_lain.dart';
import 'package:bmt_kbs/screens/features/pulsa/prabayar/pulsa_prabayar.dart';
import 'package:bmt_kbs/screens/features/scan/scanner.dart';
import 'package:flutter/material.dart';
import 'package:bmt_kbs/screens/features/bpjs/menu_bpjs.dart';
import 'package:bmt_kbs/screens/features/internet_dan_tv/menu_internet_dan_tv.dart';
import 'package:bmt_kbs/screens/features/isi_saldo/isi_saldo.dart';
import 'package:bmt_kbs/screens/features/pdam/menu_pdam.dart';
import 'package:bmt_kbs/screens/features/penarikan_dana/penarikan_dana.dart';
import 'package:bmt_kbs/screens/features/listrik_pln/menu_pln.dart';
import 'package:bmt_kbs/screens/features/telkom/menu_telkom.dart';
import 'package:bmt_kbs/screens/features/transfer/transfer.dart';
import 'package:bmt_kbs/screens/features/voucher_permainan/menu_voucher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? authNama, authPoto, authPoint;
  String? authSaldo;
  bool loading = false;

  // ignore: prefer_typing_uninitialized_variables
  var ctime;

  void userProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var saldo = prefs.getString('saldo');
    var val = double.parse(saldo!);
    var formatedSaldo = CustomFormat.ubahFormatRupiah(val, 0);

    setState(() {
      authSaldo = formatedSaldo;
    });
  }

  getPoint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Uri url = Uri.parse(IpAdress().getIp + '/api/point');
    var response = await http.post(
      url,
      headers: {"Accept": 'application/json', "Authorization": "Bearer $token"},
    );

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      log(response.statusCode.toString());

      setState(() {
        loading = false;
        authPoint = data['point'].toString();
      });
    } else {
      // ignore: avoid_print
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    userProfile();
    getPoint();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // exit app when user is double tap back button, then show flutter toast
        DateTime now = DateTime.now();
        if (ctime == null ||
            now.difference(ctime) > const Duration(seconds: 2)) {
          //add duration of press gap
          ctime = now;

          //scaffold message, you can show Toast message too.
          Fluttertoast.showToast(
            msg: "Tekan sekali lagi untuk keluar",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          return Future.value(false);
        }

        return Future.value(true);
      },
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          loading == true
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.white,
                  ),
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/icons/card_icons/card_mask.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // -- SISA SALDO SECTION --
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Sisa Saldo",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  Text(
                                    "$authSaldo",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              // -- POIN SECTION --
                              Column(
                                children: [
                                  Container(
                                    width: 130,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/icons/card_icons/points.png',
                                            width: 28,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "$authPoint poin",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Icon(
                                                Icons.keyboard_arrow_right,
                                                size: 16,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            // ignore: avoid_print
                                            print("TOP UP Screen");
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const IsiSaldoScreen(),
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            'assets/icons/card_icons/first.png',
                                            scale: 2.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow[600],
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            // ignore: avoid_print
                                            print("TRANSFER Screen");
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const TransferScreen(),
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            'assets/icons/card_icons/second.png',
                                            scale: 2.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const PenarikanDanaScreen(),
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            'assets/icons/card_icons/third.png',
                                            scale: 2.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            // ignore: avoid_print
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ScannerScreen(),
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            'assets/icons/card_icons/fourth.png',
                                            scale: 2.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          const SizedBox(
            height: 15,
          ),
          loading == true
              ? Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              : Container(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print("Beralih ke pulsa & data");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PulsaPrabayarScreen(),
                                ),
                              );
                            },
                            child: MenuItem(
                              iconPath: "pulsa.png",
                              title: "Pulsa dan Paket Data",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MenuPlnScreen(),
                                ),
                              );
                            },
                            child: MenuItem(
                              iconPath: "pln.png",
                              title: "Tagihan Listrik PLN",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print("Anda beralih ke Voucher Game Screen");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MenuVoucherScreen(),
                                ),
                              );
                            },
                            child: MenuItem(
                              iconPath: "vouchergame.png",
                              title: "Voucher Permainan",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print("Anda beralih ke BPJS Screen");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MenuBpjsScreen(),
                                ),
                              );
                            },
                            child: MenuItem(
                              iconPath: "bpjs.png",
                              title: "BPJS Kesehatan",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print("Beralih ke PDAM Screen");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MenuPdamScreen(),
                                ),
                              );
                            },
                            child: MenuItem(
                              iconPath: "pdam.png",
                              title: "PDAM",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print("Beralih ke Internet & TV Kabel Screen");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MenuInternetDanTvScreen(),
                                ),
                              );
                            },
                            child: MenuItem(
                              iconPath: "internet.png",
                              title: "Internet dan TV Kabel",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MenuTelkomScreen(),
                                ),
                              );
                            },
                            child: MenuItem(
                              iconPath: "telkom.png",
                              title: "Tagihan Telkom",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LainLainScreen(),
                                ),
                              );
                            },
                            child: MenuItem(
                              iconPath: "lainnya.png",
                              title: "Lain-lain",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 30,
          ),
          loading == true
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Text(
                    "Loading.....",
                    style: TextStyle(
                        color: Colors.grey[900]!,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : const Text(
                  "Artikel Terbaru",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
          const SizedBox(
            height: 10,
          ),
          loading == true
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 16,
                            mainAxisExtent: 200),
                    itemBuilder: (context, index) => Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                )
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 200),
                  itemBuilder: (context, index) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  MenuItem({
    required this.title,
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  String title;
  String iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Image.asset(
            'assets/icons/menu_icons/$iconPath',
            scale: 1.8,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 80,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
