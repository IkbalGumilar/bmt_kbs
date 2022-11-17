import 'package:bmt_kbs/etc/color_pallete.dart';
import 'package:bmt_kbs/screens/bottom_navigation/profile/ubah_profile.dart';
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

                          if (mounted) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/splash', (Route<dynamic> route) => false);
                          }
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
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image:
                            AssetImage('assets/icons/card_icons/card_mask.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(65 / 2),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/avatar.png',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          "Anggi Rima Saputra".toUpperCase(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Text(
                      'Profil',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
              child: Wrap(
                runSpacing: -16,
                children: [
                  ListTile(
                    leading: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Icon(
                        Icons.drive_file_rename_outline,
                        color: Colors.black,
                      ),
                    ),
                    minLeadingWidth: 0,
                    title: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Text(
                        'Ubah Profil',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.1,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UbahProfileScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Icon(
                        Icons.generating_tokens,
                        color: Colors.black,
                      ),
                    ),
                    minLeadingWidth: 0,
                    title: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Text(
                        'My Coin',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.1,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/edit_profile');
                    },
                  ),
                  ListTile(
                    leading: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: Transform.rotate(
                        angle: 3.14 / -3,
                        child: const Icon(
                          Icons.confirmation_number,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    minLeadingWidth: 0,
                    title: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Text(
                        'Kode Promo',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.1,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/edit_profile');
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Text(
                      'Keamanan',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
              child: Wrap(
                runSpacing: -16,
                children: [
                  ListTile(
                    leading: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                    ),
                    minLeadingWidth: 0,
                    title: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Text(
                        'Ubah Security Code',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.1,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/edit_profile');
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Text(
                      'Tentang',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
              child: Wrap(
                runSpacing: -16,
                children: [
                  ListTile(
                    leading: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Icon(
                        Icons.description,
                        color: Colors.black,
                      ),
                    ),
                    minLeadingWidth: 0,
                    title: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Text(
                        'Syarat dan Ketentuan',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.1,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/edit_profile');
                    },
                  ),
                  ListTile(
                    leading: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Icon(
                        Icons.verified_user,
                        color: Colors.black,
                      ),
                    ),
                    minLeadingWidth: 0,
                    title: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Text(
                        'Kebijakan Privasi',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.1,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/edit_profile');
                    },
                  ),
                  ListTile(
                    leading: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Icon(
                        Icons.quiz,
                        color: Colors.black,
                      ),
                    ),
                    minLeadingWidth: 0,
                    title: Transform.translate(
                      offset: const Offset(-16, 0),
                      child: const Text(
                        'Pusat Bantuan',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    trailing: Transform.scale(
                      scale: 1.1,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed('/edit_profile');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallete.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    logout();
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
