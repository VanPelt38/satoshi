import 'package:flutter/material.dart';
import 'package:satoshi_app/login/login_view_model.dart';
import 'package:satoshi_app/signup/signup_view.dart';
import 'package:satoshi_app/dashboard/dashboard_view.dart';
import 'package:provider/provider.dart';


class LoginView extends StatelessWidget {
const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        leading: IconButton(onPressed: () {
         Navigator.pop(context);
        }
        , icon: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 243, 75, 115)
        )
        ),
      ),
      backgroundColor: Color.fromARGB(255, 240, 238, 238),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0, bottom: 10),
              child:
              Row (
                children: <Widget>[
                Text(
              'Log in',
              style: TextStyle(color: Colors.black, fontSize: 18.0,
              fontWeight: FontWeight.bold),
            ),
            Spacer()
            ]
              )
        
            )
           ,
           Padding(
              padding: EdgeInsets.only(left: 10.0, bottom: 10),
              child:
            Text(
              'Enter the email address that you used to sign up to Satoshi',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
           ),
           Padding(padding: EdgeInsets.only(bottom: 10),
           child:
           TextField(
            keyboardType: TextInputType.emailAddress,
            controller: loginViewModel.emailController,
            decoration: const InputDecoration(
            labelText: 'Your email address',
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white
                ),
                )
           )
            ,
                            TextField(
            keyboardType: TextInputType.emailAddress,
            controller: loginViewModel.passwordController,
            obscureText: true, 
            decoration: const InputDecoration(
            labelText: 'Your password',
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white
                ),
                ),
                Padding(
              padding: EdgeInsets.all(10.0),
              child:
            Row(
              children: <Widget>[
                  Padding(
              padding: EdgeInsets.only(right: 5),
              child:
              Text(
              'Dont have an account?',
              style: TextStyle(color: Colors.black, fontSize: 10.0),
            )),
                          TextButton(
              onPressed: () {
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupView())
               );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero
              ),
              child:
              Text(
                'Sign up',
              style: TextStyle(color: const Color.fromARGB(255, 42, 32, 244),
              fontSize: 10.0
              ),
              )
            )
              ]
            )),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child:
            SizedBox(
              width: 300,
              height: 50,
              child: 
              TextButton(
              onPressed: () async {
                 bool signInSuccessful = await loginViewModel.signIn();
                if (signInSuccessful) {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardView())
               );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Uh-oh - there was a problem signing in. Please try again."),
                    backgroundColor: const Color.fromARGB(255, 176, 35, 25),
                    ));
                }
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
