import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/isi_saldo/status_transaksi.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/custom_input_widget.dart';
import 'package:bmt_kbs/widgets/full_width_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class KonfirmasiIsiSaldoScreen extends StatefulWidget {
  KonfirmasiIsiSaldoScreen({super.key});

  @override
  State<KonfirmasiIsiSaldoScreen> createState() =>
      _KonfirmasiIsiSaldoScreenState();
}

class _KonfirmasiIsiSaldoScreenState extends State<KonfirmasiIsiSaldoScreen> {
  @override
  Widget build(BuildContext context) {
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
          CustomInputWidget(
            label: "ID Transaksi",
            inputValue: "1234567891011121314",
            isBanking: false,
          ),
          CustomInputWidget(
            label: "Jumlah top-up",
            inputValue: "Rp. 50.000",
            isBanking: false,
          ),
          CustomInputWidget(
            label: "Jumlah yang harus dibayar",
            inputValue: "Rp. 50.123",
            isBold: true,
            isImportant: true,
            isBanking: false,
          ),
          CustomInputWidget(
            label: "Dikirim ke",
            inputValue: "0982 9878 6154 6218",
            isBold: true,
            isImportant: true,
            isBanking: true,
          ),
          CustomInputWidget(
            label: "Batas waktu transfer",
            inputValue: "23:59:40",
            isBold: true,
            isImportant: true,
            isBanking: false,
            isColored: true,
          ),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
            color: Colors.blue,
            strokeWidth: 2,
            dashPattern: [6, 3, 6, 3],
            child: ClipRRect(
              child: GestureDetector(
                onTap: () {
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
                      return Container(
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
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.blue[100],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: ColorPallete.lightBlueColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: ListTile(
                                        leading: Icon(Icons.photo),
                                        title: Text(
                                          'Ambil dari galeri',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey[600],
                                              fontSize: 14),
                                        ),
                                        trailing: Radio(
                                          value: "0",
                                          onChanged: (value) => print(value),
                                          groupValue: {"key": "0"},
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
                                        borderRadius: BorderRadius.circular(5),
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
                                          value: "0",
                                          onChanged: (value) => print(value),
                                          groupValue: {"key": "0"},
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
                },
                child: Container(
                  width: double.infinity,
                  height: 125,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(25, 0, 146, 199),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo),
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
            padding: EdgeInsets.only(top: 20),
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
          SizedBox(
            height: 10,
          ),
          FullWidthButton(
            text: "Cek Status Transaksi",
            navigateTo: StatusTransaksiScreen(),
          ),
        ],
      ),
    );
  }
}
