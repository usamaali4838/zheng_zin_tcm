import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zheng_zin_tcm/row_table.dart';

import 'constants.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // String dropDownValue = 'Date';
  String datee = 'select date';
  String messueDate = 'select date';
  List<DataColumn> items = [
    // DataColumn(
    //   label: Text('Select'),
    //   //size: ColumnSize.L,
    // ),
    DataColumn(
      label: Text('Name'),
    ),
    DataColumn(
      label: Text('Phone Number'),
    ),
    DataColumn(
      label: Text('No. of People'),
    ),
  ];
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _rowsPerPage1 = PaginatedDataTable.defaultRowsPerPage;
  final TextEditingController _numberOfPeopleController =
      TextEditingController();
  final TextEditingController _notificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _appointments = FirebaseFirestore.instance.collection('appointments');
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    List<DataRow> dataRow = [];
    // var dts = DTS();
    // setState(() {
    //   DTS();
    // });
    // var tableItemsCount = dts.rowCount;
    // var defaultRowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    // var isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
    bool loading = false;
    Size size = MediaQuery.of(context).size;
    // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // Future<void> showInformationDialog(BuildContext context) async {
    //   return await showDialog(
    //       context: context,
    //       builder: (context) {
    //         final TextEditingController password = TextEditingController();
    //         return StatefulBuilder(builder: (context, setState) {
    //           return loading == true
    //               ? Center(child: CircularProgressIndicator())
    //               : AlertDialog(
    //                   elevation: 0,
    //                   backgroundColor: Colors.black,
    //                   title: Text('管理入员登录 Admin Login', style: kDialogText),
    //                   scrollable: true,
    //                   content: Form(
    //                       key: _formKey,
    //                       child: Column(
    //                         mainAxisSize: MainAxisSize.min,
    //                         children: [
    //                           SizedBox(
    //                             height: size.height * 0.02,
    //                           ),
    //                           Text('请输入密码 Please key in password ',
    //                               style: kDialogText),
    //                           SizedBox(
    //                             height: size.height * 0.06,
    //                           ),
    //                           TextFormField(
    //                             obscureText: true,
    //                             style: kDialogText,
    //                             keyboardType: TextInputType.name,
    //                             textInputAction: TextInputAction.done,
    //                             controller: password,
    //                             validator: (value) {
    //                               return value!.isNotEmpty
    //                                   ? null
    //                                   : "Invalid Field";
    //                             },
    //                             decoration: InputDecoration(
    //                                 hintText: "Enter Password Here",
    //                                 hintStyle: TextStyle(color: Colors.grey),
    //                                 fillColor: Colors.white),
    //                           ),
    //                         ],
    //                       )),
    //                   actions: <Widget>[
    //                     Row(
    //                       children: [
    //                         Expanded(
    //                           child: Container(
    //                             // height: size.height * 0.04,
    //                             // width: size.width * 0.2,
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(16.0),
    //                               color: kOrange,
    //                             ),
    //                             child: FlatButton(
    //                               onPressed: () {
    //                                 // Do something like updating SharedPreferences or User Settings etc.
    //                                 Navigator.pop(context);
    //                               },
    //                               child: Text(
    //                                 'Cancel',
    //                                 style: kDialogText,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           width: 10,
    //                         ),
    //                         Expanded(
    //                           child: Container(
    //                             // height: size.height * 0.04,
    //                             // width: size.width * 0.2,
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.circular(16.0),
    //                               color: kOrange,
    //                             ),
    //                             child: FlatButton(
    //                               onPressed: () async {
    //                                 if (_formKey.currentState!.validate()) {
    //                                   // Do something like updating SharedPreferences or User Settings etc.
    //                                   // Navigator.of(context).pop();
    //                                   setState(() => loading = true);
    //                                   try {
    //                                     print(password.text.trim());
    //                                     print(password.toString().trim());
    //                                     await _firebaseAuth
    //                                         .signInWithEmailAndPassword(
    //                                             email: 'admin@gmail.com',
    //                                             password: password.text);
    //                                     // Fluttertoast.showToast(
    //                                     //     msg: "Uploaded",
    //                                     //     toastLength: Toast.LENGTH_SHORT,
    //                                     //     gravity: ToastGravity.CENTER,
    //                                     //     timeInSecForIosWeb: 1,
    //                                     //     backgroundColor: Colors.redAccent,
    //                                     //     textColor: Colors.white,
    //                                     //     fontSize: 16.0,
    //                                     // );
    //                                   } on FirebaseAuthException catch (e) {
    //                                     setState(() => loading = false);
    //                                     if (e.code == "wrong-password") {
    //                                       Fluttertoast.showToast(
    //                                           msg: "Your password is incorrect",
    //                                           toastLength: Toast.LENGTH_SHORT,
    //                                           gravity: ToastGravity.CENTER,
    //                                           timeInSecForIosWeb: 1,
    //                                           backgroundColor: Colors.redAccent,
    //                                           textColor: Colors.white,
    //                                           fontSize: 16.0);
    //                                     }
    //                                   }
    //                                 }
    //                               },
    //                               child: Text(
    //                                 'Confirm',
    //                                 style: kDialogText,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 );
    //         });
    //       });
    // }

    // QuerySnapshot querySnapshot =
    //     FirebaseFirestore.instance.collection("collection").doc();
    // var list = querySnapshot.documents;
    // _rowsPerPage =
    //     isRowCountLessDefaultRowsPerPage ? tableItemsCount : defaultRowsPerPage;
    return Scaffold(
      backgroundColor: Color(0xfff6ca3b),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Center(
          child: Text('管理页面 Admin Page'),
        ),
        backgroundColor: Color(0xfff6ca3b),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Appointments on Date',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          width: 190,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime(2040, 12, 12),
                                  onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                setState(() {
                                  datee = '';
                                  for (int i = 0; i <= 10; i++) {
                                    datee = datee + date.toString()[i];
                                  }
                                });

                                print('confirm $date');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.en);
                            },
                            child: Text(
                              '$datee',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // PaginatedDataTable2(
                    //   columns: items,
                    //   source: DTS(),
                    //   onRowsPerPageChanged: (rowCount) {
                    //     setState(() {
                    //       _rowsPerPage1 = rowCount!;
                    //     });
                    //   },
                    //   rowsPerPage: isRowCountLessDefaultRowsPerPage
                    //       ? _rowsPerPage
                    //       : _rowsPerPage1,
                    // ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      color: Colors.transparent,
                      height: size.height * 0.42,
                      // width: 600,
                      child: FutureBuilder<DocumentSnapshot>(
                        future: _appointments.doc().get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          final a = FirebaseFirestore.instance
                              .collection('appointments');
                          final b = a.get().then((QuerySnapshot snapshot) {
                            snapshot.docs.forEach((DocumentSnapshot element) {
                              if (element.exists) {
                                Map<String, dynamic> data =
                                    element.data() as Map<String, dynamic>;
                                if (data['date'] == datee) {
                                  // dataRow.clear();
                                  dataRow.add(DataRow(cells: [
                                    // DataCell(Checkbox(
                                    //   value: false,
                                    //   onChanged: (bool? value) {
                                    //     setState(() {
                                    //       value = true;
                                    //     });
                                    //   },
                                    // )),
                                    DataCell(Text('${data['name']}')),
                                    DataCell(Text('${data['phoneNumber']}')),
                                    DataCell(Text('${data['numberOfPeople']}')),
                                  ]));
                                } else if (datee == 'select date') {
                                  dataRow.add(DataRow(cells: [
                                    // DataCell(Checkbox(
                                    //   value: false,
                                    //   onChanged: (bool? value) {
                                    //     setState(() {
                                    //       value = true;
                                    //     });
                                    //   },
                                    // )),
                                    DataCell(Text('${data['name']}')),
                                    DataCell(Text('${data['phoneNumber']}')),
                                    DataCell(Text('${data['numberOfPeople']}')),
                                  ]));
                                }
                                // print(
                                //     'Document data: ${documentSnapshot.data()}');
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Values not found.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.redAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                // Fluttertoast.showToast(
                                //     msg: "Check Internet Connection.",
                                //     toastLength: Toast.LENGTH_SHORT,
                                //     gravity: ToastGravity.CENTER,
                                //     timeInSecForIosWeb: 1,
                                //     backgroundColor: Colors.redAccent,
                                //     textColor: Colors.white,
                                //     fontSize: 16.0
                                // );
                                // return Text('Document does not exist on the database');
                              }

                              print(element.data());
                            });
                          });
                          //   .doc()
                          //   .get()
                          //   .then((DocumentSnapshot documentSnapshot) {
                          // if (documentSnapshot.exists) {
                          //   print(
                          //       'Document data: ${documentSnapshot.data()}');
                          // } else {
                          //   print('Document does not exist on the database');
                          // }
                          // });
                          // if (snapshot.hasError) {
                          //   return Text("Something went wrong");
                          // }
                          // if (snapshot.hasData && !snapshot.data!.exists) {
                          //   return Text("Document does not exist");
                          // }
                          // if (snapshot.connectionState ==
                          //     ConnectionState.done) {
                          //   Map<String, dynamic> data =
                          //       snapshot.data!.data() as Map<String, dynamic>;
                          //   FirebaseFirestore.instance
                          //       .collection('appointments')
                          //       .get()
                          //       .then((QuerySnapshot querySnapshot) {
                          //     querySnapshot.docs.forEach((doc) {
                          //       //print(doc["first_name"]);
                          //       dataRow.add(DataRow(cells: [
                          //         DataCell(Checkbox(
                          //           value: false,
                          //           onChanged: (bool? value) {
                          //             setState(() {
                          //               value = true;
                          //             });
                          //           },
                          //         )),
                          //         DataCell(Text('${data['name']}')),
                          //         DataCell(Text('${data['phoneNumber']}')),
                          //         DataCell(Text('${data['numberOfPeople']}')),
                          //       ]));
                          //     });
                          //   });
                          //
                          //   // dataRow.cells
                          //   //     .add(DataCell(Text('${data['name']}')));
                          //   // dataRow.cells
                          //   //     .add(DataCell(Text('${data['phoneNumber']}')));
                          //   // dataRow.cells.add(
                          //   //     DataCell(Text('${data['numberOfPeople']}')));
                          //   return DataTable2(
                          //     columns: items,
                          //     rows: dataRow,
                          //     columnSpacing: 1,
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //     ),
                          //   );
                          //   // return PaginatedDataTable2(
                          //   //   columns: items,
                          //   //   source: dataRow,
                          //   //   columnSpacing: 8.0,
                          //   //   onRowsPerPageChanged: (rowCount) {
                          //   //     setState(() {
                          //   //       _rowsPerPage1 = rowCount!;
                          //   //     });
                          //   //   },
                          //   //   rowsPerPage: isRowCountLessDefaultRowsPerPage
                          //   //       ? _rowsPerPage
                          //   //       : _rowsPerPage1,
                          //   // );
                          // }
                          return dataRow.isNotEmpty
                              ? DataTable2(
                                  columns: items,
                                  rows: dataRow,
                                  columnSpacing: 0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  dividerThickness: 4,
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                      // value: 0.8,
                                      ),
                                );
                        },
                      ),
                      // child: PaginatedDataTable2(
                      //   columns: items,
                      //   source: DTS(),
                      //   columnSpacing: 8.0,
                      //   onRowsPerPageChanged: (rowCount) {
                      //     setState(() {
                      //       _rowsPerPage1 = rowCount!;
                      //     });
                      //   },
                      //   rowsPerPage: isRowCountLessDefaultRowsPerPage
                      //       ? _rowsPerPage
                      //       : _rowsPerPage1,
                      // ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Number Of Massue availible',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: Card(
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 35,
                            ),
                            color: Colors.yellow.shade700,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 190,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime.now(),
                                      maxTime: DateTime(2040, 12, 12),
                                      onChanged: (date) {
                                    print('change $date');
                                  }, onConfirm: (date) {
                                    setState(() {
                                      messueDate = '';
                                      for (int i = 0; i <= 10; i++) {
                                        messueDate =
                                            messueDate + date.toString()[i];
                                      }
                                    });

                                    print('confirm $date');
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                child: Text(
                                  '$messueDate',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // DataTable2(columns: items, rows: dataRow as List<DataRow>),
                            Container(
                              width: 190,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: TextField(
                                controller: _numberOfPeopleController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Number of People',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          child: InkWell(
                            // onTap: () async {
                            //   await showInformationDialog(context);
                            //   final user = await FirebaseFirestore.instance
                            //       .collection('massueAvailible')
                            //       .add({
                            //     'numberOfPeople':
                            //         _numberOfPeopleController.text,
                            //     'date': messueDate,
                            //   }).then((value) {
                            //     Fluttertoast.showToast(
                            //       msg: "Uploading Done",
                            //       toastLength: Toast.LENGTH_SHORT,
                            //       gravity: ToastGravity.CENTER,
                            //       timeInSecForIosWeb: 1,
                            //       backgroundColor: Colors.redAccent,
                            //       textColor: Colors.white,
                            //       fontSize: 16.0,
                            //     );
                            //   }).catchError((onError) {
                            //     Fluttertoast.showToast(
                            //         msg: "Values not Added. Try Again",
                            //         toastLength: Toast.LENGTH_SHORT,
                            //         gravity: ToastGravity.CENTER,
                            //         timeInSecForIosWeb: 1,
                            //         backgroundColor: Colors.redAccent,
                            //         textColor: Colors.white,
                            //         fontSize: 16.0);
                            //   });
                            // },
                            child: Card(
                              child: Icon(
                                Icons.save,
                                color: Colors.white,
                                size: 35,
                              ),
                              color: Colors.yellow.shade700,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //space between Notification To Guest and upper textfield.
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Notification To Guest',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: Card(
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 35,
                            ),
                            color: Colors.yellow.shade700,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            // width: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 3),
                            child: TextField(
                              controller: _notificationController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Notification',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          child: Card(
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 35,
                            ),
                            color: Colors.yellow.shade700,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//
// class DTS extends DataTableSource {
//   final _appointments = FirebaseFirestore.instance.collection('appointments');
//   late DataRow dataRow;
//
//   @override
//   DataRow getRow(int index) {
//     FutureBuilder<DocumentSnapshot>(
//       future: _appointments.doc().get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }
//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return Text("Document does not exist");
//         }
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           dataRow.cells.add(
//             DataCell(Checkbox(
//               value: false,
//               onChanged: (bool? value) {
//                 value = true;
//               },
//             )),
//           );
//           dataRow.cells.add(DataCell(Text('${data['name']}')));
//           dataRow.cells.add(DataCell(Text('${data['phoneNumber']}')));
//           dataRow.cells.add(DataCell(Text('${data['numberOfPeople']}')));
//           return Text("Full Name: ${data['full_name']} ${data['last_name']}");
//         }
//         return CircularProgressIndicator();
//       },
//     );
//     return dataRow.cells.isEmpty
//         ? DataRow(cells: [DataCell(CircularProgressIndicator())])
//         : dataRow;
//     //   DataRow(cells: [
//     //   DataCell(Checkbox(
//     //     value: false,
//     //     onChanged: (bool? value) {
//     //       value = true;
//     //     },
//     //   )),
//     //   DataCell(Text('A' * (10 - (index + 5) % 10))),
//     //   DataCell(Text('B' * (10 - (index + 5) % 10))),
//     //   DataCell(Text('C' * (15 - (index + 5) % 10))),
//     // ]);
//   }
//
//   @override
//   int get rowCount => 100; // Manipulate this to which ever value you wish
//
//   @override
//   bool get isRowCountApproximate => false;
//
//   @override
//   int get selectedRowCount => 0;
// }
