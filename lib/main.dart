import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:satoshi_app/auth/auth_view_model.dart';
import 'package:satoshi_app/login/login_view_model.dart';
import 'package:satoshi_app/networking/http_client.dart';
import 'package:satoshi_app/plaid/plaid_view_model.dart';
import 'package:satoshi_app/signup/signup_view_model.dart';
import 'package:satoshi_app/about_you/about_you_view_model.dart';
import 'package:satoshi_app/dashboard/dashboard_view_model.dart';
import 'auth/auth_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> initServices() async {
  debugPrint('initialising services...');
  Get.put<HttpClientProtocol>(HttpClient());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initServices();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => SignupViewModel()),
        ChangeNotifierProvider(create: (context) => AboutYouViewModel()),
        ChangeNotifierProvider(create: (context) => DashboardViewModel()),
        ChangeNotifierProvider(create: (context) => PlaidViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Satoshi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const AuthView(),
    );
  }
}
