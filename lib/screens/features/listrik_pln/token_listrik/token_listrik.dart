import 'dart:convert';
import 'dart:developer';

import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/listrik_pln/token_listrik/pilih_nominal_listrik.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TokenListrikScreen extends StatefulWidget {
  const TokenListrikScreen({super.key});

  @override
  State<TokenListrikScreen> createState() => _TokenListrikScreenState();
}

class _TokenListrikScreenState extends State<TokenListrikScreen> {
  TextEditingController plnIDController = TextEditingController();
  bool isDisabled = true;
  bool loading = false;

  checkPlnID() async {
    setState(() {
      loading = true;
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var response = await http.post(
        Uri.parse(IpAdress().getIp + '/api/ppob/check-pln-id/pra'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: {
          'hp': plnIDController.text,
        },
      );

      var res = jsonDecode(response.body);

      if (mounted) {
        if (response.statusCode == 200 && res['status'] == "1") {
          // ignore: avoid_print
          print(res);
          log(response.statusCode.toString());

          setState(() {
            loading = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PilihNominalListrikScreen(
                  namaPelanggan: res['name'],
                  noMeter: res['meter_no'],
                  segmentPower: res['segment_power'],
                );
              },
            ),
          );
        } else {
          print(res);
          print(response.statusCode);

          setState(() {
            loading = false;
          });

          Fluttertoast.showToast(
            msg: res['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      }
    } catch (e) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "PLN",
          isHaveActions: false,
        ),
      ),
      body: loading == true
          ? const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: ColorPallete.primaryColor,
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Token Listrik",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: plnIDController,
                            onChanged: (value) {
                              if (value.length > 0) {
                                setState(() {
                                  isDisabled = false;
                                });
                              } else {
                                setState(() {
                                  isDisabled = true;
                                });
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: ColorPallete.lightBlueColor,
                              hintText: 'Contoh 536612381527',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Silakan ketik ID Pelanggan atau Nomer Meter",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 30.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isDisabled ? null : () => checkPlnID(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.primaryColor,
                      ),
                      child: const Text(
                        "Lanjutkan",
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
    );
  }
}
