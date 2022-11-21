import 'package:bmt_kbs/screens/features/lain-lain/slot.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class LainLainScreen extends StatelessWidget {
  const LainLainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Lain-lain",
          isHaveActions: false,
        ),
      ),
      body: Center(
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.grey[300],
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SlotScreen(),
                ),
              );
            },
            child: SizedBox(
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Testing"),
                  Icon(Icons.http, size: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
