import 'dart:convert';
import 'dart:developer';

import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/pdam/detail_tagihan_pdam.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPdamScreen extends StatefulWidget {
  const MenuPdamScreen({super.key});

  @override
  State<MenuPdamScreen> createState() => _MenuPdamScreenState();
}

class _MenuPdamScreenState extends State<MenuPdamScreen> {
  List listDataPdam = [];
  List<String> listWilayah = [];
  String selectedWilayah = "Pilih Wilayah >";
  String codeWilayah = '';
  final TextEditingController _noPDAMController = TextEditingController();
  bool loading = true;

  getPdamList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var response = await http
          .post(Uri.parse(IpAdress().getIp + '/api/ppob/pdam-list'), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      }, body: {
        "ppob_category_id": "6",
      });

      var data = jsonDecode(response.body)['data'];

      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        print(data);

        setState(() {
          loading = false;
          listDataPdam = data;
          listWilayah =
              listDataPdam.map((e) => e['name']).toList().cast<String>();
        });
      } else {
        print(response.statusCode);
        log(data.toString());
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Terjadi kesalahan, silahkan coba lagi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  cekTagihanPDAM() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var response = await http.post(
        Uri.parse(IpAdress().getIp + '/api/v2/ppob/check-tagihan/pasca'),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {
          "ppob_category_id": "6",
          "hp": _noPDAMController.text,
          "product_code": codeWilayah,
        },
      );

      log(codeWilayah);

      var data = jsonDecode(response.body);

      switch (response.statusCode) {
        case 200:
          log(data.toString());

          setState(() {
            loading = false;
          });
          Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          ).then(
            (value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailTagihanPdamScreen(
                  dataTagihanPDAM: data,
                  nomorMeterPelanggan: _noPDAMController.text,
                ),
              ),
            ),
          );
          break;
        case 400:
          setState(() {
            loading = false;
          });
          Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          break;
        default:
          setState(() {
            loading = false;
          });
          Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Terjadi Kesalahan",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  loadingBar() => const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPdamList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: loading == false
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomAppBar(
                title: "PDAM",
                isHaveActions: false,
              ),
            )
          : null,
      body: loading == true
          ? loadingBar()
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    runSpacing: 20,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "No. Pelanggan",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _noPDAMController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorPallete.lightBlueColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Masukkan No. Pelanggan",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Wilayah",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              print("Pop-up Modal Wilayah");
                              pilihWilayahPdamBottomSheet(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: Text(
                                      selectedWilayah,
                                      textAlign: TextAlign.end,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedWilayah != 'Pilih Wilayah >' &&
                              _noPDAMController.text.length >= 8
                          ? () {
                              setState(() {
                                loading = true;
                                loadingBar();
                              });

                              cekTagihanPDAM();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.primaryColor,
                      ),
                      child: const Text(
                        "Cek Tagihan",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Future<dynamic> pilihWilayahPdamBottomSheet(BuildContext context,
      {String? selectedProvider}) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.95,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Pilih Wilayah Anda",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
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
                Expanded(
                  child: Scrollbar(
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listDataPdam.length,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 40,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print(
                                "Daerah Anda adalah: ${listDataPdam[index]['name']}");

                            setState(() {
                              // selectedWilayah = listDataPdam[index]['name'];
                              // codeWilayah = listDataPdam[index]['code'];
                            });

                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: listDataPdam[index]['name'],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
