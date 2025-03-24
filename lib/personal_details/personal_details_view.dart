import 'package:flutter/material.dart';
import 'package:satoshi_app/personal_details/personal_details_view_model.dart';
import 'package:provider/provider.dart';


class PersonalDetailsView extends StatelessWidget {
const PersonalDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final personalDetailsViewModel = Provider.of<PersonalDetailsViewModel>(context);


    WidgetsBinding.instance?.addPostFrameCallback((_) {
      personalDetailsViewModel.getUserDetails();
    });
      

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
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
              'Your details',
              style: TextStyle(color: Colors.black, fontSize: 18.0,
              fontWeight: FontWeight.bold),
            ),
            Spacer()
            ]
              )
        
            )
           ,

           
           TextField(
            controller: personalDetailsViewModel.firstNamesController,
            decoration: const InputDecoration(
            labelText: 'First name(s)',
            enabled: false,
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5)
            ),
            filled: true,
            fillColor: Colors.white
                ),
                ),

                            TextField(
            controller: personalDetailsViewModel.lastNameController,
            decoration: const InputDecoration(
            labelText: 'Last name',
            enabled: false,
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5)
            ),
            filled: true,
            fillColor: Colors.white
                ),
                ),

                                            TextField(
            controller: personalDetailsViewModel.dobController,
            decoration: const InputDecoration(
            labelText: 'Date of birth',
            enabled: false,
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white
                ),
                ),

          ],
        ),
      ),
      floatingActionButton: null,
    );
  }
}
