import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/tagihan_listrik_pln/konfirmasi_tagihan_listrik.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class TagihanListrikScreen extends StatelessWidget {
  const TagihanListrikScreen({super.key});

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tagihan Listrik",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: ColorPallete.lightBlueColor,
                        hintText: 'Contoh 536612381527',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Silakan ketik ID Pelanggan atau Nomer Meter",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("Cek tagihan listrik");
                  tagihanListrikBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPallete.primaryColor,
                ),
                child: const Text(
                  "Cek Tagihan Listrik",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
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

Future<dynamic> tagihanListrikBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Wrap(
                    children: [
                      const Text(
                        "Tagihan Listrik",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                      ),
                      Divider(color: Colors.grey[400], thickness: 1),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            SomeTextWithSpaceBetweenAlignment(
                              title: "No. meter listrik",
                              value: "5434 3455 xxxx",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SomeTextWithSpaceBetweenAlignment(
                              title: "Priode",
                              value: "10/22,11/22",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SomeTextWithSpaceBetweenAlignment(
                              title: "Jumlah tagihan",
                              value: "Rp. 250.000",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SomeTextWithSpaceBetweenAlignment(
                              title: "Biaya admin",
                              value: "Rp. 5.000",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD9F0DB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 0.0,
                          ),
                          child: const Text(
                            "Ubah",
                            style: TextStyle(
                              color: ColorPallete.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            print("SSS");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    KonfirmasiTagihanListrikScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallete.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 0.0,
                          ),
                          child: const Text(
                            "Konfirmasi",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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

// ignore: must_be_immutable
class SomeTextWithSpaceBetweenAlignment extends StatelessWidget {
  SomeTextWithSpaceBetweenAlignment({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  String title;
  String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
