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
  bool isHidden = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void toggleCheckbox(bool value) {
    isChecked == false ? isChecked = true : isChecked = false;
  }

  login() async {
    try {
      Uri url = Uri.parse('https://ppob.koperasibmtkbs.com/api/login');
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
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['token']);
        prefs.setString('nama', data['profile']['name']);
        prefs.setString('saldo', data['wallet']['credit']);
        prefs.setString('img', data['profile']['url_photo_profile']);
        prefs.setString('email', data['profile']['email']);

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const InitialPageScreen(),
          ),
          (Route<dynamic> route) => false,
        );
      } else if (response.statusCode == 422) {
        var errEmail = data['errors']['email'];
        var errPassword = data['errors']['password'];

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
          fontSize: 16.0,
        );
      }
    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(
          msg: 'Terjadi kesalahan, harap coba lagi!',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: emailC,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(10, 44, 80, 203),
                          hintText: "Masukkan Email Pengguna",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Icon(Icons.account_circle_rounded),
                          prefixIconColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: isHidden,
                        controller: passwordC,
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(10, 44, 80, 203),
                          hintText: "Masukkan Password",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          prefixIconColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isHidden = !isHidden;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
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
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          value: isChecked,
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
                  const SizedBox(
                    height: 10,
                  ),
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
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        child: const Text(
                          "Login",
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
            ),
          ],
        ),
      ),
    );
  }
}
