import 'package:bmt_kbs/etc/custom_format.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardSaldoWithPointWidget extends StatefulWidget {
  const CardSaldoWithPointWidget({super.key});

  @override
  State<CardSaldoWithPointWidget> createState() =>
      _CardSaldoWithPointWidgetState();
}

class _CardSaldoWithPointWidgetState extends State<CardSaldoWithPointWidget> {
  String? saldo;

  getDataToCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mySaldo = prefs.getString('saldo');
    double formatted = double.parse(mySaldo!);

    setState(() {
      saldo = CustomFormat.ubahFormatRupiah(formatted, 0);
    });

    print(saldo);
  }

  @override
  void initState() {
    super.initState();
    getDataToCard();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            image: const DecorationImage(
              image: AssetImage('assets/icons/screens/pulsa/overlay.png'),
              fit: BoxFit.none,
              alignment: Alignment(0.60, 0),
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sisa Saldo",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "$saldo",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      width: 120,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/card_icons/points.png',
                              width: 28,
                            ),
                            Wrap(
                              children: const [
                                Text(
                                  "9.000 poin",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 16,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
