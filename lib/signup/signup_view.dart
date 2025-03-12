import 'package:flutter/material.dart';
import 'package:satoshi_app/signup/signup_view_model.dart';
import 'package:satoshi_app/about_you/about_you_view.dart';
import 'package:provider/provider.dart';


class SignupView extends StatelessWidget {
const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final signupViewModel = Provider.of<SignupViewModel>(context);

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
              'Enter your email',
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
              Row (
                children: <Widget>[
            Text('Well use this to contact you about your account.',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            Spacer()
            ]),
           ),
           Padding(padding: EdgeInsets.only(bottom: 10),
           child:
           TextField(
            keyboardType: TextInputType.emailAddress,
            controller: signupViewModel.emailController,
            decoration: const InputDecoration(
            labelText: 'Email address',
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white
                ),
                )
           )
            ,
                            TextField(
            keyboardType: TextInputType.emailAddress,
            controller: signupViewModel.passwordController,
            obscureText: true, 
            decoration: const InputDecoration(
            labelText: 'Password',
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white
                ),
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
              onPressed: () async {
                bool signUpSuccessful = await signupViewModel.signUp();
                if (signUpSuccessful) {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutYouView())
               );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Uh-oh - there was a problem signing up. Please try again."),
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