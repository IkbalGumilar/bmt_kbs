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
    try {
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
      print(e.toString());
      // make a flutterToast that have an error message
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
                  LoginInputWidget(
                      isObscure: false,
                      inputType: TextInputType.emailAddress,
                      label: "Email",
                      inputIcon: Icons.account_circle_rounded,
                      hint: "Masukkan Nama Pengguna",
                      myController: emailC),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginInputWidget(
                      isObscure: true,
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
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              child: Flexible(
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
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginInputWidget extends StatefulWidget {
  String label;
  String hint;
  IconData inputIcon;
  TextEditingController myController;
  TextInputType inputType;
  bool? isObscure = false;

  LoginInputWidget({
    required this.label,
    required this.inputIcon,
    required this.hint,
    required this.myController,
    required this.inputType,
    required this.isObscure,
    Key? key,
  }) : super(key: key);

  @override
  State<LoginInputWidget> createState() => _LoginInputWidgetState();
}

class _LoginInputWidgetState extends State<LoginInputWidget> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
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
          obscureText: hidden ? true : false,
          controller: widget.myController,
          autocorrect: false,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(10, 44, 80, 203),
            hintText: widget.hint,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: Icon(widget.inputIcon),
            prefixIconColor: Colors.red,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: widget.isObscure == true
                ? IconButton(
                    onPressed: () {
                      // ignore: avoid_print
                      print("CLicked");
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                    icon: hidden == true
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
