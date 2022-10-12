import 'package:bmt_kbs/etc/color_pallete.dart';
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
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarHeight: 60,
          title: const Text(
            "Konfirmasi",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              child: const Text(
                "Batalkan",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        children: [
          InputKonfirmasiIsiSaldo(
            label: "ID Transaksi",
            inputValue: "1234567891011121314",
            isBanking: false,
          ),
          InputKonfirmasiIsiSaldo(
            label: "Jumlah top-up",
            inputValue: "Rp. 50.000",
            isBanking: false,
          ),
          InputKonfirmasiIsiSaldo(
            label: "Jumlah yang harus dibayar",
            inputValue: "Rp. 50.123",
            isBold: true,
            isImportant: true,
            isBanking: false,
          ),
          InputKonfirmasiIsiSaldo(
            label: "Dikirim ke",
            inputValue: "0982 9878 6154 6218",
            isBold: true,
            isImportant: true,
            isBanking: true,
          ),
          InputKonfirmasiIsiSaldo(
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
                    shape: RoundedRectangleBorder(
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
                                              fontSize: 14),
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
          ),
        ],
      ),
    );
  }
}

class InputKonfirmasiIsiSaldo extends StatelessWidget {
  InputKonfirmasiIsiSaldo({
    Key? key,
    required this.label,
    required this.inputValue,
    this.isBold,
    this.isImportant,
    required this.isBanking,
    this.isColored,
  }) : super(key: key);

  String label;
  String inputValue;
  bool? isBold;
  bool? isImportant;
  bool isBanking;
  bool? isColored = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        if (isBanking == true)
          const SizedBox(
            height: 5,
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isBanking == true)
              Text(
                isBanking == true ? "Bank Mandiri A/n Jhon Doe" : "",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            TextField(
              autocorrect: false,
              controller: TextEditingController(text: inputValue),
              decoration: InputDecoration(),
              style: TextStyle(
                fontWeight:
                    isBold == true ? FontWeight.bold : FontWeight.normal,
                fontSize: isImportant == true ? 20 : 14,
                color: isColored == true ? Colors.orange[900] : Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
