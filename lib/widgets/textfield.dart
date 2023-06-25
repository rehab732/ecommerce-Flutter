import 'package:flutter/material.dart';

import '../constants/colors.dart';

class customtextfield extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function(String?) onClick;
  String? _formatestring(String str) {
    switch (hint) {
      case 'Enter Your Name':
        return 'Must Enter Name';
      case 'Enter Your Email':
        return 'Must Enter Email';
      case 'Enter Your password':
        return 'Must Enter Password';
    }
  }

  const customtextfield({required this.onClick,required this.icon, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return _formatestring(hint);
          }
        },
        onSaved: onClick,
        cursorColor: redcolor,
        obscureText: hint == 'Enter Your password' ? true : false,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: redcolor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: redcolor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: redcolor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            )),
      ),
    );
  }
}
