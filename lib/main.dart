import 'package:flutter/material.dart';
import 'package:employee_data/SplashScreen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Data',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Splash(),
      debugShowCheckedModeBanner: false,

    );
  }
}
