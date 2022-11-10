import 'dart:math';

class SemuaGameModel {
  int id;
  String namaGame;
  String imgGame;

  SemuaGameModel({
    required this.id,
    required this.namaGame,
    required this.imgGame,
  });
}

int randomID() {
  return Random().nextInt(100000);
}

List<SemuaGameModel> semuaGameList = [
  SemuaGameModel(
    id: randomID(),
    namaGame: 'Mobile Legends',
    imgGame: 'assets/images/ml.png',
  ),
  SemuaGameModel(
    id: randomID(),
    namaGame: 'Free Fire',
    imgGame: 'assets/images/ff.png',
  ),
  SemuaGameModel(
    id: randomID(),
    namaGame: 'Call of Duty Mobile',
    imgGame: 'assets/images/codm.png',
  ),
  SemuaGameModel(
    id: randomID(),
    namaGame: 'Arena of Valor',
    imgGame: 'assets/images/aov.png',
  ),
  SemuaGameModel(
    id: randomID(),
    namaGame: 'Point Blank',
    imgGame: 'assets/images/pb.png',
  ),
  SemuaGameModel(
    id: randomID(),
    namaGame: 'Speed Drifters',
    imgGame: 'assets/images/sd.png',
  ),
  SemuaGameModel(
    id: randomID(),
    namaGame: 'Ragnarok Mobile',
    imgGame: 'assets/images/ro.png',
  ),
  SemuaGameModel(
    id: randomID(),
    namaGame: 'Ayo Dance Mobile',
    imgGame: 'assets/images/ayo.png',
  ),
];
