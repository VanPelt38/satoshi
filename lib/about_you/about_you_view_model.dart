import 'package:flutter/material.dart';
import 'package:satoshi_app/networking/firebase/firebase_auth_service.dart';
import 'package:satoshi_app/networking/firebase/firebase_firestore_service.dart';

class AboutYouViewModel extends ChangeNotifier {

final FirestoreService firestoreService = FirestoreService();
final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
String? _firstNames;
final TextEditingController firstNamesController = TextEditingController();
String? _lastName;
final TextEditingController lastNameController = TextEditingController();
DateTime? _dob;
final TextEditingController dobController = TextEditingController();
bool _isLoading = false;
String? _snackBarMessage;

String ? get firstNames => _firstNames;
String ? get lastName => _lastName;
DateTime ? get selectedDate => _dob;
bool get isLoading => _isLoading;
String ? get snackBarMessage => _snackBarMessage;

Future<void> selectDOB(BuildContext context) async {

  DateTime today = DateTime.now();
  DateTime minSelectableDate = today.subtract(Duration(days: 120 * 365)); // 120 years ago
  DateTime maxSelectableDate = today.subtract(Duration(days: 18 * 365)); 

  DateTime ? pickedDate = await showDatePicker(
    context: context,
    initialDate: _dob ?? maxSelectableDate,
    firstDate: minSelectableDate,
    lastDate: maxSelectableDate
    );

        if (pickedDate != null && pickedDate != _dob) {
      _dob = pickedDate;
      dobController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format date
      notifyListeners(); // Notify UI to update
    }
}

Future<bool> profileCreated() async {

_isLoading = true;

if (_firstNames != null && _lastName != null && _dob != null) {
  await saveProfileToFireStore();
  _isLoading = false;
  return true;
} else {
  _isLoading = false;
  _snackBarMessage = "Uh-oh - please enter all your details before continuing.";
  return false;
}
}

Future saveProfileToFireStore() async {

 String? userId = firebaseAuthService.getCurrentUser()?.uid;

 firestoreService.addDocumentWithId("users", "personalDetails", userId ?? "", {
    "firstNames": _firstNames,
    "lastName": _lastName,
    "dob": _dob,
    "userId": userId
 });
}

}