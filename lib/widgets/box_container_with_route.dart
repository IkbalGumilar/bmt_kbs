// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoxContainerWithRoute extends StatelessWidget {
  BoxContainerWithRoute({
    required this.title,
    required this.route,
    required this.imgIcon,
    Key? key,
  }) : super(key: key);

  String title;
  Widget route;
  String imgIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: avoid_print
        print("Anda memilih bagian $title");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => route,
          ),
        );
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[500]!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    imgIcon,
                    scale: 1.8,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right_sharp,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
