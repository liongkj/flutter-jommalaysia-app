import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/widgets/home/search_bar.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  MyAppBar({
    Key key,
    @required TextEditingController searchControl,
  })  : _searchControl = searchControl,
        super(key: key);

  final TextEditingController _searchControl;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: SearchBar(
          searchControl: _searchControl,
        ),
      ),
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        60.0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
