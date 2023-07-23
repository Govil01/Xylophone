import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets_sem.dart';

import '../mainbody/bodysem.dart';


class sem7 extends StatefulWidget {
  const sem7({Key? key}) : super(key: key);

  @override
  State<sem7> createState() => _sem7State();
}

class _sem7State extends State<sem7> {
  final String location_s7='/files/7th_sem/semester7th';
  final String location_p7='/files/7th_sem/practical7th';
  @override
  Widget build(BuildContext context) {
    return sem(text:'7th sem' ,
      box1:Container(
        child: download_file(pathlocation: location_s7),
      ) ,
      box2: Container(
        child:download_file(pathlocation: location_p7,)),
    );
  }
}
