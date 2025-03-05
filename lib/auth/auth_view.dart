import 'package:flutter/material.dart';
import 'package:satoshi_app/auth/auth_view_model.dart';
import 'package:satoshi_app/login/login_view.dart';
import 'package:provider/provider.dart';


class AuthView extends StatelessWidget {
const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: null,
      backgroundColor: Color.fromARGB(255, 72, 1, 18),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Image.asset('assets/images/bitcoinFlutter.png'),
            Text(
              'Bitcoin, made easy.',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              SizedBox (
              width: 300,
              height: 50,
              child: 
              TextButton(
              onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginView())
               );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white
              ),
              child: const Text('Log in',
              style: TextStyle(fontSize: 18.0)
              )
            ),
            ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child:
            SizedBox(
              width: 300,
              height: 50,
              child: 
              TextButton(
              onPressed: () {
                // sign up
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 75, 115)
              ),
              child:
              Text(
                'Sign up for free',
              style: TextStyle(color: Colors.white,
              fontSize: 18.0
              ),
              )
            )
            ),
            )
          ],
        ),
      ),
      floatingActionButton: null,
    );
  }
}
