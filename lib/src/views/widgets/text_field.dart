import 'package:flutter/material.dart';

Widget buildTextField(
      BuildContext context,
      String label, TextEditingController controller, bool enable, bool obscure,
      [TextInputType input = TextInputType.text]) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.transparent),
      child: TextFormField(
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          
          labelText: label,
          contentPadding: EdgeInsets.fromLTRB(13.0, 10.0, 30.0, 10.0),
          border: OutlineInputBorder(),
        ),
        //cursorColor: MainColor,
        enabled: enable,
        keyboardType: input
      ),
    );
  }