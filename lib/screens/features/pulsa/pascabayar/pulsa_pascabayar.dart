import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/models/paket_data_model.dart';
import 'package:bmt_kbs/models/pulsa_model.dart';
import 'package:bmt_kbs/screens/features/pulsa/prabayar/konfirmasi_pulsa_prabayar.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class PulsaPascabayarScreen extends StatefulWidget {
  const PulsaPascabayarScreen({super.key});

  @override
  State<PulsaPascabayarScreen> createState() => _PulsaPascabayarScreenState();
}

class _PulsaPascabayarScreenState extends State<PulsaPascabayarScreen>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();

  final List<Widget> myTabs = [
    const Tab(text: 'Pulsa'),
    const Tab(text: 'Paket Data'),
  ];

  late TabController _tabController;
  late ScrollController _scrollController;
  late bool fixedScroll = false;
  late int selectedIndex = 1;
  String? nilai;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  _pulsaTabContext() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: pulsaList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 20.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // ignore: avoid_print
            print('Pulsa ${pulsaList[index].jmlPulsa} selected');

            // create animation transition before showing custom bottom sheet
            customBottomSheet(context);

            setState(() {
              selectedIndex = index;
              nilai = pulsaList[index].jmlPulsa;
            });
          },
          child: Container(
            width: 100,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: selectedIndex == index
                      ? ColorPallete.primaryColor
                      : Colors.grey,
                  width: selectedIndex == index ? 1.5 : 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            pulsaList[index].jmlPulsa,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Wrap(
                        children: [
                          Text(
                            "Harga",
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12),
                          ),
                          Text(
                            "Rp. ${pulsaList[index].hargaPulsa}",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[900],
                              fontSize: 12,
                            ),
                          ),
                        ],
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

  _paketDataTabContext() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: paketDataList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    paketDataList[index].paketTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    paketDataList[index].paketDesc,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Rp. ${paketDataList[index].paketHarga}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Pulsa dan Data",
          isHaveActions: false,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Column(
              children: [
                // TODO: add search bar
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 30.0),
              child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder: (context, value) {
                  return [
                    SliverToBoxAdapter(
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.black,
                        indicatorColor: ColorPallete.primaryColor,
                        isScrollable: true,
                        tabs: myTabs,
                      ),
                    ),
                  ];
                },
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _pulsaTabContext(),
                      _paketDataTabContext(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> customBottomSheet(BuildContext context) {
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
        heightFactor: 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: ListView(
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nomor Ponsel",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "089898987876",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey[400], thickness: 1),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
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
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bicara semua operator 1 hari",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Rp. 10.000",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Biaya transaksi",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Rp. -0",
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "RP. 11.500",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                                    const KonfirmasiPulsaPrabayarScreen(),
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
      );
    },
  );
}
