import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void logout() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: height * 0.25,
            width: width,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Apakah Anda \nYakin Ingin Keluar?',
                  style: TextStyle(
                      fontSize: 16,
                      height: 1,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Archivo'),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: width,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.circular(35)),
                          child: const Text(
                            'Tidak',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Archivo',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: InkWell(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('token', '');
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/splash', (Route<dynamic> route) => false);
                        },
                        child: Container(
                          width: width,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: const Text(
                            'Ya',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Archivo'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                logout();
              },
              child: const Text("Log Out"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
