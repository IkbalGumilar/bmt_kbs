import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:flutter/material.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30,
                      color: Colors.grey[300],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "17 Oktober 2022",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        RiwayatTransaksiItem(
                          title: "Kirim Uang",
                          timeDesc: "17 Okt 2022 . 10:00",
                          nominal: "Rp 100.000",
                          icon: "kirim_uang.png",
                        ),
                        RiwayatTransaksiItem(
                          title: "Terima Uang",
                          timeDesc: "17 Okt 2022 . 22:00",
                          nominal: "Rp 5.000",
                          icon: "terima_uang.png",
                        ),
                        RiwayatTransaksiItem(
                          title: "Listrik",
                          timeDesc: "17 Okt 2022 . 06:10",
                          nominal: "Rp 100.000",
                          icon: "listrik.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30,
                      color: Colors.grey[300],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "20 September 2022",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        RiwayatTransaksiItem(
                          title: "Isi Saldo",
                          timeDesc: "20 Sep 2021 . 12:00",
                          nominal: "Rp 300.000",
                          icon: "isi_saldo.png",
                        ),
                        RiwayatTransaksiItem(
                          title: "Pulsa & Data",
                          timeDesc: "20 Sep 2021 . 16:00",
                          nominal: "Rp 100.000",
                          icon: "pulsa.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30,
                      color: Colors.grey[300],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "28 September 2022",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        RiwayatTransaksiItem(
                          title: "Internet & TV Kabel",
                          timeDesc: "28 Sep 2021 . 12:00",
                          nominal: "Rp 100.000",
                          icon: "internet.png",
                        ),
                        RiwayatTransaksiItem(
                          title: "PDAM",
                          timeDesc: "28 Sep 2021 . 11:00",
                          nominal: "Rp 180.000",
                          icon: "pdam.png",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        color: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF40B549).withOpacity(0.2),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Uraikan",
                      style: TextStyle(
                        color: ColorPallete.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Flexible(
                flex: 1,
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPallete.primaryColor,
                      elevation: 0,
                    ),
                    child: const Text(
                      "Filter",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RiwayatTransaksiItem extends StatelessWidget {
  RiwayatTransaksiItem({
    required this.title,
    required this.timeDesc,
    required this.nominal,
    required this.icon,
    Key? key,
  }) : super(key: key);

  late String title;
  late String timeDesc;
  late String nominal;
  late String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/$icon'),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            timeDesc,
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 12.0,
            ),
          ),
          trailing: Text(
            nominal,
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
