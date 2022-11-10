import 'dart:math';

class IsiSaldoModel {
  IsiSaldoModel({required this.id, required this.nominal});

  int id;
  int nominal;
}

int randomID() => Random().nextInt(100000);

List<IsiSaldoModel> isiSaldoList = [
  IsiSaldoModel(id: randomID(), nominal: 10000),
  IsiSaldoModel(id: randomID(), nominal: 20000),
  IsiSaldoModel(id: randomID(), nominal: 50000),
  IsiSaldoModel(id: randomID(), nominal: 100000),
  IsiSaldoModel(id: randomID(), nominal: 500000),
  IsiSaldoModel(id: randomID(), nominal: 1000000),
];
