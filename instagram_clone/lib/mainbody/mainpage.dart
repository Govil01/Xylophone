import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/widgets.dart';
import 'package:instagram_clone/mainbody/account.dart';
import 'package:instagram_clone/mainbody/bodysem.dart';
import 'package:instagram_clone/resources/auth_method.dart';
import 'package:instagram_clone/widgets/widgets_mainpage.dart';
import 'package:instagram_clone/semester/sem1.dart';
import 'package:instagram_clone/semester/sem2.dart';
import 'package:instagram_clone/semester/sem3.dart';
import 'package:instagram_clone/semester/sem4.dart';
import 'package:instagram_clone/semester/sem5.dart';
import 'package:instagram_clone/semester/sem6.dart';
import 'package:instagram_clone/semester/sem7.dart';
import 'package:instagram_clone/semester/sem8.dart';

import '../screens/loginpage.dart';
import '../ulits/newdrawer.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> with TickerProviderStateMixin {
  bool _isplay = false;
  late AnimationController animatedcontroller;
  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    animatedcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    animatedcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animatedcontroller.reverse();
        _isplay = false;
      },
      child: Scaffold(
        key: scaffoldkey,
        drawerEnableOpenDragGesture: false,
        drawer: newdrawer(), // drawerEnableOpenDragGesture: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.transparent,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          iconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            PopupMenuButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                itemBuilder: (context) => [
                      PopupMenuItem(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GetUserName()));
                          // builder: (context) => userprofile()));
                        },
                        child: const Text(
                          'Account',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )),
                      PopupMenuItem(
                          child: GestureDetector(
                        onTap: () async {
                          await AuthMethods().signOut();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => Myscaffold()),
                              (Route<dynamic> route) => false);
                        },
                        child: const Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ))
                    ])
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Row(
              children: [
                mainbox(
                  text: '1st Semester',
                  fillcolor: Colors.blue,
                  textcolor: Colors.white,
                  callback: MaterialPageRoute(builder: (context) => sem1()),
                ),
                mainbox(
                  text: '2nd Semester',
                  fillcolor: Colors.blue,
                  textcolor: Colors.white,
                  callback:
                      MaterialPageRoute(builder: (context) => const sem2()),
                ),
              ],
            ),
            Row(
              children: [
                mainbox(
                  text: '3rd Semester',
                  fillcolor: Colors.blue,
                  textcolor: Colors.white,
                  callback:
                      MaterialPageRoute(builder: (context) => const sem3()),
                ),
                mainbox(
                  text: '4th Semester',
                  fillcolor: Colors.blue,
                  textcolor: Colors.white,
                  callback:
                      MaterialPageRoute(builder: (context) => const sem4()),
                ),
              ],
            ),
            Row(
              children: [
                mainbox(
                  text: '5th Semester',
                  fillcolor: Colors.blue,
                  textcolor: Colors.white,
                  callback:
                      MaterialPageRoute(builder: (context) => const sem5()),
                ),
                mainbox(
                  text: '6th Semester',
                  fillcolor: Colors.blue,
                  textcolor: Colors.white,
                  callback:
                      MaterialPageRoute(builder: (context) => const sem6()),
                ),
              ],
            ),
            Row(
              children: [
                mainbox(
                  text: '7th Semester',
                  fillcolor: Colors.blue,
                  textcolor: Colors.white,
                  callback:
                      MaterialPageRoute(builder: (context) => const sem7()),
                ),
                mainbox(
                  text: '8th Semester',
                  fillcolor: Colors.blue,
                  textcolor: Colors.white,
                  callback: MaterialPageRoute(builder: (context) => sem8()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
