import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/list_customer_penarikan_dana.dart';
import 'package:flutter/material.dart';

class DaftarKontakScreen extends StatefulWidget {
  const DaftarKontakScreen({super.key});

  @override
  State<DaftarKontakScreen> createState() => _DaftarKontakScreenState();
}

class _DaftarKontakScreenState extends State<DaftarKontakScreen>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    const Tab(text: 'Favorit'),
    const Tab(text: 'Terakhir'),
  ];
  late TabController _tabController;
  late ScrollController _scrollController;
  late bool fixedScroll;

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
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  _buildTabContext(int lineCount) => Container(
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: lineCount,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: ListCustomerPenarikanDana(
                name: "ANGGI RIMA SAPUTRA",
                bank: "BCA",
                rekening: "1234567891011141516",
              ),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: "Daftar Kontak",
          isHaveActions: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
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
                _buildTabContext(3),
                _buildTabContext(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
