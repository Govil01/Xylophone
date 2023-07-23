import 'package:flutter/material.dart';

class newdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(25.0)),
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.bottomLeft,
            child: DrawerHeader(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(),
              child:
                  Text('Your Image or \nA Background Image Will Be Set Here'),
            ),
          ),
          const Divider(),
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Terms & Conditions',
                )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Feedback',
                )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Help',
                )),
          )
        ],
      ),
    );
  }
}
