// ignore_for_file: avoid_print, unused_element

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
      print(data);
    } else {
      print(response.statusCode);
      log(data.toString());
    }
  }

  checkNomorPonsel() async {
    var response = await http.post(
      Uri.parse(IpAdress().getIp + '/api/ppob/check_nomor'),
      headers: {
        "Authorization": "Bearer $myToken",
        "Accept": "application/json",
      },
      body: {"nomor": "0821", "type": "pulsa"},
    );

    var data = jsonDecode(response.body)['data']['data'];

    if (response.statusCode == 200) {
      var result = data.map((e) => e['product_code']).toList();
      print(result);
    } else {
      print(response.statusCode);
      log(data.toString());
    }
  }

  getPdamList() async {
    var response = await http
        .post(Uri.parse(IpAdress().getIp + '/api/ppob/pdam-list'), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $myToken",
    }, body: {
      "ppob_category_id": "6",
    });

    var data = jsonDecode(response.body)['data'];

    if (response.statusCode == 200) {
      print(data);
    } else {
      print(response.statusCode);
      log(data.toString());
    }
  }

  getTransactionHistory();

  // getTransactionHistory();
  // checkNomorPonsel();
  // getPdamList();

  // removeAlphabetFromPulsaCode(String value) {
  //   var result = value.replaceAll(RegExp(r'[a-zA-Z]'), '');
  //   print(result);
  // }

  // removeAlphabetFromPulsaCode('xl5000');
}
