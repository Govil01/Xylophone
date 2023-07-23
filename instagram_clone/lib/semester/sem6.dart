import 'package:flutter/material.dart';
import 'package:instagram_clone/mainbody/bodysem.dart';
import 'package:instagram_clone/widgets/widgets_sem.dart';


class sem6 extends StatefulWidget {
  const sem6({Key? key}) : super(key: key);

  @override
  State<sem6> createState() => _sem6State();
}

class _sem6State extends State<sem6> {
  final String location_s6='/files/6th_sem/semester6th';
  final String location_p6='/files/6th_sem/practical6th';
  @override
  Widget build(BuildContext context) {
    return sem(text:'6th sem' ,
      box1:Container(
        child: download_file(pathlocation: location_s6,),
      ) ,
      box2: Container(
      child: download_file(pathlocation: location_p6,)),
    );
  }
}
