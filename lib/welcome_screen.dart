// import 'package:xin_zheng_tcm/widgets/background_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zheng_zin_tcm/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'background_image.dart';
import 'constants.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool loading = false;
  bool containerLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    // await Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Future<void> showInformationDialog(BuildContext context) async {
      return await showDialog(
          context: context,
          builder: (context) {
            final TextEditingController password = TextEditingController();
            return StatefulBuilder(builder: (context, setState) {
              return loading == true
                  ? Center(child: CircularProgressIndicator())
                  : AlertDialog(
                      elevation: 0,
                      backgroundColor: Colors.black,
                      title: Text('管理入员登录 Admin Login', style: kDialogText),
                      scrollable: true,
                      content: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text('请输入密码 Please key in password ',
                                  style: kDialogText),
                              SizedBox(
                                height: size.height * 0.06,
                              ),
                              TextFormField(
                                obscureText: true,
                                style: kDialogText,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.done,
                                controller: password,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Invalid Field";
                                },
                                decoration: InputDecoration(
                                    hintText: "Enter Password Here",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.white),
                              ),
                            ],
                          )),
                      actions: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                // height: size.height * 0.04,
                                // width: size.width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: kOrange,
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    // Do something like updating SharedPreferences or User Settings etc.
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: kDialogText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                // height: size.height * 0.04,
                                // width: size.width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: kOrange,
                                ),
                                child: FlatButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      // Do something like updating SharedPreferences or User Settings etc.
                                      // Navigator.of(context).pop();
                                      setState(() => loading = true);
                                      try {
                                        print(password.text.trim());
                                        print(password.toString().trim());
                                        await _firebaseAuth
                                            .signInWithEmailAndPassword(
                                                email: 'admin@gmail.com',
                                                password: password.text);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage()),
                                        );
                                      } on FirebaseAuthException catch (e) {
                                        setState(() => loading = false);
                                        if (e.code == 'user-not-found') {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "No user found for that email",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.redAccent,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                        if (e.code == "wrong-password") {
                                          Fluttertoast.showToast(
                                              msg: "Your password is incorrect",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.redAccent,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                        if (e.code == "invalid-email") {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Email/Password Field cannot be Empty",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.redAccent,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      }
                                    }
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: kDialogText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
            });
          });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundImage(
            imagePath: 'images/background.jpeg',
            alignment: Alignment.center,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 27.0),
                    child: Image.asset(
                      'images/1.png',
                      width: size.width * 0.7,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.14,
                  ),
                  Center(
                    child: Text(
                      'Welcome To ',
                      style: kHeadText,
                    ),
                  ),
                  Center(
                    child: Text(
                      'Xin Zheng TCM',
                      style: kHeadText,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.18,
                  ),
                  FlatButton(
                    onPressed: () async {
                      await showInformationDialog(context);
                    },
                    child: Container(
                      height: size.height * 0.09,
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.orange.shade800,
                      ),
                      child: Center(
                        child: Text(
                          '登录  Admin Login',
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  FlatButton(
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      setState(() => containerLoading = true);
                      try {
                        await _firebaseAuth.signInWithEmailAndPassword(
                            email: 'guestlogin@gmail.com', password: '123456');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                      } on FirebaseAuthException catch (e) {
                        setState(() => containerLoading = false);
                      }
                      // }
                    },
                    child: Container(
                      height: size.height * 0.09,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Color(0xff9A1F0D),
                      ),
                      child: containerLoading == true
                          ? Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Center(child: CircularProgressIndicator()))
                          : Center(
                              child: Text(
                                '登录为客  Login as Guest',
                                style: kBodyText.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//
// containerLoading == true
// ? CircularProgressIndicator()
//     :
