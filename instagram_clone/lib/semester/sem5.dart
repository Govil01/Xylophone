import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets_sem.dart';

import '../mainbody/bodysem.dart';


class sem5 extends StatefulWidget {
  const sem5({Key? key}) : super(key: key);

  @override
  State<sem5> createState() => _sem5State();
}

class _sem5State extends State<sem5> {
  final String location_s5='/files/5th_sem/semester5th';
  final String location_p5='/files/5th_sem/practical5th';
  @override
  Widget build(BuildContext context) {
    return sem(text:'5th sem' ,
      box1:Container(
        child: download_file(pathlocation: location_s5,),
      ) ,
      box2: Container(
          child: download_file(pathlocation: location_p5)),
    );
  }
}
