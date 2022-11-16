import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/features/transfer/status_transfer.dart';
import 'package:bmt_kbs/widgets/custom_appbar.dart';
import 'package:bmt_kbs/widgets/custom_input_without_outline_border.dart';
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
                    TextField(
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorPallete.lightBlueColor,
                        hintText: "Catatan (opsional)",
                        hintStyle: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(Icons.edit),
                        prefixIconColor: Colors.red,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _konfirmasiTransferBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPallete.primaryColor,
                ),
                child: const Text(
                  "Selanjutnya",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _konfirmasiTransferBottomSheet(BuildContext context) {
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
          heightFactor: 0.8,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(80 / 2),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Konfirmasi Terakhir",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nama Penerima",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Ana Agustina Pamungkas",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  "anaagustinap@gmail.com",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(color: Colors.grey, thickness: 1),
                      ],
                    ),
                  ],
                ),
                CustomInputWithoutOutlineBorder(
                  label: "Sumber Dana",
                  inputValue: "Saldo",
                  isBold: true,
                ),
                CustomInputWithoutOutlineBorder(
                  label: "Jumlah Transfer",
                  inputValue: "Rp. xxxxxx",
                  isBold: true,
                ),
                CustomInputWithoutOutlineBorder(
                  label: "Biaya Administrasi",
                  inputValue: "Rp. -0",
                  isBold: true,
                ),
                CustomInputWithoutOutlineBorder(
                  label: "Catatan",
                  inputValue: "Buat beli beras",
                  isBold: true,
                ),
                // make a elevated button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StatusTransferScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPallete.primaryColor,
                    ),
                    child: const Text(
                      "Transfer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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

enum InputFieldType {
  pilihPenerima,
  sumberDana,
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
