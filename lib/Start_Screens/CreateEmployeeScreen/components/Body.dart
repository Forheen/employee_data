import 'package:employee_data/Components/input_field_design.dart';
import 'package:employee_data/Components/square_button.dart';
import 'package:employee_data/Start_Screens/CreateEmployeeScreen/model/employeeCreate.dart';

import 'package:employee_data/constants.dart';
import 'package:flutter/material.dart';
import 'package:employee_data/api_connection/api_connection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class _BodyState extends State<Body>  {
    TextEditingController controller1,controller2,controller3,controller4,controller6,controller7;
    bool descriptionIncorrect=false;
    String FirstName="", MiddleName="", LastName="",Preferred_Name="", Gender="",email="",doj="";
    // Initial Selected Value
    String dropdownvalue = 'M';
    // List of items in our dropdown menu
    var items = [
      'M',
      'F',
      'NA',
      ];
  @override
  void initState() {
    Gender=dropdownvalue;
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    controller6 = TextEditingController();
    controller7 = TextEditingController();

  }

  @override
  void dispose() {
    controller1?.dispose();
    controller2?.dispose();
    controller3?.dispose();
    controller4?.dispose();
    controller6?.dispose();
    controller7?.dispose();

    super.dispose();
  }
sendData() async{

    EmployeeData employeeDataModel= EmployeeData(FirstName, MiddleName, LastName, Preferred_Name, Gender, email, doj);
    try{
      var res = await http.post(
        Uri.parse(API.create),
        body: employeeDataModel.toJson(),
      );
      print("sending details: "+ employeeDataModel.toJson().toString());
      if(res.statusCode == 200){
        var resBody = jsonDecode(res.body);
        if(resBody['success']){
          Fluttertoast.showToast(msg: "Successfully created");
          controller1.clear();
          controller2.clear();
          controller3.clear();
          controller4.clear();
          controller6.clear();
          controller7.clear();
          FirstName="";
          MiddleName="";
          LastName="";
          Preferred_Name="";
          Gender="";
          email="";
          doj="";


        }else{
          Fluttertoast.showToast(msg: "Try again");

        }
      }
    }
    catch(e){
      print("Json create Data error : "+ e.toString());
      Fluttertoast.showToast(msg: "Error : Form could not be submitted");
    }
}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child:SizedBox(
          width: size.width,

        child: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //  crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children:  <Widget>[

            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10,20.0,0),
              child: Column(


                children:<Widget>[

                  SizedBox(height: size.height * 0.03),

                  Align(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      "Employee",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 14),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      "Registration Form",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:    Text(
                      "Just enter the details of the employee",
                      style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),

                  SizedBox(height: size.height * 0.05),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:    Text(
                      "First Name",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 14),

                    ),
                  ),
                  InputFieldDesign(
                    controller:controller1,

                    onChanged : (String value) {
                        FirstName = '$value';


                    },
                    hintText: "Enter Your First Name",
                    inputType: TextInputType.text,
                  ),

                  SizedBox(height: size.height * 0.03),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:    Text(
                      "Middle Name",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 14),

                    ),
                  ),
                  InputFieldDesign(
                      controller:controller2,

                      onChanged : (String value) async {
                        MiddleName = '$value';
                      },
                      hintText: "Enter Your Middle Name",
                      inputType: TextInputType.text,
                  ),

                  SizedBox(height: size.height * 0.03),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:    Text(
                      "Last Name",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 14),

                    ),
                  ),
                  InputFieldDesign(
                      controller:controller3,

                      onChanged : (String value) async {
                        LastName = '$value';
                      },
                      hintText: "Enter Your Last Name",
                      inputType: TextInputType.text
                  ),

                  SizedBox(height: size.height * 0.03),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:    Text(
                      "Preferred Name",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 14),

                    ),
                  ),
                  InputFieldDesign(
                      controller:controller4,

                      onChanged : (String value) async {
                        Preferred_Name = '$value';

                      },
                      hintText: "Enter Your Preferred Name",
                      inputType: TextInputType.text,
                    errorText:
                    descriptionIncorrect ? 'Description cannot be empty'
                    : null,                 ),
                  SizedBox(height: size.height * 0.03),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:    Text(
                      "Gender",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 14),

                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:

                  DropdownButton<String>(

                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),

                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownvalue = newValue;
                        Gender = '$newValue';

                      });
                    },
                  ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:    Text(
                      "email",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 14),

                    ),
                  ),
                  InputFieldDesign(
                      controller:controller6,

                      onChanged : (String value) async {
                        email = '$value';
                      },
                      hintText: "Enter Your email",
                      inputType: TextInputType.text
                  ),
                  SizedBox(height: size.height * 0.03),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:    Text(
                      "Date of Joining",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 14),

                    ),
                  ),

                TextField(
controller: controller7,

                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    hintText: "yyyy-mm-dd",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: SecondaryColor),
                    ),
                  ),
                  onTap: () async{

                    final DateTime pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate:DateTime(1900), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime.now(),

                    );

                      if(pickedDate != null ){
                        print(pickedDate);
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                        print(formattedDate);

                        setState(() {
                          controller7.text = formattedDate;
                          doj = '$formattedDate';
                        });
                      }else{
                        Fluttertoast.showToast(msg : "Date is not selected");
                      }

                  },
                  readOnly: true,
                  style: TextStyle(color: Colors.black),

                ),
                  SizedBox(height: size.height * 0.03),



                ],

              ),
            ),

            SquareButton(

                text: "Create",
                press: () {

                  if(validateEntry(FirstName,MiddleName,LastName,Preferred_Name,Gender,email,doj)) {

                    sendData();
                  }
                }),


          ],
        ),
      ),
    );
  }
    bool validateEntry(
        String FirstName,
        MiddleName,
        LastName,
        Preferred_Name,
        Gender,
        email,
        doj){
      if(FirstName.isEmpty) {
        Fluttertoast.showToast(msg: "Enter First Name");

        return false;
      }
      if(LastName.isEmpty) {
        Fluttertoast.showToast(msg: "Enter Last Name");
      return false;}
        if(Preferred_Name.isEmpty) {
          Fluttertoast.showToast(msg: "Enter Preferred Name");

          return false;
        }
        if(Gender.isEmpty) {
          Fluttertoast.showToast(msg: "Define Gender");

          return false;
        }
        if(email.isEmpty) {
          Fluttertoast.showToast(msg: "Enter email");

          return false;
        }else{
          bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
          if(emailValid==false){
            Fluttertoast.showToast(msg: "Enter valid email");

            return false;

          }

        }
          if(doj.isEmpty)  {
            Fluttertoast.showToast(msg: "Enter Date of Joining");

            return false;}
        return true;
      }


}


/// This is the stateful widget that the main application instantiates.
class Body extends StatefulWidget {


  const Body({Key key,}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}