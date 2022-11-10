import 'package:intl/intl.dart';

class CustomFormat {
  static String UbahFormatRupiah(dynamic number, int decimal) {
    NumberFormat currencyFormatter = NumberFormat.currency(
        locale: 'id', symbol: 'Rp. ', decimalDigits: decimal);
    return currencyFormatter.format(number);
  }

  static String UbahFormatPoint(dynamic number, int decimal) {
    NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: decimal);
    return currencyFormatter.format(number);
  }
}
