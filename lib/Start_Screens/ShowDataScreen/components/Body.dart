
import 'package:employee_data/Start_Screens/ShowDataScreen/model/employeeShow.dart';
import 'package:flutter/material.dart';
import 'package:employee_data/api_connection/api_connection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class _BodyState extends State<Body> {
  TextEditingController controller1, controller2, controller3, controller4,
      controller5, controller6, controller7;
  List<EmployeeShow> users = [];

  List<EmployeeShow> usersFiltered = [];
  final date2 = DateTime.now();
  int selectedData=null;

  TextEditingController controller = TextEditingController();
  String _searchResult = '';

  double daysBetween(String from) {

    DateTime dt2 = DateTime.parse(from);
    DateTime dt1 = date2;
    Duration diff = dt1.difference(dt2);

  return (diff.inDays / 365);

}

  @override
  void initState() {
    super.initState();
    getData();

    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    controller5 = TextEditingController();
    controller6 = TextEditingController();
    controller7 = TextEditingController();
  }

  @override
  void dispose() {
    controller1?.dispose();
    controller2?.dispose();
    controller3?.dispose();
    controller4?.dispose();
    controller5?.dispose();
    controller6?.dispose();
    controller7?.dispose();

    super.dispose();
  }

  List data;

  Future<String> getData() async {
    try {
      var res = await http.get(
        Uri.parse(API.fetch),
      );
      setState(() {
        data = jsonDecode(res.body);


      for(int i=0;i<data.length;i++) {

        users.add(EmployeeShow(
            ID: data[i]["emp_id"],
            FirstName : data[i]["first_name"],
            LastName :data[i]["last_name"],
            MiddleName: data[i]["middle_name"],
            Preferred_Name : data[i]["preferred_name"],
            Gender: data[i]["gender"],
            email : data[i]["email"],
            doj : data[i]["date_of_joining"]));

      }
      });
      usersFiltered=users;
      //print("Json getData :" + jsonDecode(res.body).toString());


    }
    catch (e) {
      Fluttertoast.showToast(msg: "Couldn't fetch Data");

      //print("Json getData error : " + e.toString());
    }
  }
  final dataKey =  GlobalKey();

  @override
  Widget build(BuildContext context) {
    //print("selected index for "+ selectedData.toString());

    return Scaffold(
        body : SingleChildScrollView(


    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,

      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
key:               dataKey,

              child: ListTile(

                leading: const Icon(Icons.search),
                title: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: (value) {
                      setState(() {
                        selectedData =null;
                        _searchResult = value;
                        usersFiltered = users.where((user) => user.Preferred_Name.contains(_searchResult)).toList();
                      });
                    }),
                trailing:  IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      controller.clear();
                      _searchResult = '';
                      usersFiltered=users;
                      selectedData=null;
                    });
                  },
                ),
              ),
            ),
        ),
        usersFiltered.isNotEmpty && selectedData!= null ?  Card(

          elevation: 50,
          shadowColor: Colors.black,
          color: Colors.greenAccent[100],
          child: SizedBox(
            width: 300,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                      backgroundColor: Colors.white,
                      child: Text(
                        "Z",
                        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ), //CircleAvatar
                  const SizedBox(
                    height: 20,
                  ),
              Text(
                "Working Since Last",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.green[900],
                )
              ),//

                         Text(
                           daysBetween(usersFiltered[selectedData].doj).toInt().toString()+" years ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green[900],
                      fontWeight: FontWeight.w500,
                    ), //Textstyle
                  ), //Text
                  const SizedBox(
                    height: 10,
                  ),

                   Text(

                     "ID  :  "+ usersFiltered[selectedData].ID,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ),
                     //Textstyle
                  ),
                  Text(
                    "First Name  :  "+ usersFiltered[selectedData].FirstName,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ), //Textstyle
                  ),
                  Text(
                    "Middle Name  :  "+ usersFiltered[selectedData].MiddleName.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ), //Textstyle
                  ),
                  Text(
                    "Last Name  :  "+ usersFiltered[selectedData].LastName.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ), //Textstyle
                  ),
                  Text(
                    "Preferred Name  :  "+ usersFiltered[selectedData].Preferred_Name.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ), //Textstyle
                  ),
                  Text(
                    "Gender  :  "+ usersFiltered[selectedData].Gender.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ), //Textstyle
                  ),
                  Text(
                    "Email  :  "+ usersFiltered[selectedData].email.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ), //Textstyle
                  ),
                  Text(
                    "Joining Date  :  "+ usersFiltered[selectedData].doj.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                    ), //Textstyle
                  ),
                  //SizedBox
                   //SizedBox
                ],
              ), //Column
            ), //Padding
          ), //SizedBox
        ) :         const SizedBox(height: 20.00),

        const SizedBox(height: 30.00),

        DataTable(
          headingTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
          headingRowColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.black
          ),
       dividerThickness: 0.00,
    showBottomBorder: true,
       //   headingRowColor:           MaterialStateColor.resolveWith((states) => Yellow) ,
          columns: const <DataColumn>[
            DataColumn(

              label: Text(
                'ID',

              ),
            ) ,
            DataColumn(

              label: Text(
                'Name',

              ),
            ),
            DataColumn(
              label: Text(
                'Start Date',

              ),
            ),
            DataColumn(
              label: Text(
                'Since',

              ),
            ),
          ],
          rows:


          List.generate(usersFiltered == null ? 0 : usersFiltered.length, (index) =>


          DataRow(
            onLongPress: (){

              setState(() {
                selectedData=index;
                //print("selected index "+ selectedData.toString());
                Fluttertoast.showToast(msg: "ID no. "+usersFiltered[index].ID +" selected! Details are in the card above");
                Scrollable.ensureVisible(dataKey.currentContext);
              });
            },

        color:MaterialStateColor.resolveWith((states) => daysBetween(usersFiltered[index].doj) > 5.0 ? Colors.green : Colors.white) ,
                cells: <DataCell>[
                  DataCell(Text(usersFiltered[index].ID)),

                  DataCell(Text(usersFiltered[index].Preferred_Name)),
                  DataCell(Text(usersFiltered[index].doj)),
                 DataCell(Text(daysBetween(usersFiltered[index].doj).toInt().toString() +" years ")),
                ],
              ),
          ),
        ),

        // Expanded(
        //   child: ListView.builder(
        //       shrinkWrap: true,
        //       itemCount: data == null ? 0 : data.length,
        //
        //       itemBuilder: (context, index) {
        //         double years= daysBetween(data[index]["date_of_joining"]);
        //
        //         return Card(
        //           margin: new EdgeInsets.symmetric(
        //               horizontal: 10.0, vertical: 6.0),
        //           elevation: 8.0,
        //           child: Container(
        //               decoration: BoxDecoration(
        //                   color:  years > 5.0 ? Colors.green : Color.fromRGBO(64, 75, 96, .9)) ,
        //               child: ListTile(
        //                   contentPadding: EdgeInsets.symmetric(
        //                       horizontal: 20.0, vertical: 10.0),
        //                   leading: Container(
        //                     padding: EdgeInsets.only(right: 12.0),
        //                     decoration: const BoxDecoration(
        //                         border: Border(
        //                             right: BorderSide(
        //                                 width:1.0, color: Colors.white24))),
        //                     child: Icon(Icons.supervised_user_circle, color: Colors.white,size: 50.0,),
        //                   ),
        //                   title: Text(
        //                     data[index]["preferred_name"],
        //                     style: TextStyle(color: Colors.black,
        //                         fontWeight: FontWeight.bold),
        //                   ),
        //                   // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
        //
        //                   subtitle: Row(
        //                     children: <Widget>[
        //
        //                       Text(years.toInt().toString() +" years ", style: TextStyle(
        //                           color: Colors.white)),
        //                       Text(data[index]["date_of_joining"], style: TextStyle(
        //                           color: Colors.white))
        //                     ],
        //                   ),
        //                   trailing:
        //                   Icon(Icons.keyboard_arrow_right, color: Colors.white,
        //                       size: 30.0)
        //               ),
        //
        //
        //           ),
        //         );
        //       }),
        // )
      ],
    ),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_upward),
        onPressed: () => Scrollable.ensureVisible(dataKey.currentContext),
      ),

    );
  }
}

  //Text(data[index]["last_name"]),
/// This is the stateful widget that the main application instantiates.
class Body extends StatefulWidget {


  const Body({Key key,}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}