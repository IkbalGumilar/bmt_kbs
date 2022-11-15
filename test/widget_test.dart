import 'dart:convert';
import 'dart:developer';

import 'package:bmt_kbs/config/ip.dart';
import 'package:http/http.dart' as http;

void main() async {
  Future<String> getToken() async {
    var response = await http.post(
      Uri.parse(IpAdress().getIp + '/api/login'),
      headers: {
        "Accept": "application/json",
      },
      body: {
        "email": "email@email.com",
        "password": "12345678",
      },
    );

    var data = jsonDecode(response.body);
    var token = data['token'];

    return token;
  }

  var myToken = await getToken();

  getTransactionHistory() async {
    var response = await http.get(
      Uri.parse(IpAdress().getIp + '/api/transaction-history'),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $myToken",
      },
    );

    var data = jsonDecode(response.body)['data'];

    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(data.toString());
    } else {
      print(response.statusCode);
      log(data.toString());
    }
  }

  getTransactionHistory();
}
