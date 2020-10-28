import 'package:flutter/material.dart';

typedef String Validator(string);
typedef void OnSaved(string);
typedef void OnChanged(string);

Widget buildTextBox(String hint,
    {Icon icon,
    Widget suffixIcon,
    TextEditingController controller,
    String label,
    Validator validator,
    OnSaved onSaved,
    OnChanged onChanged,
    int maxLines = 1,
    TextInputType inputType = TextInputType.text,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
    bool enable = true,
    bool isPassword = false}) {
  return TextFormField(
    enabled: enable,
    keyboardType: inputType,
    obscureText: isPassword,
    controller: controller,
    maxLines: maxLines,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: contentPadding,
      labelText: label,
      hintText: hint,
      prefixIcon: icon,
      suffixIcon: suffixIcon,
    ),
    onChanged: onChanged,
    validator: validator,
    onSaved: onSaved,
  );
}
