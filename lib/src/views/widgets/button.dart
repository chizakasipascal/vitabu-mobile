import 'package:flutter/material.dart';

typedef void OnPressed();

class Button extends StatelessWidget {
  final OnPressed onPressed;
  final String caption;

  const Button({Key key, @required this.onPressed, @required this.caption})
      : assert(caption != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: RaisedButton(
        elevation: 1,
        onPressed: onPressed,
        child: Text(
          caption,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
