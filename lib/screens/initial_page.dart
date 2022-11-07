import 'package:bmt_kbs/components/appbar/home_appbar.dart';
import 'package:bmt_kbs/components/appbar/notifikasi_appbar.dart';
import 'package:bmt_kbs/components/appbar/profile_appbar.dart';
import 'package:bmt_kbs/components/appbar/riwayat_appbar.dart';
import 'package:bmt_kbs/screens/bottom_navigation/notifikasi/notifikasi.dart';
import 'package:bmt_kbs/screens/bottom_navigation/profile/profile.dart';
import 'package:bmt_kbs/screens/bottom_navigation/riwayat/riwayat.dart';
import 'package:bmt_kbs/screens/default_home.dart';
import 'package:flutter/material.dart';

class InitialPageScreen extends StatefulWidget {
  const InitialPageScreen({super.key});

  @override
  State<InitialPageScreen> createState() => _InitialPageScreenState();
}

class _InitialPageScreenState extends State<InitialPageScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _bottomNavigationPages = [
    HomeScreen(),
    const RiwayatScreen(),
    const NotifikasiScreen(),
    const ProfileScreen(),
  ];

  final List<Widget> _appBar = [
    const HomeScreenAppBar(),
    const RiwayatScreenAppBar(),
    const NotifikasiScreenAppBar(),
    const ProfileScreenAppBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _appBar[_selectedIndex],
      ),
      body: _bottomNavigationPages[_selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar:
          _selectedIndex < 1 ? _customBottomNavigationBar() : null,
    );
  }

  Widget _customBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/bottom_navigation_icons/home_nav.png'),
            color: Colors.black,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/bottom_navigation_icons/riwayat_nav.png'),
            color: Colors.black,
          ),
          label: "Riwayat",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
                'assets/icons/bottom_navigation_icons/notifikasi_nav.png'),
            color: Colors.black,
          ),
          label: "Notifikasi",
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/bottom_navigation_icons/profile_nav.png'),
            color: Colors.black,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
