import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Container(
        color: Colors.red,
        alignment: Alignment.bottomCenter,
        child: TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
