import 'dart:convert';
import 'dart:developer';

import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/etc/custom_format.dart';
import 'package:bmt_kbs/models/isi_saldo_model.dart';
import 'package:bmt_kbs/screens/features/isi_saldo/konfirmasi.dart';
import 'package:bmt_kbs/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class IsiSaldoScreen extends StatefulWidget {
  const IsiSaldoScreen({super.key});

  @override
  State<IsiSaldoScreen> createState() => _IsiSaldoScreenState();
}

class _IsiSaldoScreenState extends State<IsiSaldoScreen> {
  String? authSaldo, authPoint;
  TextEditingController saldoC = TextEditingController();
  Map<String, dynamic> dataIsiSaldo = {};
  String? jmlTopUpSaldo;
  bool loading = true;

  getSaldoDanPoint() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    var saldo = _prefs.getString('saldo');
    var val = double.parse(saldo!);
    var formatedSaldo = CustomFormat.ubahFormatRupiah(val, 0);

    Uri url = Uri.parse(IpAdress().getIp + '/api/point');
    var response = await http.post(url, headers: {
      "Accept": 'application/json',
      "Authorization": "Bearer $token"
    });

    var data = jsonDecode(response.body);
    var point = data['point'].toString();
    var parsedVal = double.parse(point);
    var formatedPoint = CustomFormat.ubahFormatPoint(parsedVal, 0);

    log('LOADING SAAT KONFIRMASI Get Saldo dan Point GIMANA NICHHH: $loading');
    log(formatedPoint);

    if (mounted) {
      if (response.statusCode == 200) {
        setState(() {
          authSaldo = formatedSaldo;
          authPoint = formatedPoint;
          loading = !loading;
        });
      } else {
        Fluttertoast.showToast(
          msg: 'Gagal Mengambil Data',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
    print(authSaldo);
  }

  konfirmasi(jumlah) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Uri url = Uri.parse(IpAdress().getIp + '/api/isi-saldo');
    var response = await http.post(url, headers: {
      "Accept": 'application/json',
      "Authorization": "Bearer $token"
    }, body: {
      "amount": jumlah,
      "account_id": "b0522a2b-3652-445d-8fa2-68d0fb464a93"
    });

    var data = jsonDecode(response.body)['data'];

    setState(() {
      dataIsiSaldo = data;
      loading = !loading;
    });

    log('LOADING SAAT KONFIRMASI GIMANA NICHHH: $loading');
    log('JUMLAH TOP UP YANG DIPASSING:::::: $jmlTopUpSaldo');

    if (mounted) {
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(data.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                KonfirmasiIsiSaldoScreen(jmlTopup: jumlah, dataTransaksi: data),
          ),
        );
      } else {
        print('Gagal');
      }
    }
  }

  loadingCircularContainer() {
    return const Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(
          color: ColorPallete.primaryColor,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getSaldoDanPoint();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarHeight: 60,
          title: const Text(
            "Isi Saldo",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
      body: loading == true
          ? loadingCircularContainer()
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
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
                                'assets/screens/isi_saldo/card_mask.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                  padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                  child: Divider(
                    color: Colors.grey[500],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: isiSaldoList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                jmlTopUpSaldo =
                                    isiSaldoList[index].nominal.toString();

                                loading = !loading;
                                konfirmasi(jmlTopUpSaldo);
                              });
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.photo,
                                    color: Colors.grey[600],
                                  ),
                                  Text(
                                    CustomFormat.ubahFormatRupiah(
                                        isiSaldoList[index].nominal, 0),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Input jumlah topup lainnya:",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: saldoC,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: ColorPallete.primaryColor,
                                ),
                              ),
                              hintText: "Rp. xxxxx",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            autocorrect: false,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Column(
                              children: [
                                FullWidthButton(
                                  text: "Selanjutnya",
                                  navigateTo: KonfirmasiIsiSaldoScreen(
                                    jmlTopup: '20.000',
                                    dataTransaksi: dataIsiSaldo,
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
              ],
            ),
      backgroundColor: Colors.white,
    );
  }
}
