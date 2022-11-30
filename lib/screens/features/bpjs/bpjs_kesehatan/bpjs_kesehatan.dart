import 'dart:convert';
import 'dart:developer';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/bpjs/bpjs_kesehatan/konfirmasi_bpjs_kesehatan.dart';
import 'package:bmt_kbs/screens/features/bpjs/bpjs_kesehatan/tagihan_kesehatan_lunas.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/ip.dart';

class BpjsKesehatanScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  BpjsKesehatanScreen({super.key});

  @override
  State<BpjsKesehatanScreen> createState() => _BpjsKesehatanScreenState();
}

class _BpjsKesehatanScreenState extends State<BpjsKesehatanScreen> {
  String dateState = "Pilih Bulan";
  bool tagihanLunas = true;
  bool isDisabled = true;
  TextEditingController noBpjsC = TextEditingController();
  String? data;
  String? id_pelanggan;
  String? harga;
  String? nama;
  String? priode;
  String? jumlahPeserta;
  String? namaCabang;
  String? total;
  String? bayar;
  String? biayaAdmin;
  String? ref_id;

  cekData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(IpAdress().getIp + '/api/v2/ppob/check-tagihan/pasca');
    var token = prefs.getString('token');
    var response = await http.post(url, headers: {
      "Authorization": "Bearer $token",
      "Accept": 'application/json',
    }, body: {
      "product_code": "BPJS",
      "hp": noBpjsC.text,
      "ppob_category_id": '7'
    });

    log(noBpjsC.text.length.toString());
    var all = jsonDecode(response.body);
    var data = all['message'];
    log(all.toString());

    if (data == 'TIMEOUT') {
      Fluttertoast.showToast(
          msg: 'Waktu habis',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (data == 'TAGIHAN SUDAH LUNAS') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TagihanKesehatanLunasScreen(id: noBpjsC.text),
        ),
      );
    } else if (data == 'INQUIRY SUCCESS') {
      setState(() {
        id_pelanggan = noBpjsC.text;
        harga = all['nominal'].toString();
        nama = all['tr_name'];
        priode = all['period'];
        jumlahPeserta = all['desc']['jumlah_peserta'];
        namaCabang = all['desc']['nama_cabang'];
        bayar = all['nominal'].toString();
        biayaAdmin = all['admin'].toString();
        total = all['price'].toString();
        ref_id = all['ref_id'].toString();
      });
      _tagihanKesehatanTersediaBottomSheet(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "BPJS",
          isHaveActions: false,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: 10.0,
              bottom: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Image.asset(
                          "assets/screens/bpjs/logo_bpjs2.png",
                          scale: 1.6,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text("BPJS Kesehatan"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  runSpacing: 10,
                  children: [
                    const Text(
                      "ID Pelanggan",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    TextField(
                      controller: noBpjsC,
                      onChanged: (value) {
                        if (noBpjsC.text.length == 13) {
                          setState(() {
                            isDisabled = false;
                          });
                        } else {
                          setState(() {
                            isDisabled = true;
                          });
                        }
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: ColorPallete.lightBlueColor,
                        hintText: "Masukkan No. BPJS",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Bayar Hingga",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero, // Set this
                        padding: EdgeInsets.zero, // and this
                      ),
                      onPressed: () {
                        DatePicker.showPicker(
                          context,
                          pickerModel: CustomMonthPicker(
                              minTime: DateTime(2020, 1, 1),
                              maxTime: DateTime.now(),
                              currentTime: DateTime.now()),
                          showTitleActions: true,
                          onChanged: (date) {
                            print('change $date');
                          },
                          onConfirm: (date) {
                            setState(() {
                              dateState = date.toString().substring(0, 7);
                              print("dateState: $dateState");
                            });
                          },
                          locale: LocaleType.id,
                        );
                      },
                      child: Text(
                        dateState,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isDisabled
                    ? null
                    : () {
                        cekData();
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPallete.primaryColor,
                ),
                child: const Text(
                  "Cek Tagihan",
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

  Future<dynamic> _tagihanKesehatanTersediaBottomSheet(BuildContext context) {
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
          heightFactor: 0.78,
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
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "ID Pelanggan",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "$id_pelanggan",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Nama Produk",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "BPJS Kesehatan",
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Harga",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Rp. ${harga.toString()}",
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Nama",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "$nama",
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Periode",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "$priode Bulan",
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Jumlah Peserta",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "$jumlahPeserta",
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Nama Cabang",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "$namaCabang",
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
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
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider()),
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
                                "Premi",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rp. $bayar",
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
                                "Biaya Administrasi",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rp. $biayaAdmin",
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
                          Text(
                            "Total",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            'Rp. $total',
                            style: TextStyle(
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
                                        KonfirmasiBpjsKesehatanScreen(
                                          nama: nama.toString(),
                                          id_pengguna: id_pelanggan.toString(),
                                          priode: priode.toString(),
                                          admin: biayaAdmin.toString(),
                                          bayar: bayar.toString(),
                                          harga: bayar.toString(),
                                          jumlahPeserta:
                                              jumlahPeserta.toString(),
                                          namaCabang: namaCabang.toString(),
                                          total: total.toString(),
                                          ref_id: ref_id.toString(),
                                          noBpjs: noBpjsC.toString(),
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

class CustomMonthPicker extends DatePickerModel {
  CustomMonthPicker(
      {DateTime? currentTime,
      DateTime? minTime,
      DateTime? maxTime,
      LocaleType? locale})
      : super(
            locale: locale,
            minTime: minTime,
            maxTime: maxTime,
            currentTime: currentTime);

  @override
  List<int> layoutProportions() {
    return [1, 1, 0];
  }
}
