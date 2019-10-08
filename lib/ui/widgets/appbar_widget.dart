import 'package:flutter/material.dart';
import 'package:jommalaysia/core/constants/app_constants.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  AppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text(Name.APPNAME));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
