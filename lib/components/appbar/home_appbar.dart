import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  String? authNama, authPoto;
  bool loading = true;

  void _userProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nama = prefs.getString('nama');
    var poto = prefs.getString('img');
    setState(() {
      authNama = nama;
      authPoto = poto;
      loading = false;
    });

    log(poto.toString());
  }

  @override
  void initState() {
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
          loading == true
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                )
              : Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(1000),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://png.pngtree.com/png-vector/20190223/ourmid/pngtree-profile-glyph-black-icon-png-image_691589.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Halo, Selamat Pagi 👋",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                "$authNama",
                style: const TextStyle(
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
