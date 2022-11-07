import 'package:bmt_kbs/screens/features/bpjs/bpjs_kesehatan/bpjs_kesehatan.dart';
import 'package:bmt_kbs/screens/features/bpjs/bpjs_ketenagakerjaan/bpjs_ketenagakerjaan.dart';
import 'package:bmt_kbs/widgets/box_container_with_route.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MenuBpjsScreen extends StatelessWidget {
  const MenuBpjsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "BPJS",
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
                title: "BPJS Kesehatan",
                route: BpjsKesehatanScreen(),
                imgIcon: "assets/screens/bpjs/logo_bpjs.png",
              ),
              const SizedBox(
                height: 10,
              ),
              BoxContainerWithRoute(
                title: "BPJS Ketenagakerjaan",
                route: const BpjsKetenagakerjaanScreen(),
                imgIcon: "assets/screens/bpjs/logo_bpjs.png",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
