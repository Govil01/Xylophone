import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/mainbody/mainpage.dart';
import '../resources/auth_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/auth_method.dart';

//
class GetUserName extends StatefulWidget {
  @override
  State<GetUserName> createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  final String documentId = FirebaseAuth.instance.currentUser!.uid.toString();
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white60,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const body()));
          },
          icon: const Icon(Icons.arrow_back),
          splashRadius: 0.1,
        ),
        // actions: [
        //   IconButton(onPressed: (){
        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>setting()));
        //   }, icon: Icon(Icons.edit_outlined),splashRadius: 0.1,)
        // ],
        actionsIconTheme: IconThemeData(
          color: Colors.red.shade400,
        ),
        iconTheme: IconThemeData(
          color: Colors.blue.shade300,
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.blue.shade200,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          '${data['email']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline_outlined,
                          color: Colors.blue.shade300,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          '${data['username']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

// Text("Full Name: ${data['email']} ${data['username']}")