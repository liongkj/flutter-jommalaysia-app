import 'package:flutter/material.dart';
import 'package:jommalaysia/ui/widgets/my_appbar.dart';
import '../screens/trending.dart';
import '../../util/categories.dart';
import '../../util/friends.dart';
import '../../util/restaurants.dart';
import '../widgets/slide_item.dart';
import '../widgets/trending_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: MyAppBar(searchControl: _searchControl),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Text("Home"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}