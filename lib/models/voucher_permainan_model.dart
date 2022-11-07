import 'dart:math';

import 'package:bmt_kbs/models/carousel_voucher_model.dart';

class VoucherPermainanModel {
  int id;
  String jmlVoucher;
  String hargaVoucher;

  int randomID() {
    return Random().nextInt(100000);
  }

  VoucherPermainanModel({
    required this.id,
    required this.jmlVoucher,
    required this.hargaVoucher,
  });
}

List<VoucherPermainanModel> voucherList = [
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '5.000',
    hargaVoucher: '5.000',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '10.000',
    hargaVoucher: '10.000',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '15.000',
    hargaVoucher: '15.000',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '20.000',
    hargaVoucher: '20.000',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '25.000',
    hargaVoucher: '25.000',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '30.000',
    hargaVoucher: '30.000',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '40.000',
    hargaVoucher: '40.000',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '50.000',
    hargaVoucher: '50.000',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '75.000',
    hargaVoucher: '76.500',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '100.000',
    hargaVoucher: '100.000',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '150.000',
    hargaVoucher: '150.000',
  ),
  VoucherPermainanModel(
    id: randomID(),
    jmlVoucher: '200.000',
    hargaVoucher: '200.000',
  ),
];
