import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets_sem.dart';

import '../mainbody/bodysem.dart';


class sem2 extends StatefulWidget {
  const sem2({Key? key}) : super(key: key);

  @override
  State<sem2> createState() => _sem2State();
}

class _sem2State extends State<sem2> {
  final String location_s2='/files/2nd_sem/semester2nd';
  final String location_p2='/files/2nd_sem/practical2nd';
  @override
  Widget build(BuildContext context) {
    return sem(text:'2nd sem' ,
      box1:Container(
        child: download_file(pathlocation: location_s2,),
      ) ,
      box2: Container(child:download_file(pathlocation: location_p2)),

    );
  }
}
