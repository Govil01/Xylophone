import 'package:flutter/material.dart';


class TextInputField extends StatelessWidget {
  final TextEditingController mycontroller;
  final String labeltext;
  final String hinttext;
  final String? errortext;
  final TextInputType textinputtype;
  final bool isPass;
  final bool autofocus;
  final TextStyle? errorstyle;
  final VoidCallback? ontap;
  final Widget ?suffixicon;
  const TextInputField ({Key?key, required this.mycontroller, required this.labeltext, required this.hinttext, required this.textinputtype,  this.isPass=false,this.autofocus=false, this.ontap, this.suffixicon, this.errortext, this.errorstyle,  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder=OutlineInputBorder(
      borderSide: Divider.createBorderSide(context)
    );
    return TextFormField(
      controller: mycontroller,
      // focusNode: FocusNode(),
      // clipBehavior: Clip.antiAlias,
      onTap: ontap,
      autofocus: autofocus,
      obscureText: isPass,
      obscuringCharacter: '*',
      keyboardType: textinputtype,
      decoration:  InputDecoration(
        errorText: errortext,
        errorStyle: errorstyle,
        suffixIcon: suffixicon,
        border: inputBorder,
        labelText: labeltext,
        hintText: hinttext,
        // errorText: errortext,

      ),
    );
  }
}
