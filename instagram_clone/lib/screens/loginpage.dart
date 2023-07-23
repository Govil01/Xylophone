import 'package:flutter/material.dart';
import 'package:instagram_clone/mainbody/bodysem.dart';
import 'package:instagram_clone/resources/auth_method.dart';
import 'package:instagram_clone/screens/signup.dart';
import 'package:instagram_clone/ulits/ulitts.dart';


import '../mainbody/mainpage.dart';



class Myscaffold extends StatefulWidget {
  @override
  State<Myscaffold> createState() => _MyscaffoldState();
}

class _MyscaffoldState extends State<Myscaffold> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool _isLoading =false;
  bool _isobscuretext =false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

void loginUser()async{
  setState(() {
    _isLoading=true;
  });
  String res=await AuthMethods().loginUser(email: nameController.text, password: passwordController.text);
  if(res=='success')
    {
      setState(() {
        _isLoading=false;
        Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context)=>const body()), (route) => false);
        // Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (context)=>download_file()), (route) => false);
      });
    }
  else
    {
      setState(() {
        _isLoading=false;
      });
      showSnackBar(context, res);
    }
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,


            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(500, 100),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'SIT Q&A',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'User Name '),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: passwordController,
                    decoration:  InputDecoration(
                      // suffixIconColor: Colors.white24,
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            if(_isobscuretext==true)
                            {
                              _isobscuretext=false;
                            }
                            else {
                              _isobscuretext = true;
                            }
                          });

                        },child: Icon(Icons.remove_red_eye,
                        color: _isobscuretext? Colors.blue:Colors.grey,
                      ),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    obscureText: _isobscuretext? false:true,
                    obscuringCharacter: '*',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // color: Colors.orange,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: GestureDetector(
                    onTap: loginUser,
                    child: !_isLoading? const Text(
                      'Log in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ):const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Does not have account?'),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const signUp_page()),(route)=>false);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

