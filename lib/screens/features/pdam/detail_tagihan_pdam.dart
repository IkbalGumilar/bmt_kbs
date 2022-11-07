import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/pdam/konfirmasi_tagihan_pdam.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class DetailTagihanPdamScreen extends StatelessWidget {
  const DetailTagihanPdamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: "PDAM", isHaveActions: false),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Wrap(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "No. Meteran PDAM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "0000112233221",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Nama Pelanggan",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Ari Ramdani",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Priode Tagihan",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "09/2022,10/2022",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Total Tagihan",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "Rp. 282.500",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Tagihan",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Rp. 280.000",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Biaya Administrasi",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Rp. 2.500",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const KonfirmasiTagihanPdamScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallete.primaryColor,
                  ),
                  child: const Text(
                    "Lanjutkan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
