class PaketDataModel {
  int id;
  String paketTitle;
  String paketDesc;
  String paketHarga;

  PaketDataModel({
    required this.id,
    required this.paketTitle,
    required this.paketDesc,
    required this.paketHarga,
  });
}

List<PaketDataModel> paketDataList = [
  PaketDataModel(
    id: 1,
    paketTitle: 'Bicara semua operator 1 hari',
    paketDesc:
        'Paket bicara semua operator 1 hari, 280 mins Onnet + 5 mins AllOpr, 1 hari',
    paketHarga: '10.000',
  ),
  PaketDataModel(
    id: 2,
    paketTitle: 'PAKET INTERNET HARIAN 10K 1 HARI',
    paketDesc: '0,8 GB sd 2 GB',
    paketHarga: '10.000',
  ),
  PaketDataModel(
    id: 3,
    paketTitle: 'Data 12.000 7 Hari',
    paketDesc: 'Kuota 40MB - 110 MB 7 Hari (sesuai zonta terkait)',
    paketHarga: '30.000',
  ),
  PaketDataModel(
    id: 4,
    paketTitle: 'Data 15.000 7 Hari',
    paketDesc: 'Kuota 50MB - 150 MB 7 Hari (sesuai zonta terkait)',
    paketHarga: '30.000',
  ),
  PaketDataModel(
    id: 5,
    paketTitle: 'Zoom 1 hari 500 MB',
    paketDesc: '500 MB kuota Zoom',
    paketHarga: '10.000',
  ),
  PaketDataModel(
    id: 6,
    paketTitle: 'GRATIS 1GB 7 HARI (bonus kuota telepon untuk semua operator)',
    paketDesc: 'Kuota 1GB 7 Hari',
    paketHarga: '100',
  )
];
