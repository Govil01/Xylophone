import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets_sem.dart';

import '../mainbody/bodysem.dart';


class sem8 extends StatefulWidget {


  @override
  State<sem8> createState() => _sem8State();
}

class _sem8State extends State<sem8> {
  final String location_s8='/files/3rd_sem/practical3rd';
  final String location_p8='/files/8th_sem/practical8th';
  @override
  Widget build(BuildContext context) {
    return sem(text:'8th sem' ,
      box1:Container(
        child: download_file(pathlocation: location_s8),
      ) ,
      box2: Container(
          child: download_file(pathlocation: location_p8,),),
    );
  }
}
