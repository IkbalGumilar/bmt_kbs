import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/models/paket_data_model.dart';
import 'package:bmt_kbs/models/pulsa_model.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/custom_bottom_sheet.dart';
import 'package:bmt_kbs/widgets/custom_input_pulsa.dart';
import 'package:flutter/material.dart';

class PulsaScreen extends StatefulWidget {
  const PulsaScreen({super.key});

  @override
  State<PulsaScreen> createState() => _PulsaScreenState();
}

class _PulsaScreenState extends State<PulsaScreen>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    const Tab(text: 'Pulsa'),
    const Tab(text: 'Paket Data'),
  ];
  late TabController _tabController;
  late ScrollController _scrollController;
  late bool fixedScroll;

  late bool isSelected = true;
  late int selectedIndex = 1;

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
            print('Pulsa ${pulsaList[index].jmlPulsa} selected');

            // create animation transition before showing custom bottom sheet
            customBottomSheet(context);

            setState(() {
              selectedIndex = index;
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
                            style: TextStyle(fontWeight: FontWeight.w700),
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
                    style: TextStyle(fontWeight: FontWeight.w500),
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
                CustomInputPulsa(
                  label: "Nomor Ponsel",
                  placeholder: "Masukkan Nomor Ponsel",
                  imageIcon: "no_ponsel.png",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomInputPulsa(
                  label: "Operator",
                  placeholder: "",
                  imageIcon: "telkomsel.png",
                ),
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
