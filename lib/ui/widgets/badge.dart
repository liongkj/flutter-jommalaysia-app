import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    this.text,
    this.color,
    Key key,
  }) : super(key: key);

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 6.0,
      left: 6.0,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
