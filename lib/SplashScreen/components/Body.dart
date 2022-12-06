import 'package:employee_data/Components/CustomPageRoute.dart';
import 'package:employee_data/SplashScreen/components/background.dart';
import 'package:employee_data/Start_Screens/HomePageScreen/HomePage.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});

    Navigator.pushReplacement(context, CustomPageRoute(child: HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset(
                "./assets/images/logosmall.png",
                height: 200,
                width: 200,
              ),
            ),
/*
      Text(
        "Viocity Buildings",
        style: TextStyle( fontWeight: FontWeight.bold,color: Colors.white,fontSize: 14),
      ),

      Text(
        "App",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,
            fontSize: 14,
        height: 2),
      ),
*/
          ],
        ),
      ),
    );
  }
}
