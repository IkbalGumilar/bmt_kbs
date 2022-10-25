import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  void toggleCheckbox(bool value) {
    isChecked == false ? isChecked = true : isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  LoginInputWidget(
                    label: "Nama Pengguna",
                    inputIcon: Icons.account_circle_rounded,
                    hint: "Masukkan Nama Pengguna",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginInputWidget(
                    label: "Password",
                    inputIcon: Icons.lock,
                    hint: "Masukkan Password",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Lupa Password?",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: " Klik Disini",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // ignore: avoid_print
                              print("Lupa Password");
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPallete.primaryColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Checkbox(
                            value: isChecked,
                            // ignore: avoid_print
                            onChanged: (value) {
                              // ignore: avoid_print
                              print(value);

                              setState(() {
                                toggleCheckbox(value!);
                              });
                            },
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => ColorPallete.primaryColor),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                  text:
                                      "Dengan menekan tombol selanjutnya saya setuju dengan ",
                                ),
                                TextSpan(
                                  text: "ketentuan penggunaan ",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: "dan ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                TextSpan(
                                  text: "kebijakan privasi ",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
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
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginInputWidget extends StatelessWidget {
  String label;
  String hint;
  IconData inputIcon;

  LoginInputWidget({
    required this.label,
    required this.inputIcon,
    required this.hint,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autocorrect: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(10, 44, 80, 203),
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(inputIcon),
            prefixIconColor: Colors.red,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
