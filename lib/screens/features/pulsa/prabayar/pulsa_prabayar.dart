import 'dart:convert';
import 'dart:developer';

import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/models/paket_data_model.dart';
import 'package:bmt_kbs/models/pulsa_model.dart';
import 'package:bmt_kbs/screens/features/pulsa/prabayar/konfirmasi_pulsa_prabayar.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PulsaPrabayarScreen extends StatefulWidget {
  const PulsaPrabayarScreen({super.key});

  @override
  State<PulsaPrabayarScreen> createState() => _PulsaPrabayarScreenState();
}

class _PulsaPrabayarScreenState extends State<PulsaPrabayarScreen>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();

  final List<Widget> myTabs = [
    const Tab(text: 'Pulsa'),
    const Tab(text: 'Paket Data'),
  ];

  late TabController _tabController;
  late ScrollController _scrollController;
  late bool fixedScroll = false;
  late int selectedIndex = 1;
  var nilai;
  var nomor;
  TextEditingController numberC = TextEditingController();
  var authTotal;
  var authData;
  var deskripsi;
  var hargaData;
  var product;
  var category_id;
  var sub_category_id;
  var admin;

  var paketData;
  String _radioValue = "";
  cekData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Uri url = Uri.parse(IpAdress().getIp + '/api/ppob/check_nomor');
      var token = prefs.getString('token');
      var response = await http.post(url, headers: {
        "Authorization": "Bearer $token",
        "Accept": 'application/json',
      }, body: {
        "nomor": numberC.text,
        "type": "data"
      });
      log(numberC.text.toString());
      List data = jsonDecode(response.body)['data']['data'];
      var status = jsonDecode(response.body)['status'];

      log(status);
      //log(data.toString());

      if (response.statusCode == 200) {
        setState(() {
          authData = data;
        });
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
            msg: 'Nomer Yang Anda Masukan Salah!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e.toString());
      // Fluttertoast.showToast(
      //     msg: 'Terjadi kesalahan, harap coba lagi!',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  cekNomer() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Uri url = Uri.parse(IpAdress().getIp + '/api/ppob/check_nomor');
      var token = prefs.getString('token');
      var response = await http.post(url, headers: {
        "Authorization": "Bearer $token",
        "Accept": 'application/json',
      }, body: {
        "nomor": numberC.text,
        "type": "pulsa"
      });
      var total = jsonDecode(response.body)['data']['data'];
      log(total.toString());
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        setState(() {
          authTotal = total;
        });
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
            msg: 'Nomer Yang Anda Masukan Salah!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e.toString());
      // Fluttertoast.showToast(
      //     msg: 'Terjadi kesalahan, harap coba lagi!',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  _pulsaTabContext() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: authTotal!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 20.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (numberC.text == "Nomor Ponsel" || numberC.text == '') {
              Fluttertoast.showToast(
                  msg: 'Nomer masih kosong!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else if (numberC.text.length < 12) {
              Fluttertoast.showToast(
                  msg: 'Nomer yang anda masukan salah!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              customBottomSheet(context);
            }
            // ignore: avoid_print
            print('Pulsa ${authTotal[index]['product_code']} selected');

            setState(() {
              selectedIndex = index;
              nilai = (authTotal[index]['price']);
              category_id = (authTotal[index]['category_id']);
              sub_category_id = (authTotal[index]['sub_category_id']);
              nomor = numberC.text;
              deskripsi = (authTotal[index]['description']);
              product = (authTotal[index]['product_code']);
              admin = (authTotal[index]['admin_bank']);
            });
            log(nomor);
            log(category_id);
            log(sub_category_id);
            log(nilai.toString());
            log(deskripsi);
            log(product);
            log(admin.toString());
          },
          child: Container(
            width: 100,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: selectedIndex == index
                      ? ColorPallete.primaryColor
                      : Colors.grey,
                  width: selectedIndex == index ? 1.5 : 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            '${authTotal[index]['product_code']}'.substring(6),
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          Text(
                            "Harga",
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12),
                          ),
                          Text(
                            "Rp. ${authTotal[index]['price']}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[900],
                              fontSize: 12,
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
        );
      },
    );
  }

  _paketDataTabContext() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: authData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authData[index]['product_name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    authData[index]['description'],
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Rp. ${authData[index]['price']}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Pulsa dan Data",
          isHaveActions: false,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Radio(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: "nomor_ponsel",
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          groupValue: _radioValue,
                          onChanged: (index) {
                            setState(() {
                              _radioValue = index!;
                            });

                            print(_radioValue);
                          },
                        ),
                        const Text("Nomor Ponsel"),
                      ],
                    ),
                    Wrap(
                      spacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Radio(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: "nomor_pascabayar",
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          groupValue: _radioValue,
                          onChanged: (index) {
                            setState(() {
                              _radioValue = index!;
                            });

                            print(_radioValue);
                          },
                        ),
                        const Text("No. Pascabayar"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: numberC,
                  onChanged: (content) {
                    cekNomer();
                    cekData();
                  },
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: ColorPallete.lightBlueColor,
                    filled: true,
                    hintText: "Masukkan No. Ponsel",
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                    suffixIcon: Image.asset(
                      "assets/icons/screens/pulsa/no_ponsel.png",
                      scale: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          _radioValue == 'nomor_ponsel'
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 30.0),
                    child: NestedScrollView(
                      controller: _scrollController,
                      headerSliverBuilder: (context, value) {
                        return [
                          SliverToBoxAdapter(
                            child: TabBar(
                              controller: _tabController,
                              labelColor: Colors.black,
                              indicatorColor: ColorPallete.primaryColor,
                              isScrollable: true,
                              tabs: myTabs,
                            ),
                          ),
                        ];
                      },
                      body: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            numberC.text.length <= 4
                                ? SizedBox()
                                : authTotal != null
                                    ? _pulsaTabContext()
                                    : SizedBox(),
                            numberC.text.length <= 4
                                ? SizedBox()
                                : authTotal != null
                                    ? _paketDataTabContext()
                                    : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Future<dynamic> customBottomSheet(BuildContext context) {
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
          heightFactor: 0.5,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: ListView(
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
                  height: 30,
                ),
                Column(
                  children: [
                    Wrap(
                      children: [
                        const Text(
                          "Informasi Pelanggan",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nomor Ponsel",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                numberC.text,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey[400], thickness: 1),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Detil Pembayaran",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bicara semua operator 1 hari",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                nilai.toString(),
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Biaya transaksi",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rp. -0",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: DottedBorder(
                    color: Colors.grey[400]!,
                    dashPattern: const [6, 3, 6, 3],
                    child: const SizedBox(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            '$nilai',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD9F0DB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 0.0,
                            ),
                            child: const Text(
                              "Ubah",
                              style: TextStyle(
                                color: ColorPallete.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        KonfirmasiPulsaPrabayarScreen(
                                          nomor: nomor,
                                          category_id: category_id,
                                          sub_category_id: sub_category_id,
                                          harga: nilai,
                                          produk: product,
                                          deskripsi: deskripsi,
                                          admin: admin,
                                        )),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPallete.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 0.0,
                            ),
                            child: const Text(
                              "Konfirmasi",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
