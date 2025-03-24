import 'package:flutter/material.dart';
import 'package:satoshi_app/your_info/your_info_view_model.dart';
import 'package:provider/provider.dart';
import 'package:satoshi_app/personal_details/personal_details_view.dart';


class YourInfoView extends StatelessWidget {
const YourInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final yourInfoViewModel = Provider.of<YourInfoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        surfaceTintColor: Colors.transparent,
        leading: IconButton(onPressed: () {
         Navigator.pop(context);
        }
        , icon: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 72, 1, 18)
        )
        ),
      ),
      backgroundColor: Color.fromARGB(255, 240, 238, 238),
      body: 
      Stack(children: [

     
      Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[


              Expanded(
                child:
              
            ListView(
              children: [

          
 
            Column(children: [
            Padding(padding: EdgeInsets.only(left: 10),
           child:
           Row (
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 75, 115),
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: 
                      Icon(Icons.person_2_outlined,
                     size: 18,
          color: Color.fromARGB(255, 72, 1, 18))
                    )
                  )
              
        ,
        Padding(padding: EdgeInsets.only(left: 10),
           child:
             Text(
              'Your details',
              style: TextStyle(color: Colors.black, fontSize: 16.0
              ),
            ),
            
                ),
                Spacer(),
                  IconButton(onPressed: () {
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonalDetailsView())
               );
        }
        , icon: const Icon(
          Icons.chevron_right,
          color: Color.fromARGB(255, 72, 1, 18),
          size: 30
        )
        ),
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
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 75, 115),
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: 
                      Icon(Icons.money_outlined,
                     size: 18,
          color: Color.fromARGB(255, 72, 1, 18))
                    )
                  )
              
        ,
        Padding(padding: EdgeInsets.only(left: 10),
           child:
             Text(
              'Your accounts',
              style: TextStyle(color: Colors.black, fontSize: 16.0
              ),
            ),
            
                ),
                Spacer(),
                  IconButton(onPressed: () {
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YourInfoView()),
                    );
        }
        , icon: const Icon(
          Icons.chevron_right,
          color: Color.fromARGB(255, 72, 1, 18),
          size: 30
        )
        ),
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
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 75, 115),
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: 
                      Icon(Icons.info_outline_rounded,
                     size: 18,
          color: Color.fromARGB(255, 72, 1, 18))
                    )
                  )
              
        ,
        Padding(padding: EdgeInsets.only(left: 10),
           child:
             Text(
              'toshí support',
              style: TextStyle(color: Colors.black, fontSize: 16.0
              ),
            ),
            
                ),
                Spacer(),
                  IconButton(onPressed: () {
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YourInfoView()),
                    );
        }
        , icon: const Icon(
          Icons.chevron_right,
          color: Color.fromARGB(255, 72, 1, 18),
          size: 30
        )
        ),
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
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 75, 115),
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: 
                      Icon(Icons.logout_outlined,
                     size: 18,
          color: Color.fromARGB(255, 72, 1, 18))
                    )
                  )
              
        ,
        Padding(padding: EdgeInsets.only(left: 10),
           child:
             Text(
              'Log out',
              style: TextStyle(color: Colors.black, fontSize: 16.0
              ),
            ),
            
                ),
                Spacer(),
                  IconButton(onPressed: () {
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YourInfoView()),
                    );
        }
        , icon: const Icon(
          Icons.chevron_right,
          color: Color.fromARGB(255, 72, 1, 18),
          size: 30
        )
        ),
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
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 75, 115),
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: 
                      Icon(Icons.close_outlined,
                     size: 18,
          color: Color.fromARGB(255, 72, 1, 18))
                    )
                  )
              
        ,
        Padding(padding: EdgeInsets.only(left: 10),
           child:
             Text(
              'Close account',
              style: TextStyle(color: Colors.black, fontSize: 16.0
              ),
            ),
            
                ),
                Spacer(),
                  IconButton(onPressed: () {
        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YourInfoView()),
                    );
        }
        , icon: const Icon(
          Icons.chevron_right,
          color: Color.fromARGB(255, 72, 1, 18),
          size: 30
        )
        ),
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

          ],
        ),
      ),
  
       ]),
      floatingActionButton: null,
    );
  }
}