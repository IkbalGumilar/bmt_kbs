import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/models/internet_dan_tv_model.dart';
import 'package:bmt_kbs/screens/features/internet_dan_tv/konfirmasi_internet_dan_tv.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class MenuInternetDanTvScreen extends StatefulWidget {
  const MenuInternetDanTvScreen({super.key});

  @override
  State<MenuInternetDanTvScreen> createState() =>
      _MenuInternetDanTvScreenState();
}

class _MenuInternetDanTvScreenState extends State<MenuInternetDanTvScreen> {
  late String value = "";

  @override
  void initState() {
    super.initState();
    value = "Pilih operator layanan";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          title: "Internet & TV Kabel",
          isHaveActions: false,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                runSpacing: 10.0,
                children: [
                  const Text(
                    "No. Pelanggan",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    autocorrect: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: ColorPallete.lightBlueColor,
                      hintText: "Masukkan No. Pelanggan",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 40,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: GestureDetector(
                  onTap: () {
                    // ignore: avoid_print
                    print("Silakan pilih layanan yang akan dibayar!");

                    internetDanTvBottomSheet(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        value,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const KonfirmasiInternetDanTvScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallete.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text(
                    "Cek Tagihan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> internetDanTvBottomSheet(BuildContext context,
      {String? selectedProvider}) {
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
          heightFactor: 0.7,
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
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Pilih operator layanan",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: providerList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                      mainAxisExtent: 100,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          value = providerList[index].namaProvider;
                        });
                        Navigator.pop(context);
                      },
                      child: Wrap(
                        runSpacing: 5.0,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                providerList[index].imagePath,
                              ),
                            ),
                          ),
                          Text(
                            providerList[index].namaProvider,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
