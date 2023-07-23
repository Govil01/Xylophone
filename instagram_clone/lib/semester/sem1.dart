import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets_sem.dart';

import '../mainbody/bodysem.dart';


class sem1 extends StatefulWidget {


  @override
  State<sem1> createState() => _sem1State();
}

class _sem1State extends State<sem1> {

  final String location_s1='/files/1st_sem/semester1st';
  final String location_p1='/files/1st_sem/practical1st';

  @override
  Widget build(BuildContext context) {
    return sem(text:'2nd sem' ,
      box1:Container(
        child: download_file(pathlocation: location_s1),
      ),
      box2: Container(child:download_file(pathlocation: location_p1,)),
    );
  }
}


