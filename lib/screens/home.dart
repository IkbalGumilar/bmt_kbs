import 'package:bmt_kbs/screens/features/bpjs/menu_bpjs.dart';
import 'package:bmt_kbs/screens/features/internet_dan_tv/menu_internet_dan_tv.dart';
import 'package:bmt_kbs/screens/features/isi_saldo/isi_saldo.dart';
import 'package:bmt_kbs/screens/features/pdam/menu_pdam.dart';
import 'package:bmt_kbs/screens/features/penarikan_dana/penarikan_dana.dart';
import 'package:bmt_kbs/screens/features/pulsa/pulsa.dart';
import 'package:bmt_kbs/screens/features/listrik_pln/menu_pln.dart';
import 'package:bmt_kbs/screens/features/transfer/transfer.dart';
import 'package:bmt_kbs/screens/features/voucher_permainan/menu_voucher.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(1000),
                  image: const DecorationImage(
                    image: NetworkImage('https://picsum.photos/200/300'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Halo, Selamat Pagi 👋",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    "Ahmad Zacky",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                color: Colors.black,
                icon: Image.asset(
                  'assets/icons/shop.png',
                  width: 28,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/card_icons/card_mask.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // -- SISA SALDO SECTION --
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Sisa Saldo",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              "Rp.823.123",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // -- POIN SECTION --
                        Column(
                          children: [
                            Container(
                              width: 120,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
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
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          size: 16,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      // ignore: avoid_print
                                      print("TOP UP Screen");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const IsiSaldoScreen(),
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/icons/card_icons/first.png',
                                      scale: 2.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow[600],
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      // ignore: avoid_print
                                      print("TRANSFER Screen");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TransferScreen(),
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/icons/card_icons/second.png',
                                      scale: 2.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PenarikanDanaScreen(),
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      'assets/icons/card_icons/third.png',
                                      scale: 2.0,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      // ignore: avoid_print
                                      print("Beralih ke Scan");
                                    },
                                    child: Image.asset(
                                      'assets/icons/card_icons/fourth.png',
                                      scale: 2.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // ignore: avoid_print
                            print("Beralih ke pulsa & data");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PulsaScreen(),
                                ));
                          },
                          child: MenuItem(
                            iconPath: "pulsa.png",
                            title: "Pulsa dan Paket Data",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MenuPlnScreen(),
                              ),
                            );
                          },
                          child: MenuItem(
                            iconPath: "pln.png",
                            title: "Tagihan Listrik PLN",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // ignore: avoid_print
                            print("Anda beralih ke Voucher Game Screen");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MenuVoucherScreen(),
                              ),
                            );
                          },
                          child: MenuItem(
                            iconPath: "vouchergame.png",
                            title: "Voucher Permainan",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Anda beralih ke BPJS Screen");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MenuBpjsScreen(),
                              ),
                            );
                          },
                          child: MenuItem(
                            iconPath: "bpjs.png",
                            title: "BPJS Kesehatan",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Beralih ke PDAM Screen");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MenuPdamScreen(),
                              ),
                            );
                          },
                          child: MenuItem(
                            iconPath: "pdam.png",
                            title: "PDAM",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Beralih ke Internet & TV Kabel Screen");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MenuInternetDanTvScreen(),
                              ),
                            );
                          },
                          child: MenuItem(
                            iconPath: "internet.png",
                            title: "Internet dan TV Kabel",
                          ),
                        ),
                        MenuItem(
                          iconPath: "telkom.png",
                          title: "Tagihan Telkom",
                        ),
                        MenuItem(
                          iconPath: "lainnya.png",
                          title: "Lain-lain",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Artikel Terbaru",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisSpacing: 16, mainAxisExtent: 200),
            itemBuilder: (context, index) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/bottom_navigation_icons/home_nav.png'),
              color: Colors.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                  'assets/icons/bottom_navigation_icons/riwayat_nav.png'),
              color: Colors.black,
            ),
            label: "Riwayat",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                  'assets/icons/bottom_navigation_icons/notifikasi_nav.png'),
              color: Colors.black,
            ),
            label: "Notifikasi",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                  'assets/icons/bottom_navigation_icons/profile_nav.png'),
              color: Colors.black,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  MenuItem({
    required this.title,
    required this.iconPath,
    Key? key,
  }) : super(key: key);

  String title;
  String iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Image.asset(
            'assets/icons/menu_icons/$iconPath',
            scale: 1.8,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 80,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
