import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/widgets_sem.dart';

import '../mainbody/bodysem.dart';


class sem3 extends StatefulWidget {
  const sem3({Key? key}) : super(key: key);

  @override
  State<sem3> createState() => _sem3State();
}

class _sem3State extends State<sem3> {
  final String location_s3='/files/3rd_sem/practical3rd';
  final String location_p3='/files/3rd_sem/practical3rd';
  @override
  Widget build(BuildContext context) {
    return sem(text:'3rd sem' ,
      box1:Container(
        child:download_file(pathlocation: location_s3,),
      ) ,
      box2: Container(child:download_file(pathlocation: location_p3,)),
    );
  }
}
