import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(title: "Transfer", isHaveActions: false),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Test")],
          ),
        ],
      ),
    );
  }
}
