import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  String? authNama, authPoto;
  void _userProfile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var token = _prefs.getString('token');
    var nama = _prefs.getString('nama');
    var poto = _prefs.getString('img');

    authNama = nama;
    authPoto = poto;

    log(poto.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userProfile();
  }

  @override
  Widget build(BuildContext context) {
    print(authPoto);
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(1000),
              image: DecorationImage(
                image: NetworkImage(
                    '${authPoto != null ? authPoto : "https://png.pngtree.com/png-vector/20190223/ourmid/pngtree-profile-glyph-black-icon-png-image_691589.jpg"}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Halo, Selamat Pagi 👋",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                "$authNama",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: Image.asset(
              'assets/icons/shop.png',
              width: 28,
            ),
          ),
        )
      ],
    );
  }
}
