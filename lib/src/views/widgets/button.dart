import 'package:flutter/material.dart';

typedef void OnPressed();

class Button extends StatelessWidget {
  final OnPressed onPressed;
  final String caption;

  const Button({Key key, this.onPressed, this.caption});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        elevation: 1,
        onPressed: onPressed,
        child: Text(caption),
      ),
    );
  }
}
