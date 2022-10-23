import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class BpjsKesehatanScreen extends StatelessWidget {
  const BpjsKesehatanScreen({super.key});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Image.asset(
                      "assets/screens/bpjs/logo_bpjs2.png",
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text("BPJS Kesehatan"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
