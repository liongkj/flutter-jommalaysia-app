import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/widgets/bottom_navigation_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          child: Text(
            "Home",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          color: Colors.amber,
        ),
      ),
    );
  }
}
