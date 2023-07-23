import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_clone/main.dart';
import 'package:instagram_clone/mainbody/mainpage.dart';

import '../mainbody/bodysem.dart';
import '../resources/auth_method.dart';
import '../ulits/ulitts.dart';
import '../widgets/TextField_input.dart';

class signUp_page extends StatefulWidget {
  const signUp_page({Key? key}) : super(key: key);

  @override
  State<signUp_page> createState() => _signUp_pageState();
}

class _signUp_pageState extends State<signUp_page> {
  TextEditingController email_id = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController username = TextEditingController();
  double _height = 150;
  double _heightsizedbox = 80;
  double x = 500;
  double y = 100;
  bool _isLoading = false;
  bool _isobscuretext = false;
  bool _isobscuretext2 = false;

  @override
  void dispose() {
    // TODO: implement dispose
    username.dispose();
    email_id.dispose();
    _password.dispose();
    confirm_password.dispose();

    // myFocusNode.dispose();

    super.dispose();
  }

  void signUpUser() async {
    // set loading to true
    if (_password.text == confirm_password.text) {
      setState(() {
        _isLoading = true;
      });
      // signup user using our authmethodds
      String res = await AuthMethods().signUpUser(
          email: email_id.text,
          password: confirm_password.text,
          username: username.text);
      // if string returned is sucess, user has been created
      if (res == "success") {
        setState(() {
          _isLoading = false;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const body()),
              (route) => false);
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> download_file()), (route) => false);
        });
        // navigate to the home screen
      } else {
        setState(() {
          _isLoading = false;
        });
        // show the error
        showSnackBar(context, res);
      }
    } else {
      showAlertDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        _heightsizedbox = 100;
        _height = 150;
      },
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 200,
                ),
                width: double.infinity,
                height: _height,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.elliptical(x, y)),
                ),
              ),
              SizedBox(
                height: _heightsizedbox,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: TextInputField(
                  mycontroller: username,
                  autofocus: true,
                  labeltext: 'Username',
                  hinttext: 'eg. jhonabram234',
                  textinputtype: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: TextInputField(
                  mycontroller: email_id,
                  labeltext: 'Email',
                  hinttext: 'eg. xyz@email.com',
                  textinputtype: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 6, 24, 6),
                child: TextInputField(
                  mycontroller: _password,
                  suffixicon: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_isobscuretext2 == true) {
                          _isobscuretext2 = false;
                        } else {
                          _isobscuretext2 = true;
                        }
                      });
                    },
                    child: Icon(
                      Icons.remove_red_eye,
                      color: _isobscuretext2 ? Colors.blue : Colors.grey,
                    ),
                  ),
                  labeltext: 'Password',
                  hinttext: 'eg. adcd78@#4rf',
                  isPass: _isobscuretext2 ? false : true,
                  textinputtype: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 5, 24, 5),
                child: TextInputField(
                  ontap: () {
                    _height = 200;
                    _heightsizedbox = 50;
                  },
                  suffixicon: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_isobscuretext == true) {
                          _isobscuretext = false;
                        } else {
                          _isobscuretext = true;
                        }
                      });
                    },
                    child: Icon(
                      Icons.remove_red_eye,
                      color: _isobscuretext ? Colors.blue : Colors.grey,
                    ),
                  ),
                  mycontroller: confirm_password,
                  labeltext: 'Confirm Password',
                  hinttext: 'Confirm Password',
                  isPass: _isobscuretext ? false : true,
                  textinputtype: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 7, 80, 7),
                child: GestureDetector(
                  onTap: signUpUser,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: !_isLoading
                        ? const Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => instagram()),
                            (route) => false);
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Invalid Password"),
    content: const Text("Try Again or Correcting the password"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
