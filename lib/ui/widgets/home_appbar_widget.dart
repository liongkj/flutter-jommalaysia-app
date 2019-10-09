import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/widgets/drowpdown_widget.dart';
import 'package:jommalaysia/ui/widgets/searchbar_widget.dart';

class HomeAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;

  HomeAppBarWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            DropdownWidget(),
            // SearchBarWidget(),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
