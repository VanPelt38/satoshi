import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:satoshi_app/networking/firebase/firebase_auth_service.dart';
import 'package:satoshi_app/networking/firebase/firebase_firestore_service.dart';

class DashboardViewModel extends ChangeNotifier {

  String? _userName;
  String? get userName => _userName;
  double? _bitcoinPrice;
  double? get bitcoinPrice => _bitcoinPrice;
  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final FirestoreService firestoreService = FirestoreService();
  
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

Future<void> getUserDetails() async {
 String? userId = firebaseAuthService.getCurrentUser()?.uid;

 final doc = await firestoreService.getDocumentById("users",  "personalDetails", userId ?? "");

if (doc != null && doc.exists) {
final Object? rawData = doc.data();
    if (rawData is Map<String, dynamic>) {
      _userName = rawData["firstNames"];
    } else {
      print("first names not found in document.");
    }
}
}

}