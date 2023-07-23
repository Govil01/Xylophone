import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:instagram_clone/mainbody/bodysem.dart';
import 'package:instagram_clone/resources/auth_method.dart';
import 'package:instagram_clone/screens/loginpage.dart';
import 'package:instagram_clone/screens/signup.dart';
import 'package:instagram_clone/semester/sem1.dart';
import 'mainbody/mainpage.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  await FlutterDownloader.initialize(
      debug: true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );
  runApp(instagram());
}

class instagram extends StatefulWidget {
  @override
  State<instagram> createState() => _instagramState();
}

class _instagramState extends State<instagram> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIT Q&A',
      theme: ThemeData(primaryColor: Colors.blue),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.active)
            {
              if(snapshot.hasData){
                return const body();
              }
              else if(snapshot.hasError)
              {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
          return  Myscaffold();
          // return download_file();
        },
      ),
    );
  }
}


