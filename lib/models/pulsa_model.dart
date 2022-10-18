class PulsaModel {
  int id;
  String jmlPulsa;
  String hargaPulsa;

  PulsaModel({
    required this.id,
    required this.jmlPulsa,
    required this.hargaPulsa,
  });
}

List<PulsaModel> pulsaList = [
  PulsaModel(id: 1, jmlPulsa: '5.000', hargaPulsa: '6.500'),
  PulsaModel(id: 2, jmlPulsa: '10.000', hargaPulsa: '11.500'),
  PulsaModel(id: 3, jmlPulsa: '15.000', hargaPulsa: '16.500'),
  PulsaModel(id: 4, jmlPulsa: '20.000', hargaPulsa: '21.500'),
  PulsaModel(id: 5, jmlPulsa: '25.000', hargaPulsa: '26.500'),
  PulsaModel(id: 6, jmlPulsa: '30.000', hargaPulsa: '31.500'),
  PulsaModel(id: 7, jmlPulsa: '40.000', hargaPulsa: '41.500'),
  PulsaModel(id: 8, jmlPulsa: '50.000', hargaPulsa: '51.500'),
  PulsaModel(id: 9, jmlPulsa: '75.000', hargaPulsa: '76.500'),
  PulsaModel(id: 10, jmlPulsa: '100.000', hargaPulsa: '100.000'),
  PulsaModel(id: 10, jmlPulsa: '150.000', hargaPulsa: '150.000'),
  PulsaModel(id: 10, jmlPulsa: '200.000', hargaPulsa: '200.000'),
];
