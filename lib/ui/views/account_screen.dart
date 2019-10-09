import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarWidget(),
      body: Center(
          child: Container(
        alignment: Alignment.center,
        height: 300,
        width: 300,
        child: Text(
          "Account",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        color: Colors.amber,
      )),
    );
  }
}
