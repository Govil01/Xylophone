import 'package:flutter/material.dart';

class mainbox extends StatelessWidget {
  final String text;
  final Color fillcolor;
  final Color textcolor;

  final MaterialPageRoute callback;

  const mainbox({
    Key? key,
    required this.text,
    required this.fillcolor,
    required this.textcolor,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context, callback);
          },
          child: Container(
            height: 85,
            decoration: BoxDecoration(
                color: fillcolor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: textcolor,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
