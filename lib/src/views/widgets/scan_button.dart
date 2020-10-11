import 'package:flutter/material.dart';

typedef void OnPressed();

class ScanButton extends StatelessWidget {
  final OnPressed onTap;
  final String caption;

  const ScanButton({Key key, @required this.onTap, @required this.caption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(caption),
                RichText(
                  text: TextSpan(
                    text: "Appuyer pour ",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).cursorColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "SCANNER",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Material(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: InkWell(
                  onTap: onTap,
                  child: SizedBox.expand(
                    child: Icon(
                      Icons.nfc_sharp,
                      color: Theme.of(context).cursorColor,
                      size: 34,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
