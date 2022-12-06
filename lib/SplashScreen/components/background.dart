import 'package:flutter/material.dart';
import 'package:employee_data/constants.dart';
class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key ,
     this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(


        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [PrimaryColor, SecondaryColor]
        )
      ),
      width: size.width,
      height:size.height,
           // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(

        alignment: Alignment.center,

        children: <Widget>[

          Positioned(
           bottom: 40,

            child: Text(

              "Zylu Business Solutions",
              style: TextStyle(color: Colors.white,fontSize: 10,
                  height: 2),
            ),
          ),
          Positioned(
            bottom: 20,

            child: Text(

              "v-0.1  Developed by Forheen Ahmed",
              style: TextStyle(color: Colors.white,fontSize: 10,
                  height: 2),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

