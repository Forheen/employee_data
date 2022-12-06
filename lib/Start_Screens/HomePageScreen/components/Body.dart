import 'package:employee_data/constants.dart';
import 'package:flutter/material.dart';


class _BodyState extends State<Body>  {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: MediaQuery.of(context).size.height,

        decoration:  const BoxDecoration(


            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [ PrimaryColor, SecondaryColor]
            )
        ),      width: size.width,

        child:

            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10,20.0,0),
              child: Column(
                  mainAxisSize: MainAxisSize.max,

                children:<Widget>[
                  SizedBox(height: size.height * 0.07),


                Text(
                      "Welcome to",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white, fontSize: 30),
                    ),
              Text(
                      "Employee Database",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 30),
                    ),

                  SizedBox(height: size.height * 0.02),

                     Text(
                      "Hey there! This is the employee database for Zylu Business Solutions. You can register employee data through the Create Employee screen available in the SideBar and all the employee data related to this company is being displayed in the Show Database screen. Kudos ! This survey is going on for the best Employee award.",
                      style: TextStyle(color: Colors.white54,fontWeight: FontWeight.bold, fontSize: 14),
                      textAlign: TextAlign.center,

                  ),
            ]
            ),
            ),



    );
  }
}
/// This is the stateful widget that the main application instantiates.
class Body extends StatefulWidget {


  const Body({Key key,}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}