import 'package:flutter/material.dart';
import 'package:satoshi_app/login/login_view_model.dart';
import 'package:provider/provider.dart';


class LoginView extends StatelessWidget {
const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 234, 234, 234),
        leading: IconButton(onPressed: () {
         Navigator.pop(context);
        }
        , icon: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 243, 75, 115)
        )
        ),
      ),
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Log in',
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
            Text(
              'Enter the email address that you used to sign up to Satoshi',
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
            
            TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true, 
            decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
                ),
                ),
            Row(
              children: <Widget>[
              Text(
              'Dont have an account?',
              style: TextStyle(color: Colors.black, fontSize: 10.0),
            ),
            Text(
              'Sign up',
              style: TextStyle(color: Colors.blue, fontSize: 10.0),
            )
              ]
            ),
            Spacer(),
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
                'Continue',
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
