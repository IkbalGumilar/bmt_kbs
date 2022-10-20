import 'dart:math';

class CarouselVoucherModel {
  final int? id;
  final String title;
  final String imagePath;

  CarouselVoucherModel({required this.imagePath, required this.title, this.id});
}

int randomID() {
  return Random().nextInt(100000);
}

List<CarouselVoucherModel> carouselList = [
  CarouselVoucherModel(
    id: randomID(),
    title: "Free Fire collab with DJ Alok",
    imagePath: "assets/screens/voucher_permainan/carousel_1.jpg",
  ),
  CarouselVoucherModel(
    id: randomID(),
    title: "Mobile Legends event on December 2022",
    imagePath: "assets/screens/voucher_permainan/carousel_2.jpg",
  ),
  CarouselVoucherModel(
    id: randomID(),
    title: "PUBG Mobile Championship 2022",
    imagePath: "assets/screens/voucher_permainan/carousel_3.jpg",
  ),
  CarouselVoucherModel(
    id: randomID(),
    title: "Beli Voucher Game Online hanya di BMT KBS",
    imagePath: "assets/screens/voucher_permainan/banner.png",
  ),
];
