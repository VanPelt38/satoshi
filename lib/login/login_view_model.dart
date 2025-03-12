import 'package:flutter/material.dart';
import 'package:satoshi_app/networking/firebase_auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  
FirebaseAuthService firebaseAuthService = FirebaseAuthService();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
  
Future<bool> signIn() async {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  try {
    final user = await firebaseAuthService.signIn(email, password);
    return (user != null);
  } catch (e) {
      print("firebase sign in error: $e");
      return false;
  }
  
}

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}