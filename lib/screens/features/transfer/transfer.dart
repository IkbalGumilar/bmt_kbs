import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/full_width_button.dart';
import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: "Transfer", isHaveActions: false),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputFieldTransfer(
                  type: InputFieldType.pilihPenerima,
                  label: "Penerima",
                  placeholder: "Pilih Penerima",
                  imageIconPath: "cari_penerima.png",
                  isUsingArrowIcon: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputFieldTransfer(
                  type: InputFieldType.sumberDana,
                  label: "Sumber Dana",
                  placeholder: "Pilih Sumber Dana",
                  imageIconPath: "sumber_dana.png",
                  isUsingArrowIcon: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Jumlah Transfer",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: TextEditingController(text: "Rp. 250.000"),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputFieldTransfer(
                      type: InputFieldType.catatan,
                      label: "",
                      placeholder: "Catatan (opsional)",
                      imageIconPath: "catatan.png",
                    ),
                  ],
                ),
              ],
            ),
            FullWidthButton(
              text: "Selanjutnya",
              navigateTo: const TransferScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

enum InputFieldType {
  pilihPenerima,
  sumberDana,
  catatan,
}

// ignore: must_be_immutable
class InputFieldTransfer extends StatelessWidget {
  InputFieldTransfer({
    Key? key,
    required this.label,
    required this.imageIconPath,
    required this.placeholder,
    this.isUsingArrowIcon = false,
    required this.type,
  }) : super(key: key);

  InputFieldType type = InputFieldType.pilihPenerima;

  String label;
  String imageIconPath;
  String placeholder;
  bool? isUsingArrowIcon;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (type == InputFieldType.pilihPenerima) {
              cariKontakBottomSheet(context);
            } else if (type == InputFieldType.sumberDana) {
              sumberDanaBottomSheet(context);
            } else if (type == InputFieldType.catatan) {
              catatanBottomSheet(context);
            }
          },
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: ColorPallete.lightBlueColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 16,
                    children: [
                      Image.asset(
                        'assets/icons/screens/transfer/$imageIconPath',
                        scale: 1.9,
                      ),
                      Text(
                        placeholder,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  if (isUsingArrowIcon == true) const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> cariKontakBottomSheet(BuildContext context) {
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
          heightFactor: 0.85,
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Cari Kontak",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        autocorrect: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorPallete.lightBlueColor,
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Masukkan email penerima",
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Divider(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60 / 2),
                              color: Colors.grey,
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "https://picsum.photos/200",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ana Agustina Pamungkas",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "anaagustinap@gmail.com",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Radio(
                            value: true,
                            groupValue: const {"1": true},
                            // ignore: avoid_print
                            onChanged: (value) => print(value),
                          )
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

  Future<dynamic> sumberDanaBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 220,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Wrap(
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorPallete.lightBlueColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("Saldo"),
                            ],
                          ),
                          title: const Text(
                            'Rp. 500.000',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          trailing: Radio(
                            value: "0",
                            onChanged: (value) => print(value),
                            groupValue: const {"key": "0"},
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorPallete.lightBlueColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text("Poin"),
                            ],
                          ),
                          title: const Text(
                            'Rp. 500.000',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          trailing: Radio(
                            value: "0",
                            onChanged: (value) => print(value),
                            groupValue: const {"key": "0"},
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

  Future<dynamic> catatanBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 220,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Wrap(
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorPallete.lightBlueColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.photo),
                          title: Text(
                            'Ambil dari galeri',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600],
                                fontSize: 14),
                          ),
                          trailing: Radio(
                            value: "0",
                            // ignore: avoid_print
                            onChanged: (value) => print(value),
                            groupValue: const {"key": "0"},
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorPallete.lightBlueColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.camera_alt),
                          title: Text(
                            'Ambil Gambar',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          trailing: Radio(
                            value: "0",
                            // ignore: avoid_print
                            onChanged: (value) => print(value),
                            groupValue: const {"key": "0"},
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
}
