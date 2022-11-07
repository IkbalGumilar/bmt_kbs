import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/bpjs/bpjs_ketenagakerjaan/status_transaksi_bpjs_ketenagakerjaan.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class KonfirmasiBpjsKetenagakerjaanScreen extends StatelessWidget {
  const KonfirmasiBpjsKetenagakerjaanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Konfirmasi Pembayaran",
          isHaveActions: false,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
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
                                      'assets/icons/screens/pulsa/overlay.png'),
                                  fit: BoxFit.none,
                                  alignment: Alignment(0.60, 0),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Sisa Saldo",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "Rp.823.123",
                                          style: TextStyle(
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
                                          width: 120,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/card_icons/points.png',
                                                  width: 28,
                                                ),
                                                Wrap(
                                                  children: const [
                                                    Text(
                                                      "9.000 poin",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .keyboard_arrow_right,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.grey[400]!,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "NIK Pelanggan",
                                              style: TextStyle(
                                                color: Colors.grey[600]!,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              "536612381527 ",
                                              style: TextStyle(
                                                color: Colors.grey[600]!,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Harga",
                                                style: TextStyle(
                                                  color: Colors.grey[600]!,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                "Rp. 123.000",
                                                style: TextStyle(
                                                  color: Colors.grey[600]!,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Biaya Administrasi",
                                                style: TextStyle(
                                                  color: Colors.grey[600]!,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                "Rp. 2.500",
                                                style: TextStyle(
                                                  color: Colors.grey[600]!,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                "Total",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Rp. 125.500",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
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
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Sumber Dana",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: ColorPallete.lightBlueColor,
                                    prefixIcon: Image.asset(
                                      "assets/icons/screens/pulsa/poin.png",
                                      scale: 1.5,
                                    ),
                                    suffixIcon: const Icon(Icons.chevron_right),
                                    hintText: "Pilih Sumber Dana",
                                    hintStyle: const TextStyle(
                                      color: Colors.black87,
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
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomAppBar(
          elevation: 0.0,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Total Bayar",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          "Rp 125.500",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print("Berpindah ke status voucher permainan");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const StatusTransaksiBpjsKetenagakerjaanScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.primaryColor,
                        ),
                        child: const Text(
                          "Bayar",
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
            ),
          ),
        ),
      ),
    );
  }
}
