import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets_sem.dart';

import '../mainbody/bodysem.dart';


class sem4 extends StatefulWidget {
  const sem4({Key? key}) : super(key: key);

  @override
  State<sem4> createState() => _sem4State();
}

class _sem4State extends State<sem4> {
  final String location_s4='/files/4th_sem/semester4th';
  final String location_p4='/files/4th_sem/practical4th';
  @override
  Widget build(BuildContext context) {
    return sem(text:'4th sem' ,
      box1:Container(
        child: download_file(pathlocation:location_s4),
      ) ,
      box2: Container(child:download_file(pathlocation:location_p4)),
    );
  }
}
