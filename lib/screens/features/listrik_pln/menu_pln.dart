import 'package:bmt_kbs/screens/features/listrik_pln/tagihan_listrik/tagihan_listrik.dart';
import 'package:bmt_kbs/screens/features/listrik_pln/token_listrik/token_listrik.dart';
import 'package:bmt_kbs/widgets/box_container_with_route.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MenuPlnScreen extends StatelessWidget {
  const MenuPlnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "PLN",
          isHaveActions: false,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 30.0,
        ),
        children: [
          Column(
            children: [
              BoxContainerWithRoute(
                title: "Tagihan Listrik",
                route: const TagihanListrikScreen(),
                imgIcon: "assets/icons/screens/tagihan_listrik_pln/pln.png",
              ),
              const SizedBox(
                height: 10,
              ),
              BoxContainerWithRoute(
                title: "Token Listrik",
                route: const TokenListrikScreen(),
                imgIcon: "assets/icons/screens/tagihan_listrik_pln/pln.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
