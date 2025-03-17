import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardViewModel extends ChangeNotifier {

  double? _bitcoinPrice;
  double? get bitcoinPrice => _bitcoinPrice;
  
Future<void> getCurrentBitcoinPrice() async {
  final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=gbp'));
if (_bitcoinPrice == null) {
if (response.statusCode == 200) {
  final data = json.decode(response.body);
  final price = data['bitcoin']['gbp'];
 _bitcoinPrice = price.toDouble();
 notifyListeners();
}  else {
  throw Exception('Failed to load Bitcoin price');
}
}
}
}