import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:xin_zheng_tcm/constants.dart';
// import 'package:xin_zheng_tcm/widgets/background_image.dart';

import 'background_image.dart';
import 'constants.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<String> options = <String>['Week1', 'Week2', 'Week3', 'Week4'];
  String dropdownValue = 'Week1';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          imagePath: 'images/background.jpeg',
          alignment: Alignment.bottomLeft,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kOrange,
                  ),
                  child: Icon(Icons.arrow_left),
                ),
              ),
            ),
            title: Text(
              '管理 Admin Page',
              style: kBodyText.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      'Appointment in week',
                      style: kAdminPageText,
                    ),
                    SizedBox(
                      width: size.width * 0.08,
                    ),
                    Container(
                      width: size.width * 0.4,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: DropdownButton<String>(
                            icon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 28.0, bottom: 18.0),
                              child: Icon(Icons.keyboard_arrow_down_outlined),
                            ),
                            underline: SizedBox(),
                            iconSize: 25.0,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                            ),
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            selectedItemBuilder: (BuildContext context) {
                              return options.map((String value) {
                                return Text(
                                  dropdownValue,
                                  style: const TextStyle(color: Colors.black87),
                                );
                              }).toList();
                            },
                            items: options
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      child: Text(
                    'Date',
                    style: kAdminPageText,
                  )),
                  Flexible(
                      child: Text(
                    'Appointment',
                    style: kAdminPageText,
                  )),
                  Flexible(
                      child: Text(
                    'Number PPL',
                    style: kAdminPageText,
                  )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
