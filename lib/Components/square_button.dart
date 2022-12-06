import 'package:flutter/material.dart';
import 'package:employee_data/constants.dart';

class SquareButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const SquareButton({
     Key key,
      this.text,
      this.press,
    this.color = Yellow,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,

      child: newElevatedButton(),

    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),

      ),
      onPressed: press,

      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),

          textStyle: TextStyle(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),

    );
  }
}
