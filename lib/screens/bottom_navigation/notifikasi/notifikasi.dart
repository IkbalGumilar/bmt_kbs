import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/bottom_navigation/notifikasi/detail_pesan.dart';
import 'package:bmt_kbs/screens/bottom_navigation/notifikasi/notifikasi_topup_berhasil.dart';
import 'package:bmt_kbs/screens/bottom_navigation/notifikasi/notifikasi_transfer_berhasil.dart';
import 'package:flutter/material.dart';

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: (Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const TabBar(
                indicatorColor: ColorPallete.primaryColor,
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                tabs: [
                  Tab(
                    text: 'Notifikasi',
                  ),
                  Tab(text: 'Pesan'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _notifikasiTabSection(),
                    _pesanTabSection(),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Column _pesanTabSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Wrap(
            runSpacing: 10,
            children: [
              _PesanItem(
                message:
                    "Selamat! Khusus buat kamu, NIkmatin Cashback 50% Belanja, Jajan,& bayar tagihan pake saldo dana",
              ),
              _PesanItem(
                message:
                    "Bingung mau makan buat nyemil apa? Ke McDonalds aja! ada diskon voucher 25% untuk menu favoritmu",
              ),
              _PesanItem(
                message:
                    "Bingung mau makan buat nyemil apa? Ke Warteg Ibu Kimberly aja! ada diskon voucher 25% untuk menu favoritmu",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _notifikasiTabSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Wrap(
                children: [
                  Container(
                    width: double.infinity,
                    height: 30,
                    color: Colors.grey[400],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            "17 Okt 2022",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  NotifikasiItem(
                    value: "Top up Rp. 200.000 dari BANK BCA telah berhasil",
                    isHaveNextScreen: true,
                    nextScreenRoute: const NotifikasiTopUpBerhasilScreen(),
                  ),
                  NotifikasiItem(
                    value: "Transfer ke CentralAssesmenindo-HADI MULYADI",
                    isHaveNextScreen: true,
                    nextScreenRoute: const NotifikasiTransferBerhasilScreen(),
                  ),
                  NotifikasiItem(
                    value:
                        "Rp. 2.000 telah dipotong dari saldo untuk biaya transfer",
                  ),
                  NotifikasiItem(
                    value: "Top up Rp. 200.000 dari BANK BCA telah berhasil",
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                children: [
                  Container(
                    width: double.infinity,
                    height: 30,
                    color: Colors.grey[400],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            "26 Okt 2022",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  NotifikasiItem(
                    value:
                        "Top up Rp. 100.000 dari BANK MANDIRI telah berhasil ",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class _PesanItem extends StatelessWidget {
  _PesanItem({
    required this.message,
    Key? key,
  }) : super(key: key);

  late String message;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailPesanScreen(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[300]!),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NotifikasiItem extends StatelessWidget {
  NotifikasiItem({
    required this.value,
    this.isHaveNextScreen,
    this.nextScreenRoute,
    Key? key,
  }) : super(key: key);

  late String value;
  bool? isHaveNextScreen = false;
  Widget? nextScreenRoute;

  @override
  Widget build(BuildContext context) {
    if (isHaveNextScreen == true) {
      return GestureDetector(
        onTap: () {
          if (nextScreenRoute != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => nextScreenRoute!,
              ),
            );
          } else {
            print("next screen route is null");
          }
        },
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
