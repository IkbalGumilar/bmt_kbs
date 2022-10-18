import 'package:bmt_kbs/screens/features/listrik_pln/tagihan_listrik/tagihan_listrik.dart';
import 'package:bmt_kbs/screens/features/listrik_pln/token_listrik/token_listrik.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class PilihKategoriPlnScreen extends StatelessWidget {
  const PilihKategoriPlnScreen({super.key});

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
              ),
              const SizedBox(
                height: 10,
              ),
              BoxContainerWithRoute(
                title: "Token Listrik",
                route: const TokenListrikScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BoxContainerWithRoute extends StatelessWidget {
  BoxContainerWithRoute({
    required this.title,
    required this.route,
    Key? key,
  }) : super(key: key);

  String title;
  Widget route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: avoid_print
        print("Anda memilih bagian $title");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => route,
          ),
        );
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[500]!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/screens/tagihan_listrik_pln/pln.png",
                    scale: 1.8,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right_sharp,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
