import 'dart:developer';

import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/etc/custom_format.dart';
import 'package:bmt_kbs/screens/features/isi_saldo/status_transaksi_isi_saldo.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/custom_input_without_outline_border.dart';
import 'package:bmt_kbs/widgets/full_width_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class KonfirmasiIsiSaldoScreen extends StatefulWidget {
  KonfirmasiIsiSaldoScreen(
      {Key? key, required this.jmlTopup, required this.dataTransaksi})
      : super(key: key);
  String jmlTopup;
  Map<String, dynamic> dataTransaksi;

  @override
  State<KonfirmasiIsiSaldoScreen> createState() =>
      _KonfirmasiIsiSaldoScreenState();
}

class _KonfirmasiIsiSaldoScreenState extends State<KonfirmasiIsiSaldoScreen> {
  late String _jmlTopup;
  late Map<String, dynamic> _dataKonfirmasiIsiSaldo;
  String _radioValue = "";
  XFile _image = XFile("");

  _getImageFromGallery() async {
    // ignore: unused_local_variable
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);

    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jmlTopup = widget.jmlTopup;
    _dataKonfirmasiIsiSaldo = widget.dataTransaksi;
  }

  @override
  Widget build(BuildContext context) {
    log("Jumlah Top Up Saldo: $_jmlTopup");
    log("Data Konfirmasi Isi Saldo: $_dataKonfirmasiIsiSaldo");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: "Konfirmasi",
          isHaveActions: true,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        children: [
          CustomInputWithoutOutlineBorder(
            label: "ID Transaksi",
            inputValue: "${_dataKonfirmasiIsiSaldo['id_transaksi']}",
            isBanking: false,
          ),
          CustomInputWithoutOutlineBorder(
            label: "Jumlah top-up",
            inputValue: CustomFormat.ubahFormatRupiah(int.parse(_jmlTopup), 0),
            isBanking: false,
          ),
          CustomInputWithoutOutlineBorder(
            label: "Jumlah yang harus dibayar",
            inputValue: CustomFormat.ubahFormatRupiah(
                _dataKonfirmasiIsiSaldo['jumlah'], 0),
            isBold: true,
            isImportant: true,
            isBanking: false,
          ),
          CustomInputWithoutOutlineBorder(
            label: "Dikirim ke",
            inputValue: _dataKonfirmasiIsiSaldo['rekening'].toString(),
            bankName: _dataKonfirmasiIsiSaldo['nama_bank'].toString(),
            isBold: true,
            isImportant: true,
            isBanking: true,
          ),
          CustomInputWithoutOutlineBorder(
            label: "Batas waktu transfer",
            inputValue: "23:59:40",
            isBold: true,
            isImportant: true,
            isBanking: false,
            isColored: true,
          ),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            color: Colors.blue,
            strokeWidth: 2,
            dashPattern: const [6, 3, 6, 3],
            child: ClipRRect(
              child: GestureDetector(
                onTap: () {
                  // ignore: avoid_print
                  print("Bottom sheet is opened!");

                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder:
                          (BuildContext context, StateSetter stateSetter) {
                        return SizedBox(
                          height: 220,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            child: Wrap(
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
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: ColorPallete.lightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: ListTile(
                                          leading: const Icon(Icons.photo),
                                          title: Text(
                                            'Ambil dari galeri',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                          trailing: Radio(
                                            value: "galeri",
                                            onChanged: (value) {
                                              stateSetter(() {
                                                _radioValue = value!;
                                              });

                                              _getImageFromGallery();

                                              print(
                                                  "Radio value: $_radioValue");
                                            },
                                            groupValue: _radioValue,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: ColorPallete.lightBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: ListTile(
                                          leading: const Icon(Icons.camera_alt),
                                          title: Text(
                                            'Ambil Gambar',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[600],
                                              fontSize: 14,
                                            ),
                                          ),
                                          trailing: Radio(
                                            value: 'kamera',
                                            groupValue: _radioValue,
                                            onChanged: (value) {
                                              stateSetter(() {
                                                _radioValue = value!;
                                              });

                                              print(
                                                  "Radio value: $_radioValue");
                                            },
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
                      });
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 125,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(25, 0, 146, 199),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.photo),
                      Text(
                        "Upload bukti transaksi",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Catatan :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(
                  "Lampirkan bukti transaksi (screenshot/foto) lalu cek status transaksi secara berkala",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FullWidthButton(
            text: "Cek Status Transaksi",
            navigateTo: StatusTransaksiIsiSaldoScreen(
              dataTransaksiIsiSaldo: _dataKonfirmasiIsiSaldo,
            ),
          ),
        ],
      ),
    );
  }
}
