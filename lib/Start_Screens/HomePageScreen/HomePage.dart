import 'package:employee_data/Start_Screens/CreateEmployeeScreen/CreateEmployee.dart';
import 'package:employee_data/Start_Screens/ShowDataScreen/ShowEmpData.dart';
import 'package:employee_data/constants.dart';
import 'package:flutter/material.dart';

import 'components/Body.dart';
class HomePage extends StatefulWidget {


  const HomePage({Key key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}
class _HomePage  extends State<HomePage>   {
  _onSelectItem(int index, String headerText) {
    setState(() {_selectedDrawerIndex = index; _headerText= headerText;});
    Navigator.of(context).pop(); // close the drawer
  }
  int _selectedDrawerIndex=2;
  String _headerText="Home";
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new CreateEmployee();
      case 1:
        return new ShowEmpData();
      default:
        return new Body();
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
body: _getDrawerItemWidget(_selectedDrawerIndex),
      appBar: AppBar(
backgroundColor: SecondaryColor,
title: Text(_headerText),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            DrawerHeader(

              decoration: BoxDecoration(
                color: SecondaryColor,

              ),

              child: Column(
                children:<Widget>[

                  CircleAvatar(
                backgroundColor: Colors.white,
                    radius: 30.0,

                child: Text(
                  "Z",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
                  SizedBox(height: size.height * 0.03),

                  Text(
                'Zylu Business Solutions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              ],
              ),

            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(' Home '),
              onTap: () => _onSelectItem(2,"Home"),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text(' Create Employee '),
              onTap: () => _onSelectItem(0, "Create Employee"),
            ),
            ListTile(
              leading: Icon(Icons.data_array),
              title: Text('Show Data'),
              onTap: () => _onSelectItem(1, "Show Data"),
            ),

          ],
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
  }


}