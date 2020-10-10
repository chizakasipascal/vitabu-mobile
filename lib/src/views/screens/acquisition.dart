import 'package:flutter/material.dart';

class AcquisitionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Acquisition"),
          automaticallyImplyLeading: true,
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        body: Center(
          child: Container(
            child: Text("ACQUISITION"),
          ),
        ),
      ),
    );
  }
}
