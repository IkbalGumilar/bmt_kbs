import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class BpjsKetenagakerjaanScreen extends StatelessWidget {
  const BpjsKetenagakerjaanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          title: "BPJS",
          isHaveActions: false,
        ),
      ),
    );
  }
}
