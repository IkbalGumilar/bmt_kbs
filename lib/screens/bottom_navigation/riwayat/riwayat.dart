import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/bottom_navigation/riwayat/detail_item_riwayat_transaksi.dart';
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
            height: 60.0,
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
                    onPressed: () {
                      urutkanRiwayatBottomSheet(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF40B549).withOpacity(0.2),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Urutkan",
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
                    onPressed: () {
                      filterRiwayatBottomSheet(context);
                    },
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailItemRiwayatTransaksi(),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}

Future<dynamic> urutkanRiwayatBottomSheet(BuildContext context) {
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
        heightFactor: 0.48,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Urutkan Berdasarkan",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorPallete.lightBlueColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Terbaru",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[600]!,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Radio(
                              value: "0",
                              // ignore: avoid_print
                              onChanged: (value) => print(value),
                              groupValue: const {"key": "0"},
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
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Terlama",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[600]!,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Radio(
                              value: "0",
                              // ignore: avoid_print
                              onChanged: (value) => print(value),
                              groupValue: const {"key": "0"},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
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
                          "Reset",
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
                          // ignore: avoid_print
                          print('ss');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 0.0,
                        ),
                        child: const Text(
                          "Tampilkan",
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
            ],
          ),
        ),
      );
    },
  );
}

Future<dynamic> filterRiwayatBottomSheet(BuildContext context) {
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
        heightFactor: 0.72,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Filter",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Pilih tanggal yang mau ditampilkan",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[400]!,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "02 Oktober",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Sabtu",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Icon(
                            Icons.chevron_right,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[400]!,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "17 Oktober",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "Senin",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                    ),
                    child: Text(
                      "Kategori",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[400]!,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Semua",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[400]!,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Pem-",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "bayaran",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[400]!,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Refund",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[400]!,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Isi Saldo",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: ColorPallete.lightBlueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 16,
                                children: [
                                  Image.asset(
                                    'assets/icons/screens/transfer/sumber_dana.png',
                                    scale: 1.9,
                                  ),
                                  const Text(
                                    "Pilih Sumber Dana",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              const Icon(Icons.chevron_right),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                            "Reset",
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
                            // ignore: avoid_print
                            print('ss');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallete.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 0.0,
                          ),
                          child: const Text(
                            "Terapkan",
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
