import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_page.dart';

class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberOfPeopleController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String datee = 'Select Date';
  String timee = 'Select Time';
  String dropDownValue = 'Services';

  var items = [
    'Services',
    'acupuncture',
    'massage',
    'Pregnant Massage',
    'tuina-massage'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6ca3b),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text('预约 Book Appointment'),
        ),
        backgroundColor: Color(0xfff6ca3b),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 35,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          '选择服务',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          '人数',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          '姓名',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          '电话号码',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          '日期',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          '时隙',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          //Services
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: DropdownButton(
                              value: dropDownValue,
                              elevation: 10,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                    value: items, child: Text(items));
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropDownValue = newValue.toString();
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Number Of people
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
                          SizedBox(
                            height: 10,
                          ),
                          //Name
                          Container(
                            width: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: TextField(
                              controller: _nameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Your Name',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Phone number
                          Container(
                            width: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: TextField(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Phone Number',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.zero,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //Date
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
                          SizedBox(
                            height: 10,
                          ),
                          //Date
                          Container(
                            width: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                DatePicker.showTime12hPicker(context,
                                    showTitleActions: true,
                                    // minTime: DateTime.now(),
                                    // maxTime: DateTime(2040, 12, 12),
                                    onChanged: (time) {
                                  print('change $time');
                                }, onConfirm: (time) {
                                  setState(() {
                                    timee = '';
                                    for (int i = 10; i <= 15; i++) {
                                      timee = timee + time.toString()[i];
                                    }
                                  });

                                  print('confirm $time');
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                              child: Text(
                                '$timee',
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
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Your Appointment : No Active Appointment',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: FlatButton(
                      onPressed: () async {
                        final user = await FirebaseFirestore.instance
                            .collection('appointments')
                            .add({
                          'name': _nameController.text.toString(),
                          'numberOfPeople': _numberOfPeopleController.text,
                          'phoneNumber': _phoneNumberController.text.toString(),
                          'service': dropDownValue.trim(),
                          'date': datee,
                          'time': timee,
                        }).then((value) {
                          Fluttertoast.showToast(
                              msg: "Appointment Done",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.redAccent,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        }).catchError((onError) {
                          Fluttertoast.showToast(
                              msg: "Values not Added. Try Again",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.redAccent,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        });
                      },
                      color: Color(0xffFD6904),
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
