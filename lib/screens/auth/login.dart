// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bmt_kbs/config/ip.dart';
import 'package:http/http.dart' as http;
import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/initial_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  bool isDisabled = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void toggleCheckbox(bool value) {
    isChecked == false ? isChecked = true : isChecked = false;
  }

  login() async {
    final prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse(IpAdress().getIp + '/api/login');
    var response = await http.post(url, headers: {
      "Accept": 'application/json',
    }, body: {
      "email": emailC.text,
      "password": passwordC.text,
    });

    var data = json.decode(response.body);

    log(data.toString());
    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      print(data);

      prefs.setString('token', data['token']);
      prefs.setString('nama', data['profile']['name']);
      prefs.setString('saldo', data['wallet']['credit']);
      // prefs.setString(key, data['']['']);
      prefs.setString('img', data['profile']['url_photo_profile']);
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const InitialPageScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else if (response.statusCode == 422) {
      var errEmail = data['errors']['email'];
      var errPassword = data['errors']['password'];

      print(errEmail);
      print(errPassword);

      if (errEmail != null) {
        Fluttertoast.showToast(
            msg: 'Email masih kosong!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (errEmail != null || errPassword != null) {
        Fluttertoast.showToast(
            msg:
                'Kredensial Anda tidak cocok dengan data Kami, harap cek kembali inputan Anda!',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else if (response.statusCode == 401) {
      Fluttertoast.showToast(
          msg: 'Email atau password salah!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
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
                      inputType: TextInputType.emailAddress,
                      label: "Email",
                      inputIcon: Icons.account_circle_rounded,
                      hint: "Masukkan Nama Pengguna",
                      myController: emailC),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginInputWidget(
                      inputType: TextInputType.visiblePassword,
                      label: "Password",
                      inputIcon: Icons.lock,
                      hint: "Masukkan Password",
                      myController: passwordC),
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
                                isDisabled == false ? login() : null;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isDisabled == false
                                    ? ColorPallete.primaryColor
                                    : Colors.grey,
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
                                isDisabled = !isDisabled;
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
  TextEditingController myController;
  TextInputType inputType;

  LoginInputWidget({
    required this.label,
    required this.inputIcon,
    required this.hint,
    required this.myController,
    required this.inputType,
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
          controller: myController,
          autocorrect: false,
          keyboardType: inputType,
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
