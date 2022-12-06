
import 'package:flutter/material.dart';
import 'package:employee_data/constants.dart';
class InputFieldDesign extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String errorText;
  final TextInputType inputType;
  const InputFieldDesign({
    Key key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.inputType,
    this.errorText,
  }) : super(key: key);


  @override
  State<InputFieldDesign> createState() => _InputFieldDesign(this.controller,
      this.hintText,
      this.onChanged,
      this.inputType,
      this.errorText,
  );


}
class _InputFieldDesign extends State<InputFieldDesign>{


  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final String errorText;
  final TextInputType inputType;
  _InputFieldDesign(
    this.controller,
    this.hintText,
    this.onChanged,
    this.inputType,
    this.errorText);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,

      controller: controller,
      onChanged: onChanged,
      cursorColor: SecondaryColor,
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: SecondaryColor),
        ),
      ),
      keyboardType: inputType,

      style: TextStyle(color: Colors.black),

    );
  }
}

