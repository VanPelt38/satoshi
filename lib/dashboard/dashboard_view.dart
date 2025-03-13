import 'package:flutter/material.dart';
import 'package:satoshi_app/dashboard/dashboard_view_model.dart';
import 'package:satoshi_app/login/login_view.dart';
import 'package:satoshi_app/signup/signup_view.dart';
import 'package:provider/provider.dart';


class DashboardView extends StatelessWidget {
const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardViewModel = Provider.of<DashboardViewModel>(context);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      dashboardViewModel.getCurrentBitcoinPrice();
    }
      
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
              "Welcome, Jake",
              style: TextStyle(color: Colors.black, fontSize: 18.0,
              fontWeight: FontWeight.bold)
          ),
        ),
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        actions: [
          IconButton(onPressed: () {
        // Navigate to profile
        }
        , icon: const Icon(
          Icons.account_circle_rounded,
          color: Color.fromARGB(255, 243, 75, 115)
        )
        ),
        ],
        
      ),
      backgroundColor: Color.fromARGB(255, 240, 238, 238),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(10.0),
              child:
            SizedBox(
              height: 300,
              child: 
              TextButton(
              onPressed: () {
               // Graph open
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 243, 75, 115),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
              child:
              Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              Padding(
              padding: EdgeInsets.only(top: 10.0),
              child:
Text(
                'Your investment',
              style: TextStyle(color: Colors.white,
              fontSize: 18.0
              ),
              ),
              ),

              Spacer()
            ],),
            Spacer(),
            Container(
  width: 330,  // Set width
  height: 220, // Set height
  decoration: BoxDecoration(
    color: Colors.white, // Set background color
    borderRadius: BorderRadius.circular(8), // Optional: rounded corners
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 5,
        offset: Offset(0, 3), // Shadow position
      ),
    ],
  ),
  child: Center(
    child: Text(
      "Investment Graph",
      style: TextStyle(color: Colors.black, fontSize: 16),
    ),
  ),
),
Spacer()
          ])
              
            )
            ),
            ),

Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child:
         

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[

                 // Balance Tile
              
                            Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child:
              Material(
                elevation: 6,
                shadowColor: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
                child:
            SizedBox(
              width: 180,
              height: 180,
              child: 
              TextButton(
              onPressed: () {
               // Graph open
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
              child:

Stack(
  children: [



              Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              Padding(
              padding: EdgeInsets.only(top: 10.0),
              child:
Text(
                'Your balance',
              style: TextStyle(color: Colors.black,
              fontSize: 18.0
              ),
              ),
              ),

              Spacer()
            ],),
            Spacer()
          
          ]), 

Align(
  alignment: Alignment.center,
  child: Text(
              "£1,983",
              style: TextStyle(color: Colors.black, fontSize: 25.0,
              fontWeight: FontWeight.bold)
          ),
)
  
  ],
)
              
            ))
            ),
            ),

          // Bitcoin

            Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child:
              Material(
                elevation: 6,
                shadowColor: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
                child:
            SizedBox(
              width: 180,
              height: 180,
              child: 
              TextButton(
              onPressed: () {
               // Graph open
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
              child:
Stack(
  children: [



              Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              Padding(
              padding: EdgeInsets.only(top: 10.0),
              child:
Text(
                'Bitcoin price',
              style: TextStyle(color: Colors.black,
              fontSize: 18.0
              ),
              ),
              ),

              Spacer()
            ],),
            Spacer()
          
          ]), 

Align(
  alignment: Alignment.center,
  child: Text(
              '£${dashboardViewModel.bitcoinPrice?.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.black, fontSize: 25.0,
              fontWeight: FontWeight.bold)
          ),
)
  
  ],
) 
            )
            )),
            )
            ]),
        ),
             Spacer()
            ]),
        ),
      floatingActionButton: null
      );}
}
