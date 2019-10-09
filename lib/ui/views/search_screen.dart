import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/shared/app_theme.dart';
import 'package:jommalaysia/ui/widgets/category_grid.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBarWidget(),
      appBar: AppBar(
        title: Text(
          "Category",
          style: ThemeData.light().textTheme.title,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: CategoryGridWidget(),
    );
  }
}
