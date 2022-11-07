import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/custom_input_without_outline_border.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class NotifikasiTransferBerhasilScreen extends StatelessWidget {
  const NotifikasiTransferBerhasilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "",
          isHaveActions: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80 / 2),
                              color: Colors.grey[300],
                            ),
                            child: Image.asset(
                              "assets/icons/screens/isi_saldo/success.png",
                              scale: 1.8,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Top Up Berhasil",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        "Sab 10/06/2022 23:59:40",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dari",
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16.0,
                                bottom: 8.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius:
                                          BorderRadius.circular(40 / 2),
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "ARI RAMDANI",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        "Saldo -",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(color: Colors.grey, thickness: 1),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    CustomInputWithoutOutlineBorder(
                      label: "No. Referensi",
                      inputValue:
                          "0000111-12131313-31311-313131313-131313131-131",
                      isBold: false,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ke",
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16.0,
                                bottom: 8.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/icons/screens/penarikan_dana/rekening_penarikan.png",
                                    width: 20,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    "CentralAssesmenindo-HADI MULYANA",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(color: Colors.grey, thickness: 1),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        _notifikasiTransferBerhasilBottomSheet(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Detail Transaksi",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 70,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              onPressed: () {
                // ignore: avoid_print
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPallete.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Tutup",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _notifikasiTransferBerhasilBottomSheet(BuildContext context) {
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
          heightFactor: 0.6,
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
                          "Informasi Pelanggan",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Saldo Terpakai",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Rp. 199.000",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Tanggal",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "17 Okt 2022",
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Waktu",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "10.30",
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "No. Referensi",
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "p-00121-220122...",
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nominal Top Up",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rp. 48.000",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Biaya Admin",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rp. 2.000",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: DottedBorder(
                    color: Colors.grey[400]!,
                    dashPattern: const [6, 3, 6, 3],
                    child: const SizedBox(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            "RP. 50.000",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
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
}
