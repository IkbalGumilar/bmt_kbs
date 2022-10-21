import 'dart:math';

class InternetDanTvModel {
  int id;
  String namaProvider;
  String imagePath;

  InternetDanTvModel({
    required this.id,
    required this.namaProvider,
    required this.imagePath,
  });
}

int randomID() => Random().nextInt(100000);

List<InternetDanTvModel> providerList = [
  InternetDanTvModel(
      id: randomID(),
      namaProvider: 'First Media',
      imagePath: 'assets/screens/internet_dan_tv/first_media.png'),
  InternetDanTvModel(
      id: randomID(),
      namaProvider: 'Indihome Speedy',
      imagePath: 'assets/screens/internet_dan_tv/indihome.png'),
  InternetDanTvModel(
      id: randomID(),
      namaProvider: 'MyRepublic',
      imagePath: 'assets/screens/internet_dan_tv/myrepublic.png'),
  InternetDanTvModel(
      id: randomID(),
      namaProvider: 'Trans Vision',
      imagePath: 'assets/screens/internet_dan_tv/transvision.png'),
];
