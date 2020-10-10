import 'package:flutter/material.dart';

typedef String Validator(string);
typedef void OnSaved(string);

Widget buildTextBox(String hint,
    {Icon icon,
    Widget suffixIcon,
    TextEditingController controller,
    String label,
    Validator validator,
    OnSaved onSaved,
    TextInputType inputType = TextInputType.text,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 10.0),
    bool enable = true,
    bool isPassword = false}) {
  return TextFormField(
    enabled: enable,
    keyboardType: inputType,
    obscureText: isPassword,
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: contentPadding,
      labelText: label,
      hintText: hint,
      prefixIcon: icon,
      suffixIcon: suffixIcon,
    ),
    validator: validator,
    onSaved: onSaved,
  );
}
