// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:bmt_kbs/config/ip.dart';
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/etc/custom_format.dart';
import 'package:bmt_kbs/screens/features/bpjs/bpjs_ketenagakerjaan/konfirmasi_bpjs_ketenagakerjaan.dart';
import 'package:bmt_kbs/screens/features/bpjs/bpjs_ketenagakerjaan/tagihan_ketenagakerjaan_lunas.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BpjsKetenagakerjaanScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  const BpjsKetenagakerjaanScreen({super.key});

  @override
  State<BpjsKetenagakerjaanScreen> createState() =>
      _BpjsKetenagakerjaanScreenState();
}

class _BpjsKetenagakerjaanScreenState extends State<BpjsKetenagakerjaanScreen> {
  TextEditingController bpjsKetenagakerjaanController = TextEditingController();
  String dateState = "Pilih Periode";
  bool isDisabled = true;
  Map<String, dynamic>? dataDetailKetenagakerjaan;

  _checkTagihanBpjsKetenagakerjaan() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var response = await http.post(
        Uri.parse(
          IpAdress().getIp + '/api/v2/ppob/check-tagihan/pasca',
        ),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: {
          "product_code": "BPJSTK",
          "hp": bpjsKetenagakerjaanController.text,
          "ppob_category_id": "7",
        },
      );

      var data = jsonDecode(response.body);

      if (mounted) {
        if (response.statusCode == 200) {
          setState(() {
            dataDetailKetenagakerjaan = data;
          });

          print(data);
          _tagihanKetenagakerjaanBottomSheet(context);
        } else if (response.statusCode == 400) {
          print(data);
          print(response.statusCode);

          Fluttertoast.showToast(
            msg: data['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else {
          print(data);
          print(response.statusCode);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TagihanKetenagakerjaanLunasScreen(),
            ),
          );
        }
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Terjadi Kesalahan, Silahkan Coba Lagi!",
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
    log(dataDetailKetenagakerjaan.toString());

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
                      const Text("BPJS Ketenagakerjaan"),
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
                      "NIK Pelanggan",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: bpjsKetenagakerjaanController,
                      onChanged: (value) {
                        if (value.length == 16) {
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
                        hintText: "Masukkan NIK",
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
                      "Periode Pembayaran",
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
                onPressed: isDisabled == true
                    ? null
                    : () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        _checkTagihanBpjsKetenagakerjaan();
                      },
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
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _tagihanKetenagakerjaanBottomSheet(BuildContext context) {
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
          heightFactor: 0.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.75,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "NIK Pelanggan",
                                              overflow: TextOverflow.visible,
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              "${dataDetailKetenagakerjaan!['hp']}",
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
                                              "BPJS Ketenagakerjaan",
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
                                              CustomFormat.ubahFormatRupiah(
                                                  dataDetailKetenagakerjaan![
                                                      'nominal'],
                                                  0),
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
                                              "${dataDetailKetenagakerjaan!['tr_name']}",
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
                                              "${dataDetailKetenagakerjaan!['period']} Bulan",
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
                                              "4",
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
                                              "${dataDetailKetenagakerjaan!['desc']['kantor_cabang']}",
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
                          child: Divider(),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Premi",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        CustomFormat.ubahFormatRupiah(
                                            dataDetailKetenagakerjaan![
                                                'nominal'],
                                            0),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Biaya Administrasi",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        CustomFormat.ubahFormatRupiah(
                                            dataDetailKetenagakerjaan!['admin'],
                                            0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Text(
                                    CustomFormat.ubahFormatRupiah(
                                        dataDetailKetenagakerjaan!['price'], 0),
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
                      ],
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
                                          KonfirmasiBpjsKetenagakerjaanScreen(
                                        nikPelanggan:
                                            bpjsKetenagakerjaanController.text,
                                        refID: dataDetailKetenagakerjaan![
                                            'ref_id'],
                                        biayaAdmin:
                                            dataDetailKetenagakerjaan!['admin'],
                                        nominalBiaya:
                                            dataDetailKetenagakerjaan![
                                                'nominal'],
                                        total:
                                            dataDetailKetenagakerjaan!['price'],
                                      ),
                                    ),
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
