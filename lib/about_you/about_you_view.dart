import 'package:flutter/material.dart';
import 'package:satoshi_app/about_you/about_you_view_model.dart';
import 'package:provider/provider.dart';
import 'package:satoshi_app/plaid/plaid_view.dart';


class AboutYouView extends StatelessWidget {
const AboutYouView({super.key});

  @override
  Widget build(BuildContext context) {
    final aboutYouViewModel = Provider.of<AboutYouViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        surfaceTintColor: Colors.transparent,
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
              'About You',
              style: TextStyle(color: Colors.black, fontSize: 18.0,
              fontWeight: FontWeight.bold),
            ),
            Spacer()
            ]
              )
        
            )
           ,
           Padding(
              padding: EdgeInsets.only(left: 10.0, bottom: 20),
              child:
             
            Text('We need some basic details to open your toshí account.',
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            
           ),

              Expanded(
                child:
              
            ListView(
              children: [

               Padding(
              padding: EdgeInsets.only(left: 10.0, bottom: 10),
              child:
              Row (
                children: <Widget>[
                Text(
              'Personal Details',
              style: TextStyle(color: Colors.black, fontSize: 18.0,
              fontWeight: FontWeight.bold),
            ),
            Spacer()
            ]
              )
        
            )
           ,
          
 
            Column(children: [
            Padding(padding: EdgeInsets.only(left: 10),
           child:
           Row (
                children: <Widget>[
              const Icon(Icons.badge_rounded,
          color: Color.fromARGB(255, 91, 90, 90))
        ,
        Padding(padding: EdgeInsets.only(left: 10),
           child:
         SizedBox (
              width: 300,
              height: 50,
              child: 
           TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
            labelText: 'First and middle name(s)',
            border: InputBorder.none,
                ),
                ))),
          ]
                )
           ),
 Divider(
  color: Colors.grey, 
  thickness: 0.5, 
  indent: 20, 
)     
            ],),

                  Column(children: [
            Padding(padding: EdgeInsets.only(left: 10),
           child:
           Row (
                children: <Widget>[
              const Icon(Icons.badge_rounded,
          color: Color.fromARGB(255, 91, 90, 90))
        ,
        Padding(padding: EdgeInsets.only(left: 10),
           child:
         SizedBox (
              width: 300,
              height: 50,
              child: 
           TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
            labelText: 'Last name',
            border: InputBorder.none,
                ),
                ))),
          ]
                )
           ),
 Divider(
  color: Colors.grey,
  thickness: 0.5, 
  indent: 20, 
)     
            ],),

                  Column(children: [
            Padding(padding: EdgeInsets.only(left: 10),
           child:
           Row (
                children: <Widget>[
              const Icon(Icons.calendar_month_rounded,
          color: Color.fromARGB(255, 91, 90, 90))
        ,
        Padding(padding: EdgeInsets.only(left: 10),
           child:
         SizedBox (
              width: 300,
              height: 50,
              child: 
           TextField(
            controller: aboutYouViewModel.dobController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
            labelText: 'Date of birth',
            border: InputBorder.none,
                ),
                readOnly: true,
                onTap: () => aboutYouViewModel.selectDOB(context)
                ))),
          ]
                )
           ),
 Divider(
  color: Colors.grey, 
  thickness: 0.5,
  indent: 20,
)     
            ],),



             ],
            )
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 32.0, top: 20),
              child:
            SizedBox(
              width: 300,
              height: 50,
              child: 
              TextButton(
              onPressed: () {
                final profileSetup = aboutYouViewModel.profileCreated();
                if (profileSetup == true) {
                       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlaidView())
               );
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




// ADDITIONAL FIELDS



//                   Column(children: [
//             Padding(padding: EdgeInsets.only(left: 10),
//            child:
//            Row (
//                 children: <Widget>[
//               const Icon(Icons.language_rounded,
//           color: Color.fromARGB(255, 91, 90, 90))
//         ,
//         Padding(padding: EdgeInsets.only(left: 10),
//            child:
//          SizedBox (
//               width: 300,
//               height: 50,
//               child: 
//            TextField(
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//             labelText: 'Nationality',
//             border: InputBorder.none,
//                 ),
//                 ))),
//           ]
//                 )
//            ),
//  Divider(
//   color: Colors.grey,
//   thickness: 0.5, 
//   indent: 20,
// )     
//             ],),

//                   Column(children: [
//             Padding(padding: EdgeInsets.only(left: 10),
//            child:
//            Row (
//                 children: <Widget>[
//               const Icon(Icons.house_rounded,
//           color: Color.fromARGB(255, 91, 90, 90))
//         ,
//         Padding(padding: EdgeInsets.only(left: 10),
//            child:
//          SizedBox (
//               width: 300,
//               height: 50,
//               child: 
//            TextField(
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//             labelText: 'Country of residence',
//             border: InputBorder.none,
//                 ),
//                 ))),
//           ]
//                 )
//            ),
//  Divider(
//   color: Colors.grey,
//   thickness: 0.5,
//   indent: 20, 
// )     
//             ],),

//                   Column(children: [
//             Padding(padding: EdgeInsets.only(left: 10),
//            child:
//            Row (
//                 children: <Widget>[
//               const Icon(Icons.edit_document,
//           color: Color.fromARGB(255, 91, 90, 90))
//         ,
//         Padding(padding: EdgeInsets.only(left: 10),
//            child:
//          SizedBox (
//               width: 300,
//               height: 50,
//               child: 
//            TextField(
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//             labelText: 'I am not a US citizen',
//             border: InputBorder.none,
//                 ),
//                 ))),
//           ]
//                 )
//            ),
//  Divider(
//   color: Colors.grey,
//   thickness: 0.5,
//   indent: 20, 
// )     
//             ],),

//                Padding(
//               padding: EdgeInsets.only(left: 10.0, bottom: 10, top: 15.0),
//               child:
//               Row (
//                 children: <Widget>[
//                 Text(
//               'Address',
//               style: TextStyle(color: Colors.black, fontSize: 18.0,
//               fontWeight: FontWeight.bold),
//             ),
//             Spacer()
//             ]
//               )
        
//             )
//            ,
          
 
//             Column(children: [
//             Padding(padding: EdgeInsets.only(left: 10),
//            child:
//            Row (
//                 children: <Widget>[
//               const Icon(Icons.home_rounded,
//           color: Color.fromARGB(255, 91, 90, 90))
//         ,
//         Padding(padding: EdgeInsets.only(left: 10),
//            child:
//          SizedBox (
//               width: 300,
//               height: 50,
//               child: 
//            TextField(
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//             labelText: 'Address line 1',
//             border: InputBorder.none,
//                 ),
//                 ))),
//           ]
//                 )
//            ),
//  Divider(
//   color: Colors.grey, 
//   thickness: 0.5,
//   indent: 20,
// )     
//             ],),

//                   Column(children: [
//             Padding(padding: EdgeInsets.only(left: 10),
//            child:
//            Row (
//                 children: <Widget>[
//               const Icon(Icons.home_rounded,
//           color: Color.fromARGB(255, 91, 90, 90))
//         ,
//         Padding(padding: EdgeInsets.only(left: 10),
//            child:
//          SizedBox (
//               width: 300,
//               height: 50,
//               child: 
//            TextField(
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//             labelText: 'Address line 2',
//             border: InputBorder.none,
//                 ),
//                 ))),
//           ]
//                 )
//            ),
//  Divider(
//   color: Colors.grey,
//   thickness: 0.5,
//   indent: 20, 
// )     
//             ],),

//                   Column(children: [
//             Padding(padding: EdgeInsets.only(left: 10),
//            child:
//            Row (
//                 children: <Widget>[
//               const Icon(Icons.location_city_rounded,
//           color: Color.fromARGB(255, 91, 90, 90))
//         ,
//         Padding(padding: EdgeInsets.only(left: 10),
//            child:
//          SizedBox (
//               width: 300,
//               height: 50,
//               child: 
//            TextField(
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//             labelText: 'City',
//             border: InputBorder.none,
//                 ),
//                 ))),
//           ]
//                 )
//            ),
//  Divider(
//   color: Colors.grey, 
//   thickness: 0.5, 
//   indent: 20, 
// )     
//             ],),

//                   Column(children: [
//             Padding(padding: EdgeInsets.only(left: 10),
//            child:
//            Row (
//                 children: <Widget>[
//               const Icon(Icons.apartment_rounded,
//           color: Color.fromARGB(255, 91, 90, 90))
//         ,
//         Padding(padding: EdgeInsets.only(left: 10),
//            child:
//          SizedBox (
//               width: 300,
//               height: 50,
//               child: 
//            TextField(
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//             labelText: 'County',
//             border: InputBorder.none,
//                 ),
//                 ))),
//           ]
//                 )
//            ),
//  Divider(
//   color: Colors.grey, // Set the color
//   thickness: 0.5, // Set the thickness
//   indent: 20, // Optional: space from the left // Optional: space from the right
// )     
//             ],),

//                   Column(children: [
//             Padding(padding: EdgeInsets.only(left: 10),
//            child:
//            Row (
//                 children: <Widget>[
//               const Icon(Icons.mail_rounded,
//           color: Color.fromARGB(255, 91, 90, 90))
//         ,
//         Padding(padding: EdgeInsets.only(left: 10),
//            child:
//          SizedBox (
//               width: 300,
//               height: 50,
//               child: 
//            TextField(
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//             labelText: 'Postcode',
//             border: InputBorder.none,
//                 ),
//                 ))),
//           ]
//                 )
//            ),
//  Divider(
//   color: Colors.grey, // Set the color
//   thickness: 0.5, // Set the thickness
//   indent: 20, // Optional: space from the left // Optional: space from the right
// )     
//             ],),

             