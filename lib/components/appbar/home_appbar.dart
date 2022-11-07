import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatefulWidget {
  const HomeScreenAppBar({super.key});

  @override
  State<HomeScreenAppBar> createState() => _HomeScreenAppBarState();
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  @override
  Widget build(BuildContext context) {
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
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/200/300'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Halo, Selamat Pagi 👋",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                "Ahmad Zacky",
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
