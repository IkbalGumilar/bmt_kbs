import 'package:intl/intl.dart';

class CustomFormat {
  static String ubahFormatRupiah(dynamic number, int decimal) {
    NumberFormat currencyFormatter = NumberFormat.currency(
        locale: 'id', symbol: 'Rp. ', decimalDigits: decimal);
    return currencyFormatter.format(number);
  }

  static String ubahFormatPoint(dynamic number, int decimal) {
    NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: decimal);
    return currencyFormatter.format(number);
  }
}
