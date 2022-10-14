import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PenarikanDanaScreen extends StatelessWidget {
  const PenarikanDanaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Penarikan Dana",
          isHaveActions: false,
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 240,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/icons/screens/penarikan_dana/points.png',
                                scale: 1.5,
                              ),
                              const Text(
                                "12.000 Poin",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rekening Tujuan",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: ColorPallete.lightBlueColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 16,
                                  children: [
                                    Image.asset(
                                      "assets/icons/screens/penarikan_dana/rekening_penarikan.png",
                                      scale: 2,
                                    ),
                                    const Text(
                                      "Rekening Penarikan",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              PreferredSize(
                                preferredSize: Size.fromHeight(50.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: Colors.black,
                                      unselectedLabelColor: Colors.grey[500],
                                      indicatorColor: ColorPallete.primaryColor,
                                      tabs: const [
                                        Tab(
                                          child: Text("Favorit"),
                                        ),
                                        Tab(
                                          child: Text("Terakhir"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 150,
                                child: TabBarView(
                                  children: [
                                    SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Wrap(
                                          runSpacing: 10,
                                          children: [
                                            ListCustomerPenarikanDanaWidget(
                                              name: "Ana Agustina P",
                                              bank: "MANDIRI",
                                              rekening: "1234567891011141516",
                                            ),
                                            ListCustomerPenarikanDanaWidget(
                                              name: "ANGGI RIMA SAPUTRA",
                                              bank: "BCA",
                                              rekening: "1234567891011141516",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Wrap(
                                          runSpacing: 12,
                                          children: [
                                            ListCustomerPenarikanDanaWidget(
                                              name: "Ana Agustina P",
                                              bank: "MANDIRI",
                                              rekening: "1234567891011141516",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Lihat semua",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jumlah Penarikan",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            TextField(
                              controller:
                                  TextEditingController(text: "Rp. 120.000"),
                              autocorrect: false,
                              decoration: const InputDecoration(
                                hintText: "Masukkan Jumlah Penarikan",
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: FullWidthButton(
                  navigateTo: PenarikanDanaScreen(),
                  text: "Selanjutnya",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ANA AGUSTINA P
// MANDIRI 1234567891011141516

class ListCustomerPenarikanDanaWidget extends StatelessWidget {
  ListCustomerPenarikanDanaWidget(
      {super.key,
      required this.name,
      required this.bank,
      required this.rekening});

  String name;
  String bank;
  String rekening;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40 / 2),
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/200/300"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "$bank $rekening",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Radio(
              value: true,
              groupValue: {true},
              onChanged: (value) => print(value),
            ),
          ],
        ),
      ],
    );
  }
}
