import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:satoshi_app/networking/firebase/firebase_auth_service.dart';
import 'package:satoshi_app/networking/firebase/firebase_firestore_service.dart';
import 'package:intl/intl.dart';

class PersonalDetailsViewModel extends ChangeNotifier {
  
final TextEditingController firstNamesController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController dobController = TextEditingController();
  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  final FirestoreService firestoreService = FirestoreService();

Future<void> getUserDetails() async {
 String? userId = firebaseAuthService.getCurrentUser()?.uid;

 final doc = await firestoreService.getDocumentById("users",  "personalDetails", userId ?? "");

if (doc != null && doc.exists) {
final Object? rawData = doc.data();
    if (rawData is Map<String, dynamic>) {
      firstNamesController.text = rawData["firstNames"];
      lastNameController.text = rawData["lastName"];
      Timestamp dobStamp = rawData["dob"] as Timestamp;
      DateTime dob = dobStamp.toDate();
      dobController.text = DateFormat('dd-MM-yyyy').format(dob);
    } else {
      print("personal details not found in document.");
    }
}
}
}